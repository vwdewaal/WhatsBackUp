import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class LocalTransferUpload {
  const LocalTransferUpload({
    required this.file,
    required this.fileName,
    required this.fileSize,
  });

  final File file;
  final String fileName;
  final int fileSize;
}

class LocalTransferUploadResult {
  const LocalTransferUploadResult({
    required this.success,
    required this.message,
  });

  final bool success;
  final String message;
}

class LocalTransferSession {
  const LocalTransferSession({
    required this.token,
    required this.address,
    required this.addresses,
    required this.port,
  });

  final String token;
  final String address;
  final List<String> addresses;
  final int port;
}

class LocalTransferStatus {
  const LocalTransferStatus({
    required this.phase,
    required this.message,
    this.progress,
  });

  final String phase;
  final String message;
  final double? progress;
}

class LocalTransferServer {
  LocalTransferServer({required this.onUpload});

  final Future<LocalTransferUploadResult> Function(LocalTransferUpload upload)
      onUpload;

  final StreamController<LocalTransferStatus> _statusController =
      StreamController<LocalTransferStatus>.broadcast();

  HttpServer? _server;
  LocalTransferSession? _session;

  Stream<LocalTransferStatus> get statuses => _statusController.stream;
  LocalTransferSession? get session => _session;

  Future<LocalTransferSession> start() async {
    if (_server != null && _session != null) {
      return _session!;
    }

    final List<String> addresses = await _pickCandidateAddresses();
    final HttpServer server = await HttpServer.bind(InternetAddress.anyIPv4, 0);
    _server = server;
    _session = LocalTransferSession(
      token: _generateToken(),
      address: addresses.first,
      addresses: addresses,
      port: server.port,
    );

    unawaited(_listen(server));
    _statusController.add(
      LocalTransferStatus(
        phase: 'ready',
        message: 'Ready to receive from desktop.',
      ),
    );
    return _session!;
  }

  Future<void> stop() async {
    await _server?.close(force: true);
    _server = null;
    _session = null;
  }

  Future<void> dispose() async {
    await stop();
    await _statusController.close();
  }

  Future<void> _listen(HttpServer server) async {
    await for (final HttpRequest request in server) {
      try {
        if (request.method == 'GET' && request.uri.path == '/handshake') {
          await _handleHandshake(request);
          continue;
        }
        if (request.method == 'POST' && request.uri.path == '/upload') {
          await _handleUpload(request);
          continue;
        }
        _writeJson(
          request.response,
          HttpStatus.notFound,
          <String, Object?>{'error': 'not_found'},
        );
      } catch (error) {
        _writeJson(
          request.response,
          HttpStatus.internalServerError,
          <String, Object?>{'error': error.toString()},
        );
      } finally {
        await request.response.close();
      }
    }
  }

  Future<void> _handleHandshake(HttpRequest request) async {
    final LocalTransferSession? current = _session;
    if (current == null) {
      _writeJson(
        request.response,
        HttpStatus.serviceUnavailable,
        <String, Object?>{'error': 'not_ready'},
      );
      return;
    }
    _writeJson(
      request.response,
      HttpStatus.ok,
      <String, Object?>{
        'app': 'WhatsBackUp',
        'protocolVersion': 1,
        'deviceAddress': current.address,
        'port': current.port,
      },
    );
  }

  Future<void> _handleUpload(HttpRequest request) async {
    final LocalTransferSession? current = _session;
    if (current == null) {
      _writeJson(
        request.response,
        HttpStatus.serviceUnavailable,
        <String, Object?>{'error': 'not_ready'},
      );
      return;
    }

    final String token =
        request.headers.value('x-whatsbackup-token')?.trim() ?? '';
    if (token != current.token) {
      _writeJson(
        request.response,
        HttpStatus.unauthorized,
        <String, Object?>{'error': 'invalid_token'},
      );
      return;
    }

    final String fileName =
        request.headers.value('x-whatsbackup-file-name')?.trim() ?? 'chat.zip';
    if (!fileName.toLowerCase().endsWith('.zip')) {
      _writeJson(
        request.response,
        HttpStatus.badRequest,
        <String, Object?>{'error': 'only_zip_supported'},
      );
      return;
    }

    final Directory tempRoot = await getTemporaryDirectory();
    final Directory incomingDir =
        Directory(p.join(tempRoot.path, 'desktop_imports'));
    if (!incomingDir.existsSync()) {
      incomingDir.createSync(recursive: true);
    }

    final String safeName = fileName.replaceAll(RegExp(r'[^A-Za-z0-9._ -]'), '_');
    final File outFile = File(
      p.join(
        incomingDir.path,
        '${DateTime.now().millisecondsSinceEpoch}_$safeName',
      ),
    );
    final IOSink sink = outFile.openWrite();
    int received = 0;
    final int expected = request.contentLength;

    _statusController.add(
      LocalTransferStatus(
        phase: 'receiving',
        message: 'Receiving $fileName',
        progress: expected > 0 ? 0 : null,
      ),
    );

    await for (final List<int> chunk in request) {
      sink.add(chunk);
      received += chunk.length;
      if (expected > 0) {
        _statusController.add(
          LocalTransferStatus(
            phase: 'receiving',
            message: 'Receiving $fileName',
            progress: received / expected,
          ),
        );
      }
    }
    await sink.flush();
    await sink.close();

    _statusController.add(
      LocalTransferStatus(
        phase: 'importing',
        message: 'Importing $fileName',
      ),
    );

    final LocalTransferUploadResult result = await onUpload(
      LocalTransferUpload(
        file: outFile,
        fileName: fileName,
        fileSize: received,
      ),
    );

    _statusController.add(
      LocalTransferStatus(
        phase: result.success ? 'done' : 'failed',
        message: result.message,
      ),
    );

    _writeJson(
      request.response,
      result.success ? HttpStatus.ok : HttpStatus.badRequest,
      <String, Object?>{
        'success': result.success,
        'message': result.message,
      },
    );
  }

  Future<List<String>> _pickCandidateAddresses() async {
    final Set<String> candidates = <String>{};
    try {
      final List<NetworkInterface> interfaces =
          await NetworkInterface.list(type: InternetAddressType.IPv4);
      for (final NetworkInterface interface in interfaces) {
        for (final InternetAddress address in interface.addresses) {
          if (address.isLoopback) {
            continue;
          }
          if (_isPrivateAddress(address.address)) {
            candidates.add(address.address);
          }
        }
      }
    } catch (_) {
      // Fall through to fallback.
    }
    if (candidates.isEmpty) {
      return <String>['127.0.0.1'];
    }
    final List<String> sorted = candidates.toList()
      ..sort((String a, String b) => _addressRank(a).compareTo(_addressRank(b)));
    return sorted;
  }

  bool _isPrivateAddress(String address) {
    return address.startsWith('10.') ||
        address.startsWith('192.168.') ||
        address.startsWith('172.16.') ||
        address.startsWith('172.17.') ||
        address.startsWith('172.18.') ||
        address.startsWith('172.19.') ||
        address.startsWith('172.2') ||
        address.startsWith('172.30.') ||
        address.startsWith('172.31.');
  }

  int _addressRank(String address) {
    if (address.startsWith('192.168.')) {
      return 0;
    }
    if (address.startsWith('172.')) {
      return 1;
    }
    if (address.startsWith('10.')) {
      return 2;
    }
    return 3;
  }

  String _generateToken() {
    final Random random = Random.secure();
    return List<String>.generate(6, (_) => random.nextInt(10).toString()).join();
  }

  void _writeJson(HttpResponse response, int status, Map<String, Object?> body) {
    response.statusCode = status;
    response.headers.contentType = ContentType.json;
    response.write(jsonEncode(body));
  }
}
