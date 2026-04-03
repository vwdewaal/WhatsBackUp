import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import '../models/chat_models.dart';

class ChatMessageStore {
  ChatMessageStore._(this._db, this.dbPath);

  static const String _dbFileName = 'chat.db';

  final Database _db;
  final String dbPath;

  static Future<ChatMessageStore> openForArchive(ChatArchive archive) async {
    final String dbPath = p.join(archive.folderPath, _dbFileName);
    final Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
CREATE TABLE messages (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ts INTEGER,
  sender TEXT,
  text TEXT,
  type INTEGER,
  attachment_path TEXT,
  dedupe_hash TEXT UNIQUE
)
''');
        await db.execute('CREATE INDEX idx_messages_id ON messages(id)');
        await db.execute('CREATE INDEX idx_messages_ts ON messages(ts)');
        await db.execute('CREATE INDEX idx_messages_sender ON messages(sender)');
        await db.execute('''
CREATE TABLE meta (
  key TEXT PRIMARY KEY,
  value TEXT
)
''');
      },
    );
    return ChatMessageStore._(db, dbPath);
  }

  Future<void> close() async {
    await _db.close();
  }

  Future<bool> isBuilt() async {
    final List<Map<String, Object?>> rows = await _db.query(
      'meta',
      columns: <String>['value'],
      where: 'key = ?',
      whereArgs: <Object?>['built'],
      limit: 1,
    );
    if (rows.isEmpty) {
      return false;
    }
    return rows.first['value'] == '1';
  }

  Future<int?> getMessageCount() async {
    final List<Map<String, Object?>> rows = await _db.query(
      'meta',
      columns: <String>['value'],
      where: 'key = ?',
      whereArgs: <Object?>['message_count'],
      limit: 1,
    );
    if (rows.isEmpty) {
      return null;
    }
    return int.tryParse(rows.first['value'] as String? ?? '');
  }

  Future<void> setBuilt({required int messageCount}) async {
    await _db.insert(
      'meta',
      <String, Object?>{'key': 'built', 'value': '1'},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await _db.insert(
      'meta',
      <String, Object?>{'key': 'message_count', 'value': '$messageCount'},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> reset() async {
    await _db.delete('messages');
    await _db.delete('meta');
  }

  Future<void> insertBatch(
    List<ChatMessage> batch,
  ) async {
    if (batch.isEmpty) {
      return;
    }
    await _db.transaction((Transaction txn) async {
      final Batch writer = txn.batch();
      for (int i = 0; i < batch.length; i++) {
        final ChatMessage message = batch[i];
        final int? ts = message.timestamp?.millisecondsSinceEpoch;
        final String key = _messageDedupeKey(message);
        final String hash = md5.convert(utf8.encode(key)).toString();
        writer.insert(
          'messages',
          <String, Object?>{
            'ts': ts,
            'sender': message.sender,
            'text': message.text,
            'type': message.type.index,
            'attachment_path': message.attachmentPath,
            'dedupe_hash': hash,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await writer.commit(noResult: true);
    });
  }

  Future<int> countMessages({ChatMessageFilter? filter}) async {
    final _SqlWhere where = _buildWhere(filter);
    final List<Map<String, Object?>> rows = await _db.rawQuery(
      'SELECT COUNT(*) as count FROM messages ${where.clause}',
      where.args,
    );
    return (rows.first['count'] as int?) ?? 0;
  }

  Future<int> positionForId(int id, {ChatMessageFilter? filter}) async {
    final _SqlWhere where = _buildWhere(filter);
    final String clause = where.clause.isEmpty
        ? 'WHERE id <= ?'
        : '${where.clause} AND id <= ?';
    final List<Object?> args = <Object?>[...where.args, id];
    final List<Map<String, Object?>> rows = await _db.rawQuery(
      'SELECT COUNT(*) as count FROM messages $clause',
      args,
    );
    final int count = (rows.first['count'] as int?) ?? 0;
    return count > 0 ? count - 1 : 0;
  }

  Future<String?> fetchTopSender() async {
    final List<Map<String, Object?>> rows = await _db.rawQuery(
      "SELECT sender, COUNT(*) as c FROM messages "
      "WHERE sender != '' AND sender != 'System' "
      "GROUP BY sender ORDER BY c DESC LIMIT 1",
    );
    if (rows.isEmpty) {
      return null;
    }
    return rows.first['sender'] as String?;
  }

  Future<List<String>> fetchSenders() async {
    final List<Map<String, Object?>> rows = await _db.rawQuery(
      "SELECT DISTINCT sender FROM messages WHERE sender != '' AND sender != 'System' ORDER BY sender",
    );
    return rows
        .map((Map<String, Object?> row) => row['sender'] as String)
        .toList();
  }

  Future<List<int>> fetchMessageIds({
    ChatMessageFilter? filter,
    String? searchQuery,
  }) async {
    final _SqlWhere where = _buildWhere(filter, searchQuery: searchQuery);
    final List<Map<String, Object?>> rows = await _db.rawQuery(
      'SELECT id FROM messages ${where.clause} ORDER BY id ASC',
      where.args,
    );
    return rows
        .map((Map<String, Object?> row) => row['id'] as int)
        .toList();
  }

  Future<List<DbMessage>> fetchRangeWithIds({
    required int offset,
    required int limit,
    ChatMessageFilter? filter,
  }) async {
    final _SqlWhere where = _buildWhere(filter);
    final List<Object?> args = <Object?>[...where.args, limit, offset];
    final List<Map<String, Object?>> rows = await _db.rawQuery(
      'SELECT id, ts, sender, text, type, attachment_path FROM messages '
      '${where.clause} ORDER BY id ASC LIMIT ? OFFSET ?',
      args,
    );
    return rows
        .map((Map<String, Object?> row) => DbMessage(
              id: row['id'] as int,
              message: _rowToMessage(row),
            ))
        .toList();
  }

  Future<List<ChatMessage>> fetchRange({
    required int offset,
    required int limit,
    ChatMessageFilter? filter,
  }) async {
    final _SqlWhere where = _buildWhere(filter);
    final List<Object?> args = <Object?>[...where.args, limit, offset];
    final List<Map<String, Object?>> rows = await _db.rawQuery(
      'SELECT ts, sender, text, type, attachment_path FROM messages '
      '${where.clause} ORDER BY id ASC LIMIT ? OFFSET ?',
      args,
    );
    return rows.map(_rowToMessage).toList();
  }

  Future<List<ChatMessage>> fetchByIds(List<int> ids) async {
    if (ids.isEmpty) {
      return <ChatMessage>[];
    }
    final String placeholders = List<String>.filled(ids.length, '?').join(',');
    final List<Map<String, Object?>> rows = await _db.rawQuery(
      'SELECT id, ts, sender, text, type, attachment_path '
      'FROM messages WHERE id IN ($placeholders) ORDER BY id ASC',
      ids,
    );
    return rows.map(_rowToMessage).toList();
  }

  ChatMessage _rowToMessage(Map<String, Object?> row) {
    final int? ts = row['ts'] as int?;
    return ChatMessage(
      timestamp: ts == null ? null : DateTime.fromMillisecondsSinceEpoch(ts),
      sender: row['sender'] as String,
      text: row['text'] as String,
      type: ChatMessageType.values[row['type'] as int],
      attachmentPath: row['attachment_path'] as String?,
    );
  }

  _SqlWhere _buildWhere(ChatMessageFilter? filter, {String? searchQuery}) {
    final List<String> clauses = <String>[];
    final List<Object?> args = <Object?>[];

    if (filter != null) {
      if (filter.dateRange != null) {
        clauses.add('ts IS NOT NULL AND ts BETWEEN ? AND ?');
        args.add(filter.dateRange!.start.millisecondsSinceEpoch);
        args.add(filter.dateRange!.end.millisecondsSinceEpoch);
      }
      if (filter.senders.isNotEmpty) {
        final String placeholders =
            List<String>.filled(filter.senders.length, '?').join(',');
        clauses.add('sender IN ($placeholders)');
        args.addAll(filter.senders);
      }
      if (filter.mediaOnly) {
        clauses.add('type IN (${_mediaTypePlaceholders()})');
        args.addAll(_mediaTypeArgs());
      } else if (!filter.includeMedia) {
        clauses.add('type IN (?, ?)');
        args.add(ChatMessageType.text.index);
        args.add(ChatMessageType.system.index);
      }
    }

    if (searchQuery != null && searchQuery.trim().isNotEmpty) {
      clauses.add('LOWER(text) LIKE ?');
      args.add('%${searchQuery.toLowerCase()}%');
    }

    if (clauses.isEmpty) {
      return _SqlWhere('', <Object?>[]);
    }

    return _SqlWhere('WHERE ${clauses.join(' AND ')}', args);
  }

  String _mediaTypePlaceholders() {
    return List<String>.filled(_mediaTypeArgs().length, '?').join(',');
  }

  List<int> _mediaTypeArgs() {
    return <int>[
      ChatMessageType.image.index,
      ChatMessageType.video.index,
      ChatMessageType.audio.index,
      ChatMessageType.document.index,
      ChatMessageType.unknownFile.index,
    ];
  }
}


String _messageDedupeKey(ChatMessage message) {
  final int? timestampMs = message.timestamp?.millisecondsSinceEpoch;
  final String normalizedText = message.text.trim();
  final String? mediaKind = _messageMediaKindForStore(
    text: normalizedText,
    attachmentPath: message.attachmentPath,
    type: message.type,
  );
  if (mediaKind != null) {
    final String comparableText = _mediaComparableTextForStore(
      normalizedText,
      mediaKind,
    );
    if (comparableText == mediaKind) {
      return '${timestampMs ?? 'null'}|${message.sender}|media:any';
    }
    return '${timestampMs ?? 'null'}|${message.sender}|media:$mediaKind|$comparableText';
  }
  return '${timestampMs ?? 'null'}|${message.sender}|text:${normalizedText.toLowerCase()}';
}

String? _messageMediaKindForStore({
  required String text,
  required String? attachmentPath,
  required ChatMessageType type,
}) {
  final String? omittedKind = _omittedMediaKindForStore(text);
  if (omittedKind != null) {
    return omittedKind;
  }

  final String? attachmentName = _extractAttachmentNameForStore(text);
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

String? _extractAttachmentNameForStore(String text) {
  final RegExp match = RegExp(r'<attached: (.+?)>');
  final RegExpMatch? result = match.firstMatch(text);
  return result?.group(1);
}

String? _omittedMediaKindForStore(String text) {
  final String normalized = text.trim().toLowerCase();
  const Set<String> audioPlaceholders = <String>{
    'audio omitted',
    '<audio omitted>',
    'voice message omitted',
    '<voice message omitted>',
    'voice note omitted',
    '<voice note omitted>',
    'ptt omitted',
    '<ptt omitted>',
  };
  const Set<String> imagePlaceholders = <String>{
    'image omitted',
    '<image omitted>',
    'photo omitted',
    '<photo omitted>',
    'sticker omitted',
    '<sticker omitted>',
  };
  const Set<String> videoPlaceholders = <String>{
    'video omitted',
    '<video omitted>',
    'gif omitted',
    '<gif omitted>',
  };
  const Set<String> documentPlaceholders = <String>{
    'document omitted',
    '<document omitted>',
  };
  if (audioPlaceholders.contains(normalized)) return 'audio';
  if (imagePlaceholders.contains(normalized)) return 'image';
  if (videoPlaceholders.contains(normalized)) return 'video';
  if (documentPlaceholders.contains(normalized)) return 'document';
  if (normalized == 'media omitted' || normalized == '<media omitted>') {
    return 'media';
  }
  return null;
}

String _mediaComparableTextForStore(String text, String mediaKind) {
  String value = text;
  value = value.replaceAll(RegExp(r'<attached: .*?>'), '');
  value = value.replaceAll(RegExp(r'\s*\(file attached\)\s*'), '');
  const Set<String> placeholders = <String>{
    'media omitted',
    '<media omitted>',
    'audio omitted',
    '<audio omitted>',
    'voice message omitted',
    '<voice message omitted>',
    'voice note omitted',
    '<voice note omitted>',
    'ptt omitted',
    '<ptt omitted>',
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

class DbMessage {
  DbMessage({required this.id, required this.message});

  final int id;
  final ChatMessage message;
}

class ChatMessageFilter {
  ChatMessageFilter({
    required this.dateRange,
    required this.senders,
    required this.includeMedia,
    required this.mediaOnly,
  });

  final DateTimeRange? dateRange;
  final Set<String> senders;
  final bool includeMedia;
  final bool mediaOnly;
}

class _SqlWhere {
  _SqlWhere(this.clause, this.args);

  final String clause;
  final List<Object?> args;
}
