import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../l10n/app_localizations.dart';
import '../services/chat_repository.dart';
import '../services/storage_service.dart';
import '../services/storage_utils.dart';
import '../settings_controller.dart';

class StorageScreen extends StatefulWidget {
  const StorageScreen({super.key});

  @override
  State<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  @override
  void initState() {
    super.initState();
    _calculate();
  }

  final ChatRepository _repository = ChatRepository();
  StorageInfo? _storageInfo;
  int? _appSizeBytes;
  int? _failedImportBytes;
  DateTime? _lastCalculated;
  DateTime? _lastCleanup;
  bool _calculating = false;
  bool _cleaning = false;

  Future<void> _calculate() async {
    if (_calculating) {
      return;
    }
    setState(() {
      _calculating = true;
    });
    try {
      final Directory archivesRoot = await _repository.getArchivesRoot();
      final StorageInfo? info =
          await StorageService.getStorageInfo(archivesRoot);
      final Directory docs = await getApplicationDocumentsDirectory();
      final Directory support = await getApplicationSupportDirectory();
      final Directory cache = await getTemporaryDirectory();

      final int docsSize = await calculateDirectorySize(docs);
      final int supportSize = await calculateDirectorySize(support);
      final int cacheSize = await calculateDirectorySize(cache);
      final int total = docsSize + supportSize + cacheSize;
      final int failedBytes = await _calculateFailedImportBytes(archivesRoot);

      if (!mounted) {
        return;
      }
      setState(() {
        _storageInfo = info;
        _appSizeBytes = total;
        _failedImportBytes = failedBytes;
        _lastCalculated = DateTime.now();
      });
    } finally {
      if (mounted) {
        setState(() {
          _calculating = false;
        });
      }
    }
  }

  Future<int> _calculateFailedImportBytes(Directory root) async {
    int total = 0;
    if (!root.existsSync()) {
      return 0;
    }
    final List<Directory> dirs =
        root.listSync().whereType<Directory>().toList();
    for (final Directory dir in dirs) {
      final File metadata = File('${dir.path}/metadata.json');
      if (!metadata.existsSync()) {
        total += await calculateDirectorySize(dir);
      }
    }
    return total;
  }

  Future<void> _cleanFailedImports() async {
    if (_cleaning) {
      return;
    }
    setState(() {
      _cleaning = true;
    });
    try {
      final Directory root = await _repository.getArchivesRoot();
      final List<Directory> dirs =
          root.listSync().whereType<Directory>().toList();
      int reclaimed = 0;
      for (final Directory dir in dirs) {
        final File metadata = File('${dir.path}/metadata.json');
        if (!metadata.existsSync()) {
          reclaimed += await calculateDirectorySize(dir);
          if (dir.existsSync()) {
            dir.deleteSync(recursive: true);
          }
        }
      }
      if (!mounted) {
        return;
      }
      setState(() {
        _failedImportBytes = 0;
        _lastCleanup = DateTime.now();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            reclaimed == 0
                ? AppLocalizations.of(context)!.storageCleanupNone
                : AppLocalizations.of(context)!.storageCleanupDone(
                    formatBytes(reclaimed),
                  ),
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _cleaning = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final SettingsController settings = SettingsScope.of(context);
    final DateFormat timeFormat = DateFormat('MMM d, yyyy • h:mm a');

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.storageTitle),
        backgroundColor: settings.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          _InfoRow(
            label: l10n.storageAvailable,
            value: _storageInfo == null
                ? l10n.storageNotCalculated
                : formatBytes(_storageInfo!.availableBytes),
          ),
          const SizedBox(height: 12),
          _InfoRow(
            label: l10n.storageAppSize,
            value: _appSizeBytes == null
                ? l10n.storageNotCalculated
                : formatBytes(_appSizeBytes!),
          ),
          const SizedBox(height: 12),
          _InfoRow(
            label: l10n.storageLocation,
            value: _storageInfo?.volumeName?.isNotEmpty == true
                ? _storageInfo!.volumeName!
                : l10n.storageLocationUnknown,
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: Text(l10n.storageChatSizesToggle),
            subtitle: Text(l10n.storageChatSizesSubtitle),
            value: settings.showChatSizes,
            onChanged: (bool value) async {
              await settings.setShowChatSizes(value);
            },
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0x22000000)),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Color(0x11000000),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  l10n.storageCleanupTitle,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                Text(
                  l10n.storageCleanupSubtitle,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 12),
                _InfoRow(
                  label: l10n.storageCleanupEstimate,
                  value: _failedImportBytes == null
                      ? l10n.storageNotCalculated
                      : formatBytes(_failedImportBytes!),
                ),
                const SizedBox(height: 12),
                Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _cleaning ? null : _cleanFailedImports,
                      child: _cleaning
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(l10n.storageCleanupAction),
                    ),
                    const SizedBox(width: 12),
                    if (_lastCleanup != null)
                      Expanded(
                        child: Text(
                          l10n.storageCleanupLast(
                            timeFormat.format(_lastCleanup!),
                          ),
                          textAlign: TextAlign.right,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.black54),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _lastCalculated == null
                ? l10n.storageLastCalculatedNone
                : l10n.storageLastCalculated(
                    timeFormat.format(_lastCalculated!),
                  ),
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
