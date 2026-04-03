import 'dart:io';

Future<int> calculateDirectorySize(Directory dir) async {
  if (!await dir.exists()) {
    return 0;
  }
  int total = 0;
  final List<FileSystemEntity> entities =
      dir.listSync(recursive: true, followLinks: false);
  for (final FileSystemEntity entity in entities) {
    try {
      if (entity is File) {
        total += await entity.length();
      }
    } catch (_) {
      // Ignore files that can't be read.
    }
  }
  return total;
}

String formatBytes(int bytes) {
  const int mb = 1024 * 1024;
  const int gb = 1024 * 1024 * 1024;
  if (bytes >= gb) {
    final double value = bytes / gb;
    return '${value.toStringAsFixed(1)} GB';
  }
  final double value = bytes / mb;
  return '${value.toStringAsFixed(1)} MB';
}
