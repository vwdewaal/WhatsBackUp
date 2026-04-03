import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

import '../models/chat_models.dart';
import '../services/chat_import_service.dart';
import '../services/chat_repository.dart';
import '../services/local_transfer_server.dart';
import '../services/media_import_service.dart';
import '../settings_controller.dart';

class ReceiveFromDesktopScreen extends StatefulWidget {
  const ReceiveFromDesktopScreen({super.key});

  @override
  State<ReceiveFromDesktopScreen> createState() =>
      _ReceiveFromDesktopScreenState();
}

class _ReceiveFromDesktopScreenState extends State<ReceiveFromDesktopScreen> {
  final ChatRepository _repository = ChatRepository();
  final ChatImportService _importService = ChatImportService();
  late final MediaImportService _mediaImportService =
      MediaImportService(_repository, _importService);

  LocalTransferServer? _server;
  LocalTransferSession? _session;
  LocalTransferStatus? _status;
  StreamSubscription<LocalTransferStatus>? _statusSub;
  bool _starting = false;

  @override
  void initState() {
    super.initState();
    _startServer();
  }

  @override
  void dispose() {
    _statusSub?.cancel();
    _server?.dispose();
    _mediaImportService.dispose();
    super.dispose();
  }

  Future<void> _startServer() async {
    if (_starting) {
      return;
    }
    setState(() {
      _starting = true;
    });

    final LocalTransferServer server = LocalTransferServer(
      onUpload: _importReceivedZip,
    );
    _statusSub?.cancel();
    _statusSub = server.statuses.listen((LocalTransferStatus status) {
      if (!mounted) {
        return;
      }
      setState(() {
        _status = status;
      });
    });

    try {
      final LocalTransferSession session = await server.start();
      if (!mounted) {
        await server.dispose();
        return;
      }
      setState(() {
        _server = server;
        _session = session;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _status = LocalTransferStatus(
          phase: 'failed',
          message: error.toString(),
        );
      });
    } finally {
      if (mounted) {
        setState(() {
          _starting = false;
        });
      }
    }
  }

  Future<LocalTransferUploadResult> _importReceivedZip(
    LocalTransferUpload upload,
  ) async {
    try {
      final Directory archivesRoot = await _repository.getArchivesRoot();
      final PreparedImport prepared =
          await _importService.prepareImportTextOnlyFromPath(
        archivesRoot: archivesRoot,
        zipPath: upload.file.path,
      );

      final List<ChatArchive> existing = await _repository.getArchives();
      final String normalized =
          _importService.normalizeArchiveName(prepared.finalName);
      final List<ChatArchive> candidates = existing.where((ChatArchive archive) {
        final String bySource =
            _importService.normalizeArchiveName(archive.sourceName);
        final String byName = _importService.normalizeArchiveName(archive.name);
        return bySource == normalized || byName == normalized;
      }).toList();

      if (candidates.isEmpty) {
        final ChatArchive archive = await _importService.finalizeNewImport(
          archivesRoot: archivesRoot,
          prepared: prepared,
        );
        await _mediaImportService.startJob(
          archive: archive,
          zipPath: p.join(
            archive.folderPath,
            p.relative(prepared.zipPath, from: prepared.tempDirPath),
          ),
          targetDir: archive.folderPath,
        );
        return LocalTransferUploadResult(
          success: true,
          message: 'Imported ${archive.displayName}',
        );
      }

      final ChatArchive target = candidates.first;
      final String chatFilePath = await _importService.finalizeIncrementalImport(
        archivesRoot: archivesRoot,
        prepared: prepared,
        existing: target,
      );
      final List<String> additional = List<String>.from(
        target.additionalChatFiles,
      )..add(chatFilePath);
      final ChatArchive updated = ChatArchive(
        id: target.id,
        name: target.name,
        sourceName: target.sourceName,
        folderPath: target.folderPath,
        chatFilePath: target.chatFilePath,
        createdAt: target.createdAt,
        isArchived: target.isArchived,
        additionalChatFiles: additional,
      );
      await _repository.updateArchive(updated);
      await _importService.invalidateMessageStore(updated);
      final String importRootPath = p.dirname(p.dirname(chatFilePath));
      await _mediaImportService.startJob(
        archive: updated,
        zipPath: p.join(importRootPath, '_import_source.zip'),
        targetDir: importRootPath,
      );
      return LocalTransferUploadResult(
        success: true,
        message: 'Updated ${updated.displayName}',
      );
    } catch (error) {
      return LocalTransferUploadResult(
        success: false,
        message: error.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final SettingsController settings = SettingsScope.of(context);
    final LocalTransferSession? session = _session;
    final LocalTransferStatus? status = _status;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Receive From Desktop'),
        backgroundColor: settings.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          const Text(
            'Open this screen on your phone, then enter these details on desktop.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 12),
          const Text(
            'Desktop and phone need to be on the same local network. The receiver turns off when you leave this screen.',
          ),
          const SizedBox(height: 16),
          _InfoCard(
            label: 'Recommended IP address',
            value: session?.address ?? (_starting ? 'Starting...' : 'Unavailable'),
          ),
          if (session != null && session.addresses.length > 1) ...<Widget>[
            const SizedBox(height: 12),
            _InfoCard(
              label: 'Other local addresses',
              value: session.addresses.skip(1).join('\n'),
            ),
          ],
          const SizedBox(height: 12),
          _InfoCard(
            label: 'Port',
            value: session?.port.toString() ?? (_starting ? 'Starting...' : 'Unavailable'),
          ),
          const SizedBox(height: 12),
          _InfoCard(
            label: 'Pairing code',
            value: session?.token ?? (_starting ? 'Generating...' : 'Unavailable'),
          ),
          const SizedBox(height: 20),
          if (session != null)
            const Text(
              'If desktop cannot connect, try one of the other local addresses shown here. VPN or virtual adapters can make phones report a 10.x address even when your Wi-Fi is 192.168.x.x.',
            ),
          if (session != null) const SizedBox(height: 20),
          if (status != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0x22000000)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    status.message,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  if (status.progress != null) ...<Widget>[
                    const SizedBox(height: 10),
                    LinearProgressIndicator(value: status.progress),
                  ],
                ],
              ),
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _starting
                ? null
                : () async {
                    await _server?.dispose();
                    _server = null;
                    _session = null;
                    await _startServer();
                  },
            child: const Text('Refresh pairing code'),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x22000000)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF667781),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
