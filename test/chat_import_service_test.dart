import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:whatsapp_archive_viewer/models/chat_models.dart';
import 'package:whatsapp_archive_viewer/services/chat_import_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ChatImportService parsing', () {
    late Directory tempRoot;
    late ChatImportService service;

    setUp(() async {
      tempRoot = await Directory.systemTemp.createTemp('chat_import_test_');
      service = ChatImportService();
    });

    tearDown(() async {
      if (tempRoot.existsSync()) {
        tempRoot.deleteSync(recursive: true);
      }
    });

    test('parseArchiveAsync merges and dedupes additional chat files', () async {
      final Directory chatDir = Directory(p.join(tempRoot.path, 'chat'));
      chatDir.createSync(recursive: true);

      final String file1 = p.join(chatDir.path, '_chat.txt');
      final String file2 = p.join(chatDir.path, '_chat_2.txt');

      File(file1).writeAsStringSync('''
[01/02/2026, 09:00] Alice: Morning
[01/02/2026, 09:01] Me: Hi
[01/02/2026, 09:02] Alice: Photo <attached: IMG_0001.jpg>
'''.trim());

      File(file2).writeAsStringSync('''
[01/02/2026, 09:01] Me: Hi
[01/02/2026, 09:02] Alice: Photo <attached: IMG_0001.jpg>
[01/02/2026, 09:03] Alice: New message
'''.trim());

      final ChatArchive archive = ChatArchive(
        id: '1',
        name: 'Alice',
        sourceName: 'Alice',
        folderPath: chatDir.path,
        chatFilePath: file1,
        additionalChatFiles: <String>[file2],
        createdAt: DateTime(2026, 2, 1),
      );

      final ParsedChat parsed = await service.parseArchiveAsync(archive);

      expect(parsed.messages.length, 4);
      expect(parsed.senders, contains('Alice'));
      expect(parsed.senders, isNot(contains('System')));
      expect(
        parsed.messages
            .where((ChatMessage msg) => msg.text.contains('New message'))
            .length,
        1,
      );
    });

    test('prepareImportTextOnlyFromPath rewrites omitted voice memo placeholders', () async {
      final Directory archivesRoot = Directory(p.join(tempRoot.path, 'archives'))
        ..createSync(recursive: true);
      final String zipPath = p.join(tempRoot.path, 'voice-chat.zip');

      final Archive archive = Archive()
        ..addFile(
          ArchiveFile.string(
            '_chat.txt',
            '''
[01/02/2026, 09:00] Alice: <Media omitted>
[01/02/2026, 09:01] Alice: audio omitted
[01/02/2026, 09:02] Me: Got it
'''.trim(),
          ),
        )
        ..addFile(ArchiveFile('PTT-20260201-WA0001.opus', 3, <int>[1, 2, 3]))
        ..addFile(ArchiveFile('AUD-20260201-WA0002.m4a', 3, <int>[1, 2, 3]));

      final OutputFileStream output = OutputFileStream(zipPath);
      try {
        ZipEncoder().encode(archive, output: output);
      } finally {
        output.close();
      }

      final PreparedImport prepared = await service.prepareImportTextOnlyFromPath(
        archivesRoot: archivesRoot,
        zipPath: zipPath,
      );

      final String rewritten = File(prepared.chatFilePath).readAsStringSync();
      expect(rewritten, contains('<attached: PTT-20260201-WA0001.opus>'));
      expect(rewritten, contains('<attached: AUD-20260201-WA0002.m4a>'));
      expect(rewritten, isNot(contains('<Media omitted>')));
      expect(rewritten, isNot(contains('audio omitted')));

      final ChatArchive imported = await service.finalizeNewImport(
        archivesRoot: archivesRoot,
        prepared: prepared,
      );
      final ParsedChat parsed = service.parseArchive(imported);

      expect(parsed.messages[0].type, ChatMessageType.audio);
      expect(parsed.messages[1].type, ChatMessageType.audio);
    });

    test('later media import replaces omitted placeholder instead of duplicating it', () async {
      final Directory chatDir = Directory(p.join(tempRoot.path, 'chat-upgrade'));
      chatDir.createSync(recursive: true);

      final String file1 = p.join(chatDir.path, '_chat.txt');
      final String file2 = p.join(chatDir.path, '_chat_2.txt');

      File(file1).writeAsStringSync('''
[01/02/2026, 09:00] Alice: <Media omitted>
[01/02/2026, 09:05] Me: ok
'''.trim());

      File(file2).writeAsStringSync('''
[01/02/2026, 09:00] Alice: <attached: PTT-20260201-WA0001.opus>
[01/02/2026, 09:05] Me: ok
'''.trim());
      File(
        p.join(chatDir.path, 'PTT-20260201-WA0001.opus'),
      ).writeAsBytesSync(<int>[1, 2, 3]);

      final ChatArchive archive = ChatArchive(
        id: '2',
        name: 'Upgrade',
        sourceName: 'Upgrade',
        folderPath: chatDir.path,
        chatFilePath: file1,
        additionalChatFiles: <String>[file2],
        createdAt: DateTime(2026, 2, 1),
      );

      final ParsedChat parsed = await service.parseArchiveAsync(archive);
      expect(parsed.messages.length, 2);
      expect(parsed.messages.first.type, ChatMessageType.audio);
      expect(
        parsed.messages.first.text,
        contains('<attached: PTT-20260201-WA0001.opus>'),
      );

      // Store-building is exercised on-device; this regression test focuses on
      // the parser/merge layer that previously caused the duplicate message.
    });
  });
}
