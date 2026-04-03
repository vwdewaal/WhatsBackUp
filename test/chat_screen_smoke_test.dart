import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_archive_viewer/l10n/app_localizations.dart';
import 'package:whatsapp_archive_viewer/models/chat_models.dart';
import 'package:whatsapp_archive_viewer/screens/chat_screen.dart';
import 'package:whatsapp_archive_viewer/services/chat_import_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('ChatScreen renders with minimal chat', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues(<String, Object?>{});

    final Directory tempRoot = await Directory.systemTemp.createTemp('chat_ui_test_');
    final Directory chatDir = Directory(p.join(tempRoot.path, 'chat'));
    chatDir.createSync(recursive: true);
    final String chatFile = p.join(chatDir.path, '_chat.txt');

    File(chatFile).writeAsStringSync('''
[01/02/2026, 09:00] Alice: Morning
[01/02/2026, 09:01] Me: Hi
'''.trim());

    final ChatArchive archive = ChatArchive(
      id: '1',
      name: 'Alice',
      sourceName: 'Alice',
      folderPath: chatDir.path,
      chatFilePath: chatFile,
      createdAt: DateTime(2026, 2, 1),
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ChatScreen(
          archive: archive,
          importService: ChatImportService(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Alice'), findsOneWidget);
    expect(find.text('Morning'), findsOneWidget);

    tempRoot.deleteSync(recursive: true);
  });
}
