import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../models/chat_models.dart';

class ChatRepository {
  static const String _metadataFile = 'metadata.json';
  static const String _hiddenFile = 'hidden_chats.json';
  static const String _lockedFile = 'locked_chats.json';

  Future<Directory> getArchivesRoot() async {
    final Directory appDir = await getApplicationDocumentsDirectory();
    final Directory root = Directory(p.join(appDir.path, 'archives'));
    if (!root.existsSync()) {
      root.createSync(recursive: true);
    }
    return root;
  }

  Future<List<ChatArchive>> getArchives() async {
    final Directory root = await getArchivesRoot();
    final List<Directory> dirs = root
        .listSync()
        .whereType<Directory>()
        .toList();

    final List<ChatArchive> archives = <ChatArchive>[];
    for (final Directory dir in dirs) {
      final File metadata = File(p.join(dir.path, _metadataFile));
      if (!metadata.existsSync()) {
        continue;
      }

      try {
        final ChatArchive stored =
            ChatArchive.deserialize(metadata.readAsStringSync());
        final File? chatFile = _findChatTextFile(dir);
        if (chatFile == null) {
          continue;
        }
        final ChatArchive resolved = ChatArchive(
          id: stored.id,
          name: stored.name,
          sourceName: stored.sourceName,
          folderPath: dir.path,
          chatFilePath: chatFile.path,
          createdAt: stored.createdAt,
          isArchived: stored.isArchived,
          additionalChatFiles: stored.additionalChatFiles,
        );
        if (stored.folderPath != resolved.folderPath ||
            stored.chatFilePath != resolved.chatFilePath) {
          metadata.writeAsStringSync(resolved.serialize());
        }
        archives.add(resolved);
      } catch (_) {
        // Skip malformed archive metadata.
      }
    }

    archives.sort((ChatArchive a, ChatArchive b) => b.createdAt.compareTo(a.createdAt));
    return archives;
  }

  File? _findChatTextFile(Directory root) {
    final List<FileSystemEntity> all = root.listSync(recursive: true);
    final List<File> candidates = all
        .whereType<File>()
        .where((File file) =>
            !_isIgnoredArchivePath(file.path, root.path) &&
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

  bool _isIgnoredArchivePath(String path, String rootPath) {
    final String relative = p.relative(path, from: rootPath);
    final List<String> parts = p.split(relative);
    for (final String part in parts) {
      if (part == '__MACOSX' || part.startsWith('._')) {
        return true;
      }
    }
    return false;
  }

  Future<bool> updateArchive(ChatArchive archive) async {
    final Directory dir = Directory(archive.folderPath);
    if (!dir.existsSync()) {
      return false;
    }
    final File metadata = File(p.join(dir.path, _metadataFile));
    metadata.writeAsStringSync(archive.serialize());
    return true;
  }

  Future<bool> deleteArchive(ChatArchive archive) async {
    final Directory dir = Directory(archive.folderPath);
    if (!dir.existsSync()) {
      return false;
    }
    dir.deleteSync(recursive: true);
    return true;
  }

  Future<Map<String, List<String>>> loadHiddenMap() async {
    final Directory root = await getArchivesRoot();
    final File file = File(p.join(root.path, _hiddenFile));
    if (!file.existsSync()) {
      return <String, List<String>>{};
    }
    try {
      final Map<String, dynamic> json =
          jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
      final Map<String, List<String>> result = <String, List<String>>{};
      for (final MapEntry<String, dynamic> entry in json.entries) {
        final List<dynamic> raw = entry.value as List<dynamic>;
        result[entry.key] = raw.whereType<String>().toList();
      }
      return result;
    } catch (_) {
      return <String, List<String>>{};
    }
  }

  Future<Map<String, List<String>>> loadLockedMap() async {
    final Directory root = await getArchivesRoot();
    final File file = File(p.join(root.path, _lockedFile));
    if (!file.existsSync()) {
      return <String, List<String>>{};
    }
    try {
      final Map<String, dynamic> json =
          jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
      final Map<String, List<String>> result = <String, List<String>>{};
      for (final MapEntry<String, dynamic> entry in json.entries) {
        final List<dynamic> raw = entry.value as List<dynamic>;
        result[entry.key] = raw.whereType<String>().toList();
      }
      return result;
    } catch (_) {
      return <String, List<String>>{};
    }
  }

  Future<void> saveHiddenMap(Map<String, List<String>> map) async {
    final Directory root = await getArchivesRoot();
    final File file = File(p.join(root.path, _hiddenFile));
    file.writeAsStringSync(jsonEncode(map));
  }

  Future<void> saveLockedMap(Map<String, List<String>> map) async {
    final Directory root = await getArchivesRoot();
    final File file = File(p.join(root.path, _lockedFile));
    file.writeAsStringSync(jsonEncode(map));
  }

  Future<Map<String, List<String>>> setHiddenForCode(
    String code,
    Set<String> ids,
  ) async {
    final Map<String, List<String>> map = await loadHiddenMap();
    final Map<String, List<String>> locked = await loadLockedMap();
    if (ids.isEmpty) {
      map.remove(code);
      await saveHiddenMap(map);
      return map;
    }
    final Set<String> cleaned = ids.toSet();
    for (final String key in map.keys.toList()) {
      if (key == code) {
        continue;
      }
      final List<String> filtered =
          map[key]!.where((String id) => !cleaned.contains(id)).toList();
      if (filtered.isEmpty) {
        map.remove(key);
      } else {
        map[key] = filtered;
      }
    }
    map[code] = cleaned.toList()..sort();

    await saveHiddenMap(map);
    return map;
  }

  Future<Map<String, List<String>>> setLockedForCode(
    String code,
    Set<String> ids,
  ) async {
    final Map<String, List<String>> locked = await loadLockedMap();
    final Map<String, List<String>> hidden = await loadHiddenMap();
    if (ids.isEmpty) {
      locked.remove(code);
      await saveLockedMap(locked);
      return locked;
    }
    final Set<String> cleaned = ids.toSet();
    for (final String key in locked.keys.toList()) {
      if (key == code) {
        continue;
      }
      final List<String> filtered =
          locked[key]!.where((String id) => !cleaned.contains(id)).toList();
      if (filtered.isEmpty) {
        locked.remove(key);
      } else {
        locked[key] = filtered;
      }
    }
    locked[code] = cleaned.toList()..sort();

    await saveLockedMap(locked);
    return locked;
  }

  Future<Map<String, List<String>>> clearHiddenForCode(String code) async {
    final Map<String, List<String>> map = await loadHiddenMap();
    map.remove(code);
    await saveHiddenMap(map);
    return map;
  }

  Future<Map<String, List<String>>> clearLockedForCode(String code) async {
    final Map<String, List<String>> map = await loadLockedMap();
    map.remove(code);
    await saveLockedMap(map);
    return map;
  }

  Future<bool> unlockChat(String code, String id) async {
    final Map<String, List<String>> locked = await loadLockedMap();
    final List<String>? ids = locked[code];
    return ids != null && ids.contains(id);
  }

  Future<bool> removeLockedChatForCode(String code, String id) async {
    final Map<String, List<String>> locked = await loadLockedMap();
    final List<String>? ids = locked[code];
    if (ids == null || !ids.contains(id)) {
      return false;
    }
    final List<String> updated = ids.where((String item) => item != id).toList();
    if (updated.isEmpty) {
      locked.remove(code);
    } else {
      locked[code] = updated;
    }
    await saveLockedMap(locked);
    return true;
  }

  Future<Set<String>> getHiddenIds() async {
    final Map<String, List<String>> map = await loadHiddenMap();
    final Set<String> ids = <String>{};
    for (final List<String> list in map.values) {
      ids.addAll(list);
    }
    return ids;
  }

  Future<Set<String>> getLockedIds() async {
    final Map<String, List<String>> map = await loadLockedMap();
    final Set<String> ids = <String>{};
    for (final List<String> list in map.values) {
      ids.addAll(list);
    }
    return ids;
  }
}
