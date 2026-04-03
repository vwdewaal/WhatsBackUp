import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../models/chat_models.dart';

class LocalTransferBundle {
  const LocalTransferBundle({
    required this.archive,
    required this.zipPath,
  });

  final ChatArchive archive;
  final String zipPath;
}

class LocalTransferBundleService {
  static const String manifestFileName = 'whatsbackup_transfer.json';

  Future<LocalTransferBundle> createBundle(ChatArchive archive) async {
    final Directory tempRoot = await getTemporaryDirectory();
    final Directory bundleRoot = Directory(
      p.join(
        tempRoot.path,
        'desktop_transfer_bundles',
        '${archive.id}_${DateTime.now().millisecondsSinceEpoch}',
      ),
    );
    bundleRoot.createSync(recursive: true);

    final Directory contentDir = Directory(p.join(bundleRoot.path, 'bundle'));
    contentDir.createSync(recursive: true);

    final List<String> copiedPaths = <String>[];
    for (final FileSystemEntity entity
        in Directory(archive.folderPath).listSync(recursive: true)) {
      if (entity is! File) {
        continue;
      }
      final String relativePath = p.relative(entity.path, from: archive.folderPath);
      if (_shouldSkip(relativePath)) {
        continue;
      }
      final File target = File(p.join(contentDir.path, relativePath));
      target.parent.createSync(recursive: true);
      entity.copySync(target.path);
      copiedPaths.add(relativePath);
    }

    final Map<String, Object?> manifest = <String, Object?>{
      'format': 'whatsbackup_archive_bundle',
      'version': 1,
      'name': archive.name,
      'sourceName': archive.sourceName,
      'chatFilePath': p.relative(archive.chatFilePath, from: archive.folderPath),
      'additionalChatFiles': archive.additionalChatFiles
          .map((String path) => p.relative(path, from: archive.folderPath))
          .toList(),
      'createdAt': archive.createdAt.toIso8601String(),
      'files': copiedPaths,
    };

    final File manifestFile = File(p.join(contentDir.path, manifestFileName));
    manifestFile.writeAsStringSync(jsonEncode(manifest));

    final String safeName = archive.displayName
        .replaceAll(RegExp(r'[^A-Za-z0-9._ -]'), '_')
        .trim();
    final String zipPath = p.join(
      bundleRoot.path,
      '${safeName.isEmpty ? archive.id : safeName}.zip',
    );

    final ZipFileEncoder encoder = ZipFileEncoder();
    await encoder.zipDirectory(
      contentDir,
      filename: zipPath,
      level: ZipFileEncoder.gzip,
    );

    return LocalTransferBundle(
      archive: archive,
      zipPath: zipPath,
    );
  }

  bool _shouldSkip(String relativePath) {
    final String normalized = relativePath.replaceAll('\\', '/');
    final String base = p.basename(normalized);
    if (base == 'metadata.json' || base == 'chat.db') {
      return true;
    }
    if (base.startsWith('.')) {
      return true;
    }
    return normalized.split('/').any(
      (String part) => part == '__MACOSX' || part.startsWith('._'),
    );
  }
}
