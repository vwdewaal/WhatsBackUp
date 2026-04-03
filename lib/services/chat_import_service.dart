import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:archive/archive_io.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;

import '../models/chat_models.dart';
import 'chat_message_store.dart';

typedef ProgressCallback = void Function(double progress);

class ChatImportService {
  final Map<String, _AttachmentIndex> _attachmentIndexCache =
      <String, _AttachmentIndex>{};

  static const String _metadataFileName = 'metadata.json';
  static const String errorOnlyZip = 'error_only_zip';
  static const String errorNoChatText = 'error_no_chat_text';
  static const String errorChatAlreadyImported = 'error_chat_already_imported';
  static const String errorChatFileNotFound = 'error_chat_file_not_found';
  static const int _largeChatBytesThreshold = 50 * 1024 * 1024;
  static const String _stagedZipFileName = '_import_source.zip';

  String normalizeArchiveName(String input) => _normalizeArchiveName(input);

  Future<List<String>> pickZipPaths({bool allowMultiple = false}) async {
    final FilePickerResult? picked = await FilePicker.platform.pickFiles(
      dialogTitle: 'Select WhatsApp export ZIPs',
      type: FileType.custom,
      allowedExtensions: <String>['zip'],
      withData: false,
      allowMultiple: allowMultiple,
      lockParentWindow: true,
    );

    if (picked == null) {
      return <String>[];
    }
    return picked.files
        .map((PlatformFile file) => file.path)
        .whereType<String>()
        .toList();
  }

  Future<String?> pickZipPath() async {
    final List<String> paths = await pickZipPaths();
    if (paths.isEmpty) {
      return null;
    }
    return paths.first;
  }

  Future<PreparedImport?> importZip({
    required Directory archivesRoot,
    ProgressCallback? onProgress,
  }) async {
    final String? zipPath = await pickZipPath();
    if (zipPath == null) {
      return null;
    }

    return prepareImportFromPath(
      archivesRoot: archivesRoot,
      zipPath: zipPath,
      onProgress: onProgress,
    );
  }

  Future<PreparedImport> prepareImportFromPath({
    required Directory archivesRoot,
    required String zipPath,
    ProgressCallback? onProgress,
  }) async {
    if (!zipPath.toLowerCase().endsWith('.zip')) {
      throw const FormatException(errorOnlyZip);
    }

    final String importedName = _normalizeArchiveName(
      p.basenameWithoutExtension(zipPath),
    );
    final String archiveId =
        'pending_${DateTime.now().millisecondsSinceEpoch}';
    final Directory targetDir = Directory(p.join(archivesRoot.path, archiveId));

    if (!targetDir.existsSync()) {
      targetDir.createSync(recursive: true);
    }

    final String stagedZipPath = await _stageZipForImport(
      sourceZipPath: zipPath,
      targetDir: targetDir,
    );

    await _extractZipInIsolate(
      zipPath: stagedZipPath,
      targetPath: targetDir.path,
      onProgress: onProgress,
    );

    _annotateOmittedMediaReferencesFromZip(
      zipPath: stagedZipPath,
      extractedRoot: targetDir.path,
    );

    final File? chatText = _findChatTextFile(targetDir);
    if (chatText == null) {
      throw const FormatException(errorNoChatText);
    }

    final String derivedName = _deriveName(chatText);
    final String finalName = importedName.isEmpty ? derivedName : importedName;

    return PreparedImport(
      tempDirPath: targetDir.path,
      chatFilePath: chatText.path,
      derivedName: derivedName,
      finalName: finalName,
      zipPath: stagedZipPath,
    );
  }

  Future<PreparedImport> prepareImportTextOnlyFromPath({
    required Directory archivesRoot,
    required String zipPath,
    ProgressCallback? onProgress,
  }) async {
    if (!zipPath.toLowerCase().endsWith('.zip')) {
      throw const FormatException(errorOnlyZip);
    }

    final String importedName = _normalizeArchiveName(
      p.basenameWithoutExtension(zipPath),
    );
    final String archiveId =
        'pending_${DateTime.now().millisecondsSinceEpoch}';
    final Directory targetDir = Directory(p.join(archivesRoot.path, archiveId));

    if (!targetDir.existsSync()) {
      targetDir.createSync(recursive: true);
    }

    final String stagedZipPath = await _stageZipForImport(
      sourceZipPath: zipPath,
      targetDir: targetDir,
    );

    await _extractZipTextOnlyInIsolate(
      zipPath: stagedZipPath,
      targetPath: targetDir.path,
      onProgress: onProgress,
    );

    _annotateOmittedMediaReferencesFromZip(
      zipPath: stagedZipPath,
      extractedRoot: targetDir.path,
    );

    final File? chatText = _findChatTextFile(targetDir);
    if (chatText == null) {
      throw const FormatException(errorNoChatText);
    }

    final String derivedName = _deriveName(chatText);
    final String finalName = importedName.isEmpty ? derivedName : importedName;

    return PreparedImport(
      tempDirPath: targetDir.path,
      chatFilePath: chatText.path,
      derivedName: derivedName,
      finalName: finalName,
      zipPath: stagedZipPath,
    );
  }

  Future<ChatArchive> finalizeNewImport({
    required Directory archivesRoot,
    required PreparedImport prepared,
  }) async {
    final String archiveId = DateTime.now().millisecondsSinceEpoch.toString();
    final Directory targetDir =
        Directory(p.join(archivesRoot.path, archiveId));
    final Directory tempDir = Directory(prepared.tempDirPath);

    if (targetDir.existsSync()) {
      targetDir.deleteSync(recursive: true);
    }
    tempDir.renameSync(targetDir.path);

    final String relativeChatPath =
        p.relative(prepared.chatFilePath, from: prepared.tempDirPath);
    final String finalChatPath = p.join(targetDir.path, relativeChatPath);

    final ChatArchive archive = ChatArchive(
      id: archiveId,
      name: prepared.finalName,
      sourceName: prepared.derivedName,
      folderPath: targetDir.path,
      chatFilePath: finalChatPath,
      createdAt: DateTime.now(),
    );

    final File metadata = File(p.join(targetDir.path, _metadataFileName));
    metadata.writeAsStringSync(archive.serialize());
    return archive;
  }

  Future<bool> shouldUseMessageStore(ChatArchive archive) async {
    final File storeFile = File(p.join(archive.folderPath, 'chat.db'));
    if (storeFile.existsSync()) {
      return true;
    }
    final int totalBytes = await _chatFilesTotalBytes(
      <String>[archive.chatFilePath, ...archive.additionalChatFiles],
    );
    return totalBytes >= _largeChatBytesThreshold;
  }

  Future<void> invalidateMessageStore(ChatArchive archive) async {
    final File storeFile = File(p.join(archive.folderPath, 'chat.db'));
    if (storeFile.existsSync()) {
      storeFile.deleteSync();
    }
  }

  Future<void> buildMessageStore({
    required ChatArchive archive,
    ProgressCallback? onProgress,
  }) async {
    final ChatMessageStore store =
        await ChatMessageStore.openForArchive(archive);
    try {
      await store.reset();
      final List<String> sources = <String>[
        archive.chatFilePath,
        ...archive.additionalChatFiles,
      ];
      final int totalBytes = await _chatFilesTotalBytes(sources);
      final _AttachmentIndex attachmentIndex =
          _AttachmentIndex.build(archive.folderPath);
      int processedBytes = 0;
      int messageCount = 0;
      final List<ChatMessage> batch = <ChatMessage>[];

      Map<String, Object?>? current;

      for (final String chatFilePath in sources) {
        final File source = File(chatFilePath);
        if (!source.existsSync()) {
          continue;
        }

        final Stream<String> lines = source
            .openRead()
            .transform(utf8.decoder)
            .transform(const LineSplitter());

        await for (final String rawLine in lines) {
          processedBytes += rawLine.length + 1;
          final String normalizedLine = _normalizeForParsingIsolate(rawLine);
          final Map<String, Object?>? parsed = _tryParseNewMessageIsolate(
            normalizedLine,
            attachmentIndex,
          );
          if (parsed != null) {
            if (current != null) {
              batch.add(_mapToMessage(current));
              messageCount += 1;
            }
            current = parsed;
          } else if (current != null) {
            current = <String, Object?>{
              'timestamp': current['timestamp'],
              'sender': current['sender'],
              'text': '${current['text']}\n$normalizedLine',
              'type': current['type'],
              'attachmentPath': current['attachmentPath'],
            };
          }

          if (batch.length >= 500) {
            await store.insertBatch(batch);
            batch.clear();
            if (onProgress != null && totalBytes > 0) {
              onProgress((processedBytes / totalBytes).clamp(0.0, 1.0));
            }
            await Future<void>.delayed(Duration.zero);
          }
        }

        if (current != null) {
          batch.add(_mapToMessage(current));
          messageCount += 1;
          current = null;
        }
      }

      if (batch.isNotEmpty) {
        await store.insertBatch(batch);
        batch.clear();
      }

      await store.setBuilt(messageCount: messageCount);
      if (onProgress != null) {
        onProgress(1.0);
      }
    } finally {
      await store.close();
    }
  }

  ChatMessage _mapToMessage(Map<String, Object?> parsed) {
    final int? timestampMs = parsed['timestamp'] as int?;
    return ChatMessage(
      timestamp: timestampMs == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(timestampMs),
      sender: parsed['sender'] as String,
      text: parsed['text'] as String,
      type: ChatMessageType.values[parsed['type'] as int],
      attachmentPath: parsed['attachmentPath'] as String?,
    );
  }

  Future<int> _chatFilesTotalBytes(List<String> paths) async {
    int total = 0;
    for (final String path in paths) {
      final File file = File(path);
      if (file.existsSync()) {
        total += await file.length();
      }
    }
    return total;
  }

  Future<IncrementalImportResult> finalizeIncrementalImport({
    required Directory archivesRoot,
    required PreparedImport prepared,
    required ChatArchive existing,
  }) async {
    final String importId = DateTime.now().millisecondsSinceEpoch.toString();
    final Directory targetDir = Directory(
      p.join(existing.folderPath, 'imports', importId),
    );
    targetDir.createSync(recursive: true);

    final Directory tempDir = Directory(prepared.tempDirPath);
    tempDir.renameSync(targetDir.path);

    final String relativeChatPath =
        p.relative(prepared.chatFilePath, from: prepared.tempDirPath);
    final String relativeZipPath =
        p.relative(prepared.zipPath, from: prepared.tempDirPath);
    return IncrementalImportResult(
      importRootPath: targetDir.path,
      chatFilePath: p.join(targetDir.path, relativeChatPath),
      zipPath: p.join(targetDir.path, relativeZipPath),
    );
  }

  Future<void> discardPreparedImport(PreparedImport prepared) async {
    final Directory tempDir = Directory(prepared.tempDirPath);
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  }

  ParsedChat parseArchive(ChatArchive archive) {
    final List<String> sources = <String>[
      archive.chatFilePath,
      ...archive.additionalChatFiles,
    ];
    final List<String> lines = <String>[];
    for (final String path in sources) {
      final File source = File(path);
      if (!source.existsSync()) {
        continue;
      }
      lines.addAll(source.readAsLinesSync());
    }
    final List<ChatMessage> messages = <ChatMessage>[];
    final Map<String, int> seenMessageIndexes = <String, int>{};
    final Set<String> senders = <String>{};

    ChatMessage? current;

    for (final String rawLine in lines) {
      final String normalizedLine = _normalizeForParsing(rawLine);
      final _ParsedLine? parsed = _tryParseNewMessage(
        normalizedLine,
        archive.folderPath,
      );
      if (parsed != null) {
        if (current != null) {
          _addParsedMessageIfBetter(current, messages, seenMessageIndexes);
        }
        current = parsed.message;
        if (parsed.message.sender.isNotEmpty &&
            parsed.message.sender != 'System') {
          senders.add(parsed.message.sender);
        }
        continue;
      }

      if (current != null) {
        current = ChatMessage(
          timestamp: current.timestamp,
          sender: current.sender,
          text: '${current.text}\n$normalizedLine',
          type: current.type,
          attachmentPath: current.attachmentPath,
        );
      }
    }

    if (current != null) {
      _addParsedMessageIfBetter(current, messages, seenMessageIndexes);
    }

    return ParsedChat(
      archive: archive,
      messages: messages,
      senders: senders.toList()..sort(),
    );
  }

  Future<ParsedChat> parseArchiveAsync(ChatArchive archive) async {
    final List<String> chatFilePaths = <String>[
      archive.chatFilePath,
      ...archive.additionalChatFiles,
    ];
    final Map<String, Object?> data = await compute(
      _parseArchiveInIsolate,
      <String, Object?>{
        'chatFilePaths': chatFilePaths,
        'folderPath': archive.folderPath,
      },
    );

    final List<dynamic> rawMessages = data['messages'] as List<dynamic>;
    final List<ChatMessage> messages = rawMessages.map((dynamic entry) {
      final Map<String, Object?> map = Map<String, Object?>.from(
        entry as Map<Object?, Object?>,
      );
      final int? timestampMs = map['timestamp'] as int?;
      return ChatMessage(
        timestamp: timestampMs == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(timestampMs),
        sender: map['sender'] as String,
        text: map['text'] as String,
        type: ChatMessageType.values[map['type'] as int],
        attachmentPath: map['attachmentPath'] as String?,
      );
    }).toList();

    final List<String> senders =
        List<String>.from(data['senders'] as List<dynamic>)..sort();

    return ParsedChat(
      archive: archive,
      messages: messages,
      senders: senders,
    );
  }

  File? _findChatTextFile(Directory root) {
    final List<FileSystemEntity> all = root.listSync(recursive: true);
    final List<File> candidates = all
        .whereType<File>()
        .where((File file) =>
            !_isIgnoredExtractedPath(file.path, root.path) &&
            file.path.toLowerCase().endsWith('.txt') &&
            !p.basename(file.path).startsWith('.'))
        .toList();

    if (candidates.isEmpty) {
      return null;
    }

    candidates.sort((File a, File b) {
      final String nameA = p.basename(a.path).toLowerCase();
      final String nameB = p.basename(b.path).toLowerCase();

      final int scoreA = nameA.contains('chat') ? 0 : 1;
      final int scoreB = nameB.contains('chat') ? 0 : 1;

      if (scoreA != scoreB) {
        return scoreA.compareTo(scoreB);
      }
      return nameA.compareTo(nameB);
    });

    return candidates.first;
  }

  String _deriveName(File chatFile) {
    final String base = p.basenameWithoutExtension(chatFile.path);
    if (base == '_chat') {
      return _normalizeArchiveName(p.basename(p.dirname(chatFile.path)));
    }
    return _normalizeArchiveName(base);
  }

  String _normalizeArchiveName(String input) {
    String value = input.trim();
    value = value.replaceFirst(
      RegExp(r'^whatsapp chat -\s*', caseSensitive: false),
      '',
    );
    value = value.replaceFirst(
      RegExp(r'\.zip$', caseSensitive: false),
      '',
    );
    return value.trim();
  }

  Future<void> _extractZipInIsolate({
    required String zipPath,
    required String targetPath,
    ProgressCallback? onProgress,
  }) async {
    final ReceivePort receivePort = ReceivePort();
    final Completer<void> completer = Completer<void>();

    receivePort.listen((Object? message) {
      if (message is double) {
        onProgress?.call(message.clamp(0.0, 1.0));
      } else if (message is Map) {
        if (message['type'] == 'done') {
          completer.complete();
          receivePort.close();
        } else if (message['type'] == 'error') {
          final String error = message['error'] as String? ?? 'unknown';
          final String stack = message['stack'] as String? ?? '';
          completer.completeError(Exception(error), StackTrace.fromString(stack));
          receivePort.close();
        }
      }
    });

    await Isolate.spawn(
      _extractZipWorker,
      <String, Object?>{
        'sendPort': receivePort.sendPort,
        'zipPath': zipPath,
        'targetPath': targetPath,
      },
    );

    await completer.future;
  }

  Future<void> _extractZipTextOnlyInIsolate({
    required String zipPath,
    required String targetPath,
    ProgressCallback? onProgress,
  }) async {
    final ReceivePort receivePort = ReceivePort();
    final Completer<void> completer = Completer<void>();

    receivePort.listen((Object? message) {
      if (message is double) {
        onProgress?.call(message.clamp(0.0, 1.0));
      } else if (message is Map) {
        if (message['type'] == 'done') {
          completer.complete();
          receivePort.close();
        } else if (message['type'] == 'error') {
          final String error = message['error'] as String? ?? 'unknown';
          final String stack = message['stack'] as String? ?? '';
          completer.completeError(Exception(error), StackTrace.fromString(stack));
          receivePort.close();
        }
      }
    });

    await Isolate.spawn(
      _extractZipTextWorker,
      <String, Object?>{
        'sendPort': receivePort.sendPort,
        'zipPath': zipPath,
        'targetPath': targetPath,
      },
    );

    await completer.future;
  }

  Future<void> extractMediaFromZip({
    required String zipPath,
    required String targetDir,
    required int startIndex,
    required Future<void> Function(int processed, int total) onProgress,
  }) async {
    final ReceivePort receivePort = ReceivePort();
    final Completer<void> completer = Completer<void>();

    receivePort.listen((Object? message) async {
      if (message is Map) {
        final String? type = message['type'] as String?;
        if (type == 'progress') {
          final int processed = message['processed'] as int? ?? 0;
          final int total = message['total'] as int? ?? 0;
          await onProgress(processed, total);
        } else if (type == 'done') {
          completer.complete();
          receivePort.close();
        } else if (type == 'error') {
          final String error = message['error'] as String? ?? 'unknown';
          final String stack = message['stack'] as String? ?? '';
          completer.completeError(Exception(error), StackTrace.fromString(stack));
          receivePort.close();
        }
      }
    });

    await Isolate.spawn(
      _extractZipMediaWorker,
      <String, Object?>{
        'sendPort': receivePort.sendPort,
        'zipPath': zipPath,
        'targetPath': targetDir,
        'startIndex': startIndex,
      },
    );

    await completer.future;
  }

  bool _hasDuplicateArchive({
    required Directory archivesRoot,
    required String name,
  }) {
    final String normalized = _normalizeArchiveName(name);
    if (normalized.isEmpty) {
      return false;
    }
    final List<Directory> dirs = archivesRoot
        .listSync()
        .whereType<Directory>()
        .toList();
    for (final Directory dir in dirs) {
      final File metadata = File(p.join(dir.path, _metadataFileName));
      if (!metadata.existsSync()) {
        continue;
      }
      try {
        final ChatArchive archive =
            ChatArchive.deserialize(metadata.readAsStringSync());
        final String existing = _normalizeArchiveName(archive.name);
        if (existing.isNotEmpty && existing == normalized) {
          return true;
        }
      } catch (_) {
        // Ignore malformed metadata.
      }
    }
    return false;
  }

  _ParsedLine? _tryParseNewMessage(String line, String archiveRoot) {
    final RegExp modernFormat = RegExp(
      r'^\[(\d{1,2}/\d{1,2}/\d{2,4}), (\d{1,2}:\d{2}(?::\d{2})?(?:\s?[APMapm]{2})?)\] (.+)$',
    );
    final RegExp legacyFormat = RegExp(
      r'^(\d{1,2}/\d{1,2}/\d{2,4}), (\d{1,2}:\d{2}(?::\d{2})?(?:\s?[APMapm]{2})?) - (.+)$',
    );

    RegExpMatch? match = modernFormat.firstMatch(line);
    match ??= legacyFormat.firstMatch(line);
    if (match == null) {
      return null;
    }

    final String datePart = match.group(1)!;
    final String timePart = match.group(2)!;
    final String body = _normalizeForParsing(match.group(3)!);

    final int splitIndex = body.indexOf(': ');
    String sender;
    String text;

    if (splitIndex == -1) {
      sender = 'System';
      text = body;
    } else {
      sender = body.substring(0, splitIndex).trim();
      text = body.substring(splitIndex + 2).trim();
    }

    final DateTime? timestamp = _parseDateTime(datePart, timePart);
    final String? attachment = _extractAttachmentName(text);
    final String? attachmentPath = attachment == null
        ? null
        : _findAttachmentPath(archiveRoot: archiveRoot, attachmentName: attachment);

    final ChatMessageType type = _classifyType(
      text: text,
      attachmentPath: attachmentPath,
      attachmentName: attachment,
    );

    return _ParsedLine(
      ChatMessage(
        timestamp: timestamp,
        sender: sender,
        text: text,
        type: sender == 'System' ? ChatMessageType.system : type,
        attachmentPath: attachmentPath,
      ),
    );
  }

  DateTime? _parseDateTime(String datePart, String timePart) {
    final List<String> dateTokens = datePart.split('/');
    if (dateTokens.length != 3) {
      return null;
    }

    // WhatsApp exports are dd/mm/yyyy for this app.
    int day = int.tryParse(dateTokens[0]) ?? 1;
    int month = int.tryParse(dateTokens[1]) ?? 1;
    int year = int.tryParse(dateTokens[2]) ?? DateTime.now().year;

    if (year < 100) {
      year += 2000;
    }

    final RegExp timePattern = RegExp(r'^(\d{1,2}):(\d{2})(?::(\d{2}))?\s*([APMapm]{2})?$');
    final RegExpMatch? tm = timePattern.firstMatch(timePart.trim());
    if (tm == null) {
      return null;
    }

    int hour = int.tryParse(tm.group(1) ?? '0') ?? 0;
    final int minute = int.tryParse(tm.group(2) ?? '0') ?? 0;
    final int second = int.tryParse(tm.group(3) ?? '0') ?? 0;
    final String? marker = tm.group(4)?.toLowerCase();

    if (marker == 'pm' && hour < 12) {
      hour += 12;
    }
    if (marker == 'am' && hour == 12) {
      hour = 0;
    }

    if (month < 1 || month > 12) {
      month = 1;
    }
    if (day < 1 || day > 31) {
      day = 1;
    }

    return DateTime(year, month, day, hour, minute, second);
  }

  String? _extractAttachmentName(String text) {
    final String cleaned = _normalizeForParsing(text);

    final RegExp tagged = RegExp(r'<attached: (.+?)>');
    final RegExpMatch? taggedMatch = tagged.firstMatch(cleaned);
    if (taggedMatch != null) {
      return taggedMatch.group(1)?.trim();
    }

    final RegExp oldStyle = RegExp(r'^(.+?) \(file attached\)$');
    final RegExpMatch? oldStyleMatch = oldStyle.firstMatch(cleaned);
    if (oldStyleMatch != null) {
      return oldStyleMatch.group(1)?.trim();
    }

    return null;
  }

  String? _findAttachmentPath({
    required String archiveRoot,
    required String attachmentName,
  }) {
    final Directory root = Directory(archiveRoot);
    final List<FileSystemEntity> entities = root.listSync(recursive: true);

    for (final FileSystemEntity entity in entities) {
      if (entity is! File) {
        continue;
      }
      if (p.basename(entity.path) == attachmentName) {
        return entity.path;
      }
    }

    final String requested = _normalizeAttachmentKey(attachmentName);
    for (final FileSystemEntity entity in entities) {
      if (entity is! File) {
        continue;
      }
      if (_normalizeAttachmentKey(p.basename(entity.path)) == requested) {
        return entity.path;
      }
    }

    final String requestedNoPrefix = _stripWhatsAppIndexPrefix(requested);
    final String requestedExt = p.extension(requestedNoPrefix);
    for (final FileSystemEntity entity in entities) {
      if (entity is! File) {
        continue;
      }
      final String candidate = _normalizeAttachmentKey(p.basename(entity.path));
      final String candidateNoPrefix = _stripWhatsAppIndexPrefix(candidate);
      if (candidateNoPrefix == requestedNoPrefix) {
        return entity.path;
      }
      if (requestedExt.isNotEmpty &&
          p.extension(candidateNoPrefix) == requestedExt &&
          candidateNoPrefix.endsWith(p.basename(requestedNoPrefix))) {
        return entity.path;
      }
    }

    return null;
  }

  Future<String?> resolveAttachmentPath({
    required ChatArchive archive,
    required String attachmentName,
  }) async {
    _AttachmentIndex index = _attachmentIndexCache[archive.id] ??
        _AttachmentIndex.build(archive.folderPath);
    String? path = index.lookup(attachmentName);
    if (path != null) {
      _attachmentIndexCache[archive.id] = index;
      return path;
    }
    index = _AttachmentIndex.build(archive.folderPath);
    _attachmentIndexCache[archive.id] = index;
    path = index.lookup(attachmentName);
    return path;
  }

  String _normalizeForParsing(String input) {
    return input
        .replaceAll(RegExp(r'[\u200e\u200f\u202a-\u202e\u2066-\u2069]'), '')
        .replaceAll('\u00a0', ' ')
        .replaceAll('\u202f', ' ')
        .trimLeft();
  }

  String _normalizeAttachmentKey(String input) {
    return _normalizeForParsing(input).trim().toLowerCase();
  }

  String _stripWhatsAppIndexPrefix(String input) {
    return input.replaceFirst(RegExp(r'^\d{6,10}[-_ ]'), '');
  }

  ChatMessageType _classifyType({
    required String text,
    required String? attachmentPath,
    String? attachmentName,
  }) {
    String? ext;
    if (attachmentPath != null) {
      ext = p.extension(attachmentPath).toLowerCase();
    } else if (attachmentName != null) {
      ext = p.extension(attachmentName).toLowerCase();
    }

    if (ext == null || ext.isEmpty) {
      if (text.contains('<attached:') || text.contains('(file attached)')) {
        return ChatMessageType.unknownFile;
      }
      return ChatMessageType.text;
    }
    if (<String>{'.jpg', '.jpeg', '.png', '.gif', '.webp', '.heic'}
        .contains(ext)) {
      return ChatMessageType.image;
    }
    if (<String>{'.mp4', '.mov', '.avi', '.mkv', '.3gp'}.contains(ext)) {
      return ChatMessageType.video;
    }
    if (<String>{'.mp3', '.m4a', '.opus', '.ogg', '.wav', '.aac'}
        .contains(ext)) {
      return ChatMessageType.audio;
    }
    if (<String>{'.pdf', '.doc', '.docx', '.xls', '.xlsx', '.ppt', '.pptx', '.txt'}
        .contains(ext)) {
      return ChatMessageType.document;
    }

    if (text.contains('<attached:') || text.contains('(file attached)')) {
      return ChatMessageType.unknownFile;
    }

    return ChatMessageType.text;
  }

  Future<String> _stageZipForImport({
    required String sourceZipPath,
    required Directory targetDir,
  }) async {
    final File source = File(sourceZipPath);
    final File staged = File(p.join(targetDir.path, _stagedZipFileName));
    if (staged.existsSync()) {
      staged.deleteSync();
    }
    await source.copy(staged.path);
    return staged.path;
  }
}

class _ParsedLine {
  _ParsedLine(this.message);

  final ChatMessage message;
}

Future<Map<String, Object?>> _parseArchiveInIsolate(
  Map<String, Object?> args,
) async {
  final List<dynamic> rawPaths = args['chatFilePaths'] as List<dynamic>;
  final List<String> chatFilePaths =
      rawPaths.map((dynamic value) => value as String).toList();
  final String folderPath = args['folderPath'] as String;
  final _AttachmentIndex attachmentIndex = _AttachmentIndex.build(folderPath);
  final List<Map<String, Object?>> messages = <Map<String, Object?>>[];
  final Set<String> senders = <String>{};
  final Map<String, int> seen = <String, int>{};
  int order = 0;

  for (final String chatFilePath in chatFilePaths) {
    final File source = File(chatFilePath);
    if (!source.existsSync()) {
      continue;
    }
    Map<String, Object?>? current;

    final Stream<String> lines = source
        .openRead()
        .transform(utf8.decoder)
        .transform(const LineSplitter());

    await for (final String rawLine in lines) {
      final String normalizedLine = _normalizeForParsingIsolate(rawLine);
      final Map<String, Object?>? parsed = _tryParseNewMessageIsolate(
        normalizedLine,
        attachmentIndex,
      );
      if (parsed != null) {
        if (current != null) {
          _addMessageIfNew(current, messages, seen, order);
          order += 1;
        }
        current = parsed;
        final String sender = parsed['sender'] as String;
        if (sender.isNotEmpty && sender != 'System') {
          senders.add(sender);
        }
        continue;
      }

      if (current != null) {
        current = <String, Object?>{
          'timestamp': current['timestamp'],
          'sender': current['sender'],
          'text': '${current['text']}\n$normalizedLine',
          'type': current['type'],
          'attachmentPath': current['attachmentPath'],
        };
      }
    }

    if (current != null) {
      _addMessageIfNew(current, messages, seen, order);
      order += 1;
    }
  }

  messages.sort((Map<String, Object?> a, Map<String, Object?> b) {
    final int? at = a['timestamp'] as int?;
    final int? bt = b['timestamp'] as int?;
    if (at == null && bt == null) {
      return (a['order'] as int).compareTo(b['order'] as int);
    }
    if (at == null) {
      return 1;
    }
    if (bt == null) {
      return -1;
    }
    final int cmp = at.compareTo(bt);
    if (cmp != 0) {
      return cmp;
    }
    return (a['order'] as int).compareTo(b['order'] as int);
  });

  return <String, Object?>{
    'messages': messages,
    'senders': senders.toList(),
  };
}

void _addMessageIfNew(
  Map<String, Object?> message,
  List<Map<String, Object?>> output,
  Map<String, int> seen,
  int order,
) {
  final String key = _dedupeKeyForRawMessage(
    timestampMs: message['timestamp'] as int?,
    sender: message['sender'] as String,
    text: message['text'] as String,
    attachmentPath: message['attachmentPath'] as String?,
    type: ChatMessageType.values[message['type'] as int],
  );
  final int? existingIndex = seen[key];
  if (existingIndex != null) {
    final Map<String, Object?> existing = output[existingIndex];
    if (_shouldReplaceRawMessage(existing, message)) {
      message['order'] = existing['order'];
      output[existingIndex] = message;
    }
    return;
  }
  message['order'] = order;
  seen[key] = output.length;
  output.add(message);
}

class PreparedImport {
  PreparedImport({
    required this.tempDirPath,
    required this.chatFilePath,
    required this.derivedName,
    required this.finalName,
    required this.zipPath,
  });

  final String tempDirPath;
  final String chatFilePath;
  final String derivedName;
  final String finalName;
  final String zipPath;
}

class IncrementalImportResult {
  IncrementalImportResult({
    required this.importRootPath,
    required this.chatFilePath,
    required this.zipPath,
  });

  final String importRootPath;
  final String chatFilePath;
  final String zipPath;
}

void _addParsedMessageIfBetter(
  ChatMessage message,
  List<ChatMessage> output,
  Map<String, int> seen,
) {
  final String key = _dedupeKeyForChatMessage(message);
  final int? existingIndex = seen[key];
  if (existingIndex != null) {
    if (_shouldReplaceChatMessage(output[existingIndex], message)) {
      output[existingIndex] = message;
    }
    return;
  }
  seen[key] = output.length;
  output.add(message);
}

String _dedupeKeyForChatMessage(ChatMessage message) {
  return _dedupeKeyForFields(
    timestampMs: message.timestamp?.millisecondsSinceEpoch,
    sender: message.sender,
    text: message.text,
    attachmentPath: message.attachmentPath,
    type: message.type,
  );
}

String _dedupeKeyForRawMessage({
  required int? timestampMs,
  required String sender,
  required String text,
  required String? attachmentPath,
  required ChatMessageType type,
}) {
  return _dedupeKeyForFields(
    timestampMs: timestampMs,
    sender: sender,
    text: text,
    attachmentPath: attachmentPath,
    type: type,
  );
}

String _dedupeKeyForFields({
  required int? timestampMs,
  required String sender,
  required String text,
  required String? attachmentPath,
  required ChatMessageType type,
}) {
  final String normalizedText = _normalizeForParsingIsolate(text).trim();
  final String? mediaKind = _messageMediaKind(
    text: normalizedText,
    attachmentPath: attachmentPath,
    type: type,
  );
  if (mediaKind != null) {
    final String comparableText = _mediaComparableText(normalizedText, mediaKind);
    if (comparableText == mediaKind) {
      return '${timestampMs ?? 'null'}|$sender|media:any';
    }
    return '${timestampMs ?? 'null'}|$sender|media:$mediaKind|$comparableText';
  }
  return '${timestampMs ?? 'null'}|$sender|text:${normalizedText.toLowerCase()}';
}

bool _shouldReplaceChatMessage(ChatMessage existing, ChatMessage candidate) {
  return _messageRichnessScore(
        text: candidate.text,
        attachmentPath: candidate.attachmentPath,
        type: candidate.type,
      ) >
      _messageRichnessScore(
        text: existing.text,
        attachmentPath: existing.attachmentPath,
        type: existing.type,
      );
}

bool _shouldReplaceRawMessage(
  Map<String, Object?> existing,
  Map<String, Object?> candidate,
) {
  return _messageRichnessScore(
        text: candidate['text'] as String,
        attachmentPath: candidate['attachmentPath'] as String?,
        type: ChatMessageType.values[candidate['type'] as int],
      ) >
      _messageRichnessScore(
        text: existing['text'] as String,
        attachmentPath: existing['attachmentPath'] as String?,
        type: ChatMessageType.values[existing['type'] as int],
      );
}

int _messageRichnessScore({
  required String text,
  required String? attachmentPath,
  required ChatMessageType type,
}) {
  int score = 0;
  if (attachmentPath != null && attachmentPath.isNotEmpty) {
    score += 4;
  }
  if (text.contains('<attached:') || text.contains('(file attached)')) {
    score += 3;
  }
  if (_omittedMediaKind(text) != null) {
    score -= 1;
  }
  if (type != ChatMessageType.text &&
      type != ChatMessageType.system &&
      type != ChatMessageType.unknownFile) {
    score += 1;
  }
  return score;
}

String? _messageMediaKind({
  required String text,
  required String? attachmentPath,
  required ChatMessageType type,
}) {
  final String? omittedKind = _omittedMediaKind(text);
  if (omittedKind != null) {
    return omittedKind;
  }

  final String? attachmentName = _extractAttachmentNameIsolate(text);
  final String ext = (attachmentPath != null && attachmentPath.isNotEmpty)
      ? p.extension(attachmentPath).toLowerCase()
      : (attachmentName == null ? '' : p.extension(attachmentName).toLowerCase());

  if (<String>{'.jpg', '.jpeg', '.png', '.gif', '.webp', '.heic'}.contains(ext) ||
      type == ChatMessageType.image) {
    return 'image';
  }
  if (<String>{'.mp4', '.mov', '.avi', '.mkv', '.3gp'}.contains(ext) ||
      type == ChatMessageType.video) {
    return 'video';
  }
  if (<String>{'.mp3', '.m4a', '.opus', '.ogg', '.wav', '.aac'}.contains(ext) ||
      type == ChatMessageType.audio) {
    return 'audio';
  }
  if (<String>{'.pdf', '.doc', '.docx', '.xls', '.xlsx', '.ppt', '.pptx', '.txt'}
          .contains(ext) ||
      type == ChatMessageType.document) {
    return 'document';
  }
  if (text.contains('<attached:') || text.contains('(file attached)')) {
    return 'media';
  }
  return null;
}

String _mediaComparableText(String text, String mediaKind) {
  String value = text;
  value = value.replaceAll(RegExp(r'<attached: .*?>'), '');
  value = value.replaceAll(RegExp(r'\s*\(file attached\)\s*'), '');
  final Set<String> placeholders = <String>{
    'media omitted',
    '<media omitted>',
    'audio omitted',
    '<audio omitted>',
    'voice message omitted',
    '<voice message omitted>',
    'voice note omitted',
    '<voice note omitted>',
    'image omitted',
    '<image omitted>',
    'photo omitted',
    '<photo omitted>',
    'video omitted',
    '<video omitted>',
    'gif omitted',
    '<gif omitted>',
    'document omitted',
    '<document omitted>',
    'sticker omitted',
    '<sticker omitted>',
  };
  final String lowered = value.trim().toLowerCase();
  if (placeholders.contains(lowered)) {
    return mediaKind;
  }
  value = value.trim().toLowerCase();
  return value.isEmpty ? mediaKind : value;
}

class _MediaReferenceAllocator {
  _MediaReferenceAllocator(List<String> fileNames)
      : _remaining = fileNames
            .map(_MediaCandidate.fromFileName)
            .whereType<_MediaCandidate>()
            .toList();

  final List<_MediaCandidate> _remaining;

  String? takeNext(String kind) {
    final int exactIndex = _remaining.indexWhere(
      (_MediaCandidate candidate) => candidate.kind == kind,
    );
    if (exactIndex != -1) {
      return _remaining.removeAt(exactIndex).name;
    }
    if (kind == 'media' || kind == 'audio') {
      final int fallbackIndex = _remaining.indexWhere(
        (_MediaCandidate candidate) =>
            kind == 'media' || candidate.kind == 'media',
      );
      if (fallbackIndex != -1) {
        return _remaining.removeAt(fallbackIndex).name;
      }
    }
    return null;
  }
}

class _MediaCandidate {
  _MediaCandidate({required this.name, required this.kind});

  final String name;
  final String kind;

  static _MediaCandidate? fromFileName(String fileName) {
    final String ext = p.extension(fileName).toLowerCase();
    if (<String>{'.jpg', '.jpeg', '.png', '.gif', '.webp', '.heic'}
        .contains(ext)) {
      return _MediaCandidate(name: fileName, kind: 'image');
    }
    if (<String>{'.mp4', '.mov', '.avi', '.mkv', '.3gp'}.contains(ext)) {
      return _MediaCandidate(name: fileName, kind: 'video');
    }
    if (<String>{'.mp3', '.m4a', '.opus', '.ogg', '.wav', '.aac'}
        .contains(ext)) {
      return _MediaCandidate(name: fileName, kind: 'audio');
    }
    if (<String>{'.pdf', '.doc', '.docx', '.xls', '.xlsx', '.ppt', '.pptx', '.txt'}
        .contains(ext)) {
      return _MediaCandidate(name: fileName, kind: 'document');
    }
    return _MediaCandidate(name: fileName, kind: 'media');
  }
}

void _annotateOmittedMediaReferencesFromZip({
  required String zipPath,
  required String extractedRoot,
}) {
  final List<String> mediaNames = _orderedMediaNamesFromZip(zipPath);
  if (mediaNames.isEmpty) {
    return;
  }

  final List<File> textFiles = Directory(extractedRoot)
      .listSync(recursive: true)
      .whereType<File>()
      .where((File file) =>
          !_isIgnoredExtractedPath(file.path, extractedRoot) &&
          file.path.toLowerCase().endsWith('.txt') &&
          !p.basename(file.path).startsWith('.'))
      .toList()
    ..sort((File a, File b) => a.path.compareTo(b.path));

  final _MediaReferenceAllocator allocator = _MediaReferenceAllocator(mediaNames);
  for (final File file in textFiles) {
    final List<String> lines = file.readAsLinesSync();
    bool changed = false;
    final List<String> rewritten = lines.map((String line) {
      final String updated = _rewriteLineWithOmittedAttachment(line, allocator);
      if (updated != line) {
        changed = true;
      }
      return updated;
    }).toList();
    if (changed) {
      file.writeAsStringSync(rewritten.join('\n'));
    }
  }
}

List<String> _orderedMediaNamesFromZip(String zipPath) {
  final InputFileStream input = InputFileStream(zipPath);
  try {
    final Archive archive = ZipDecoder().decodeStream(input);
    return archive
        .where((ArchiveFile file) =>
            file.isFile &&
            !_isIgnoredArchiveEntryName(file.name) &&
            !file.name.toLowerCase().endsWith('.txt'))
        .map((ArchiveFile file) => p.basename(file.name))
        .where((String name) => name.isNotEmpty)
        .toList();
  } finally {
    input.close();
  }
}

String _rewriteLineWithOmittedAttachment(
  String line,
  _MediaReferenceAllocator allocator,
) {
  final RegExp modernFormat = RegExp(
    r'^(\[(\d{1,2}/\d{1,2}/\d{2,4}), (\d{1,2}:\d{2}(?::\d{2})?(?:\s?[APMapm]{2})?)\] )(.+)$',
  );
  final RegExp legacyFormat = RegExp(
    r'^((\d{1,2}/\d{1,2}/\d{2,4}), (\d{1,2}:\d{2}(?::\d{2})?(?:\s?[APMapm]{2})?) - )(.+)$',
  );

  final RegExpMatch? match = modernFormat.firstMatch(line) ?? legacyFormat.firstMatch(line);
  if (match == null) {
    return line;
  }

  final String prefix = match.group(1)!;
  final String body = _normalizeForParsingIsolate(match.group(4)!);
  if (body.contains('<attached:') || body.contains('(file attached)')) {
    return line;
  }

  final int splitIndex = body.indexOf(': ');
  final String senderPrefix = splitIndex == -1 ? '' : '${body.substring(0, splitIndex).trim()}: ';
  final String text = splitIndex == -1 ? body : body.substring(splitIndex + 2).trim();
  final String? kind = _omittedMediaKind(text);
  if (kind == null) {
    return line;
  }

  final String? attachmentName = allocator.takeNext(kind);
  if (attachmentName == null) {
    return line;
  }

  return '$prefix$senderPrefix<attached: $attachmentName>';
}

String? _omittedMediaKind(String text) {
  final String normalized = _normalizeForParsingIsolate(text).toLowerCase();
  final Set<String> audioPlaceholders = <String>{
    'audio omitted',
    '<audio omitted>',
    'voice message omitted',
    '<voice message omitted>',
    'voice note omitted',
    '<voice note omitted>',
  };
  final Set<String> imagePlaceholders = <String>{
    'image omitted',
    '<image omitted>',
    'photo omitted',
    '<photo omitted>',
    'sticker omitted',
    '<sticker omitted>',
  };
  final Set<String> videoPlaceholders = <String>{
    'video omitted',
    '<video omitted>',
    'gif omitted',
    '<gif omitted>',
  };
  final Set<String> documentPlaceholders = <String>{
    'document omitted',
    '<document omitted>',
  };
  final Set<String> genericPlaceholders = <String>{
    'media omitted',
    '<media omitted>',
  };

  if (audioPlaceholders.contains(normalized)) {
    return 'audio';
  }
  if (imagePlaceholders.contains(normalized)) {
    return 'image';
  }
  if (videoPlaceholders.contains(normalized)) {
    return 'video';
  }
  if (documentPlaceholders.contains(normalized)) {
    return 'document';
  }
  if (genericPlaceholders.contains(normalized)) {
    return 'media';
  }
  return null;
}

Map<String, Object?>? _tryParseNewMessageIsolate(
  String line,
  _AttachmentIndex attachmentIndex,
) {
  final RegExp modernFormat = RegExp(
    r'^\[(\d{1,2}/\d{1,2}/\d{2,4}), (\d{1,2}:\d{2}(?::\d{2})?(?:\s?[APMapm]{2})?)\] (.+)$',
  );
  final RegExp legacyFormat = RegExp(
    r'^(\d{1,2}/\d{1,2}/\d{2,4}), (\d{1,2}:\d{2}(?::\d{2})?(?:\s?[APMapm]{2})?) - (.+)$',
  );

  RegExpMatch? match = modernFormat.firstMatch(line);
  match ??= legacyFormat.firstMatch(line);
  if (match == null) {
    return null;
  }

  final String datePart = match.group(1)!;
  final String timePart = match.group(2)!;
  final String body = _normalizeForParsingIsolate(match.group(3)!);

  final int splitIndex = body.indexOf(': ');
  String sender;
  String text;

  if (splitIndex == -1) {
    sender = 'System';
    text = body;
  } else {
    sender = body.substring(0, splitIndex).trim();
    text = body.substring(splitIndex + 2).trim();
  }

  final DateTime? timestamp = _parseDateTimeIsolate(datePart, timePart);
  final String? attachment = _extractAttachmentNameIsolate(text);
  final String? attachmentPath =
      attachment == null ? null : attachmentIndex.lookup(attachment);

  final ChatMessageType type = _classifyTypeIsolate(
    text: text,
    attachmentPath: attachmentPath,
    attachmentName: attachment,
  );

  return <String, Object?>{
    'timestamp': timestamp?.millisecondsSinceEpoch,
    'sender': sender,
    'text': text,
    'type': (sender == 'System' ? ChatMessageType.system : type).index,
    'attachmentPath': attachmentPath,
  };
}

DateTime? _parseDateTimeIsolate(String datePart, String timePart) {
  final List<String> dateTokens = datePart.split('/');
  if (dateTokens.length != 3) {
    return null;
  }

  int day = int.tryParse(dateTokens[0]) ?? 1;
  int month = int.tryParse(dateTokens[1]) ?? 1;
  int year = int.tryParse(dateTokens[2]) ?? DateTime.now().year;

  if (year < 100) {
    year += 2000;
  }

  final RegExp timePattern =
      RegExp(r'^(\d{1,2}):(\d{2})(?::(\d{2}))?\s*([APMapm]{2})?$');
  final RegExpMatch? tm = timePattern.firstMatch(timePart.trim());
  if (tm == null) {
    return null;
  }

  int hour = int.tryParse(tm.group(1) ?? '0') ?? 0;
  final int minute = int.tryParse(tm.group(2) ?? '0') ?? 0;
  final int second = int.tryParse(tm.group(3) ?? '0') ?? 0;
  final String? marker = tm.group(4)?.toLowerCase();

  if (marker == 'pm' && hour < 12) {
    hour += 12;
  }
  if (marker == 'am' && hour == 12) {
    hour = 0;
  }

  if (month < 1 || month > 12) {
    month = 1;
  }
  if (day < 1 || day > 31) {
    day = 1;
  }

  return DateTime(year, month, day, hour, minute, second);
}

String? _extractAttachmentNameIsolate(String text) {
  final String cleaned = _normalizeForParsingIsolate(text);

  final RegExp tagged = RegExp(r'<attached: (.+?)>');
  final RegExpMatch? taggedMatch = tagged.firstMatch(cleaned);
  if (taggedMatch != null) {
    return taggedMatch.group(1)?.trim();
  }

  final RegExp oldStyle = RegExp(r'^(.+?) \(file attached\)$');
  final RegExpMatch? oldStyleMatch = oldStyle.firstMatch(cleaned);
  if (oldStyleMatch != null) {
    return oldStyleMatch.group(1)?.trim();
  }

  return null;
}

class _AttachmentIndex {
  _AttachmentIndex(this._byName, this._byNormalized, this._byStripped);

  final Map<String, String> _byName;
  final Map<String, String> _byNormalized;
  final Map<String, String> _byStripped;

  static _AttachmentIndex build(String archiveRoot) {
    final Directory root = Directory(archiveRoot);
    final List<FileSystemEntity> entities = root.listSync(recursive: true);
    final Map<String, String> byName = <String, String>{};
    final Map<String, String> byNormalized = <String, String>{};
    final Map<String, String> byStripped = <String, String>{};

    for (final FileSystemEntity entity in entities) {
      if (entity is! File) {
        continue;
      }
      if (_isIgnoredExtractedPath(entity.path, archiveRoot)) {
        continue;
      }
      final String fileName = p.basename(entity.path);
      final String normalized = _normalizeAttachmentKeyIsolate(fileName);
      final String stripped = _stripWhatsAppIndexPrefixIsolate(normalized);

      byName.putIfAbsent(fileName, () => entity.path);
      byNormalized.putIfAbsent(normalized, () => entity.path);
      byStripped.putIfAbsent(stripped, () => entity.path);
    }

    return _AttachmentIndex(byName, byNormalized, byStripped);
  }

  String? lookup(String attachmentName) {
    final String? direct = _byName[attachmentName];
    if (direct != null) {
      return direct;
    }
    final String normalized = _normalizeAttachmentKeyIsolate(attachmentName);
    final String? normalizedPath = _byNormalized[normalized];
    if (normalizedPath != null) {
      return normalizedPath;
    }
    final String stripped = _stripWhatsAppIndexPrefixIsolate(normalized);
    final String? strippedPath = _byStripped[stripped];
    if (strippedPath != null) {
      return strippedPath;
    }

    final String strippedExt = p.extension(stripped);
    if (strippedExt.isEmpty) {
      return null;
    }

    final Iterable<MapEntry<String, String>> candidates = _byStripped.entries
        .where((MapEntry<String, String> entry) =>
            p.extension(entry.key) == strippedExt &&
            entry.key.endsWith(p.basename(stripped)));
    for (final MapEntry<String, String> entry in candidates) {
      return entry.value;
    }
    return null;
  }
}

void _extractZipWorker(Map<String, Object?> args) {
  final SendPort sendPort = args['sendPort'] as SendPort;
  final String zipPath = args['zipPath'] as String;
  final String targetPath = args['targetPath'] as String;

  final InputFileStream input = InputFileStream(zipPath);
  try {
    final Archive archive = ZipDecoder().decodeStream(input);
    final int total = archive.length == 0 ? 1 : archive.length;
    int processed = 0;

    for (final ArchiveFile file in archive) {
      final String safeName = file.name.replaceAll('..', '');
      if (_isIgnoredArchiveEntryName(safeName)) {
        processed += 1;
        sendPort.send(processed / total);
        continue;
      }
      final String outputPath = p.normalize(p.join(targetPath, safeName));

      if (!outputPath.startsWith(targetPath)) {
        continue;
      }

      if (file.isFile) {
        final File outFile = File(outputPath)..createSync(recursive: true);
        final OutputFileStream output = OutputFileStream(outFile.path);
        try {
          file.writeContent(output);
        } finally {
          output.close();
        }
      } else {
        Directory(outputPath).createSync(recursive: true);
      }

      processed += 1;
      sendPort.send(processed / total);
    }

    sendPort.send(<String, Object?>{'type': 'done'});
  } catch (e, stack) {
    sendPort.send(<String, Object?>{
      'type': 'error',
      'error': e.toString(),
      'stack': stack.toString(),
    });
  } finally {
    input.close();
  }
}

bool _isIgnoredArchiveEntryName(String entryName) {
  final List<String> parts = p.split(entryName);
  for (final String part in parts) {
    if (part == '__MACOSX' || part.startsWith('._')) {
      return true;
    }
  }
  return false;
}

bool _isIgnoredExtractedPath(String path, String rootPath) {
  final String relative = p.relative(path, from: rootPath);
  return _isIgnoredArchiveEntryName(relative);
}

void _extractZipTextWorker(Map<String, Object?> args) {
  final SendPort sendPort = args['sendPort'] as SendPort;
  final String zipPath = args['zipPath'] as String;
  final String targetPath = args['targetPath'] as String;

  final InputFileStream input = InputFileStream(zipPath);
  try {
    final Archive archive = ZipDecoder().decodeStream(input);
    final List<ArchiveFile> textFiles = archive
        .where((ArchiveFile file) =>
            file.isFile && file.name.toLowerCase().endsWith('.txt'))
        .toList();
    final int total = textFiles.isEmpty ? 1 : textFiles.length;
    int processed = 0;

    for (final ArchiveFile file in textFiles) {
      final String safeName = file.name.replaceAll('..', '');
      final String outputPath = p.normalize(p.join(targetPath, safeName));

      if (!outputPath.startsWith(targetPath)) {
        continue;
      }

      final File outFile = File(outputPath)..createSync(recursive: true);
      final OutputFileStream output = OutputFileStream(outFile.path);
      try {
        file.writeContent(output);
      } finally {
        output.close();
      }

      processed += 1;
      sendPort.send(processed / total);
    }

    sendPort.send(<String, Object?>{'type': 'done'});
  } catch (e, stack) {
    sendPort.send(<String, Object?>{
      'type': 'error',
      'error': e.toString(),
      'stack': stack.toString(),
    });
  } finally {
    input.close();
  }
}

void _extractZipMediaWorker(Map<String, Object?> args) {
  final SendPort sendPort = args['sendPort'] as SendPort;
  final String zipPath = args['zipPath'] as String;
  final String targetPath = args['targetPath'] as String;
  final int startIndex = args['startIndex'] as int? ?? 0;

  final InputFileStream input = InputFileStream(zipPath);
  try {
    final Archive archive = ZipDecoder().decodeStream(input);
    final List<ArchiveFile> mediaFiles = archive
        .where((ArchiveFile file) =>
            file.isFile && !file.name.toLowerCase().endsWith('.txt'))
        .toList();
    final int total = mediaFiles.isEmpty ? 1 : mediaFiles.length;
    int processed = 0;

    for (int i = 0; i < mediaFiles.length; i++) {
      final ArchiveFile file = mediaFiles[i];
      if (i < startIndex) {
        processed += 1;
        continue;
      }

      final String safeName = file.name.replaceAll('..', '');
      final String outputPath = p.normalize(p.join(targetPath, safeName));

      if (!outputPath.startsWith(targetPath)) {
        processed += 1;
        continue;
      }

      final File outFile = File(outputPath);
      if (!outFile.existsSync()) {
        outFile.createSync(recursive: true);
        final OutputFileStream output = OutputFileStream(outFile.path);
        try {
          file.writeContent(output);
        } finally {
          output.close();
        }
      }

      processed += 1;
      sendPort.send(<String, Object?>{
        'type': 'progress',
        'processed': processed,
        'total': total,
      });
    }

    sendPort.send(<String, Object?>{'type': 'done'});
  } catch (e, stack) {
    sendPort.send(<String, Object?>{
      'type': 'error',
      'error': e.toString(),
      'stack': stack.toString(),
    });
  } finally {
    input.close();
  }
}

String _normalizeForParsingIsolate(String input) {
  return input
      .replaceAll(RegExp(r'[\u200e\u200f\u202a-\u202e\u2066-\u2069]'), '')
      .replaceAll('\u00a0', ' ')
      .replaceAll('\u202f', ' ')
      .trimLeft();
}

String _normalizeAttachmentKeyIsolate(String input) {
  return _normalizeForParsingIsolate(input).trim().toLowerCase();
}

String _stripWhatsAppIndexPrefixIsolate(String input) {
  return input.replaceFirst(RegExp(r'^\d{6,10}[-_ ]'), '');
}

ChatMessageType _classifyTypeIsolate({
  required String text,
  required String? attachmentPath,
  String? attachmentName,
}) {
  String? ext;
  if (attachmentPath != null) {
    ext = p.extension(attachmentPath).toLowerCase();
  } else if (attachmentName != null) {
    ext = p.extension(attachmentName).toLowerCase();
  }

  if (ext == null || ext.isEmpty) {
    if (text.contains('<attached:') || text.contains('(file attached)')) {
      return ChatMessageType.unknownFile;
    }
    return ChatMessageType.text;
  }
  if (<String>{'.jpg', '.jpeg', '.png', '.gif', '.webp', '.heic'}
      .contains(ext)) {
    return ChatMessageType.image;
  }
  if (<String>{'.mp4', '.mov', '.avi', '.mkv', '.3gp'}.contains(ext)) {
    return ChatMessageType.video;
  }
  if (<String>{'.mp3', '.m4a', '.opus', '.ogg', '.wav', '.aac'}
      .contains(ext)) {
    return ChatMessageType.audio;
  }
  if (<String>{
    '.pdf',
    '.doc',
    '.docx',
    '.xls',
    '.xlsx',
    '.ppt',
    '.pptx',
    '.txt'
  }.contains(ext)) {
    return ChatMessageType.document;
  }

  if (text.contains('<attached:') || text.contains('(file attached)')) {
    return ChatMessageType.unknownFile;
  }

  return ChatMessageType.text;
}
