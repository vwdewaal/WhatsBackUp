import 'dart:io';

import 'package:flutter/services.dart';

class StorageInfo {
  const StorageInfo({required this.availableBytes, required this.volumeName});

  final int availableBytes;
  final String? volumeName;
}

class StorageService {
  static const MethodChannel _channel = MethodChannel('whatsbackup/storage');

  static Future<StorageInfo?> getStorageInfo(Directory directory) async {
    try {
      final Map<Object?, Object?>? result =
          await _channel.invokeMethod<Map<Object?, Object?>>(
        'getStorageInfo',
        <String, Object?>{'path': directory.path},
      );
      if (result == null) {
        return null;
      }
      final int available = (result['availableBytes'] as int?) ?? 0;
      final String? volume = result['volumeName'] as String?;
      return StorageInfo(availableBytes: available, volumeName: volume);
    } on PlatformException {
      return null;
    } on MissingPluginException {
      return null;
    }
  }
}
