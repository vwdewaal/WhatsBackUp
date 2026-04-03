import 'package:flutter_test/flutter_test.dart';

import 'package:whatsapp_archive_viewer/main.dart';

void main() {
  testWidgets('App boots', (WidgetTester tester) async {
    await tester.pumpWidget(const ArchiveViewerApp());
    expect(find.text('WhatsBackUp'), findsOneWidget);
  });
}
