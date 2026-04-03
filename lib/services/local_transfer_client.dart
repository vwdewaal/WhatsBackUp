import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;

typedef LocalTransferProgressCallback =
    void Function(int sentBytes, int totalBytes);

class LocalTransferHandshake {
  const LocalTransferHandshake({
    required this.app,
    required this.protocolVersion,
    required this.deviceAddress,
    required this.port,
  });

  final String app;
  final int protocolVersion;
  final String deviceAddress;
  final int port;
}

class LocalTransferClientResult {
  const LocalTransferClientResult({
    required this.success,
    required this.message,
  });

  final bool success;
  final String message;
}

class LocalTransferClient {
  const LocalTransferClient();

  Future<LocalTransferHandshake> handshake({
    required String host,
    required int port,
  }) async {
    final HttpClient client = HttpClient();
    try {
      final Uri uri = Uri(
        scheme: 'http',
        host: host,
        port: port,
        path: '/handshake',
      );
      final HttpClientRequest request = await client.getUrl(uri);
      final HttpClientResponse response = await request.close();
      final String body = await utf8.decoder.bind(response).join();
      if (response.statusCode != HttpStatus.ok) {
        throw HttpException(body.isEmpty ? 'Handshake failed.' : body, uri: uri);
      }
      final Map<String, dynamic> json =
          jsonDecode(body) as Map<String, dynamic>;
      return LocalTransferHandshake(
        app: json['app'] as String? ?? 'WhatsBackUp',
        protocolVersion: json['protocolVersion'] as int? ?? 1,
        deviceAddress: json['deviceAddress'] as String? ?? host,
        port: json['port'] as int? ?? port,
      );
    } finally {
      client.close(force: true);
    }
  }

  Future<LocalTransferClientResult> uploadZip({
    required String host,
    required int port,
    required String token,
    required String zipPath,
    LocalTransferProgressCallback? onProgress,
  }) async {
    final File file = File(zipPath);
    if (!file.existsSync()) {
      return const LocalTransferClientResult(
        success: false,
        message: 'Selected ZIP file could not be found.',
      );
    }

    final int totalBytes = await file.length();
    final HttpClient client = HttpClient();
    try {
      final Uri uri = Uri(
        scheme: 'http',
        host: host,
        port: port,
        path: '/upload',
      );
      final HttpClientRequest request = await client.postUrl(uri);
      request.headers.set('x-whatsbackup-token', token);
      request.headers.set('x-whatsbackup-file-name', p.basename(zipPath));
      request.headers.contentType = ContentType.binary;
      request.contentLength = totalBytes;

      int sentBytes = 0;
      await for (final List<int> chunk in file.openRead()) {
        request.add(chunk);
        sentBytes += chunk.length;
        onProgress?.call(sentBytes, totalBytes);
      }

      final HttpClientResponse response = await request.close();
      final String body = await utf8.decoder.bind(response).join();
      Map<String, dynamic> json = <String, dynamic>{};
      if (body.trim().isNotEmpty) {
        try {
          json = jsonDecode(body) as Map<String, dynamic>;
        } catch (_) {
          json = <String, dynamic>{'message': body};
        }
      }

      return LocalTransferClientResult(
        success: response.statusCode >= 200 && response.statusCode < 300,
        message: json['message'] as String? ??
            (response.statusCode >= 200 && response.statusCode < 300
                ? 'Uploaded ${p.basename(zipPath)}'
                : 'Upload failed for ${p.basename(zipPath)}'),
      );
    } finally {
      client.close(force: true);
    }
  }
}
