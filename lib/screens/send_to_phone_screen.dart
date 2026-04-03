import 'package:flutter/material.dart';

import '../models/chat_models.dart';
import '../services/chat_repository.dart';
import '../services/local_transfer_client.dart';
import '../services/local_transfer_bundle_service.dart';
import '../settings_controller.dart';

class SendToPhoneScreen extends StatefulWidget {
  const SendToPhoneScreen({super.key});

  @override
  State<SendToPhoneScreen> createState() => _SendToPhoneScreenState();
}

class _SendToPhoneScreenState extends State<SendToPhoneScreen> {
  final ChatRepository _repository = ChatRepository();
  final LocalTransferClient _client = const LocalTransferClient();
  final LocalTransferBundleService _bundleService = LocalTransferBundleService();
  final TextEditingController _hostController = TextEditingController();
  final TextEditingController _portController =
      TextEditingController(text: '0');
  final TextEditingController _tokenController = TextEditingController();

  List<ChatArchive> _archives = <ChatArchive>[];
  final Set<String> _selectedArchiveIds = <String>{};
  String? _status;
  double? _progress;
  bool _sending = false;
  bool _checking = false;
  bool _loadingArchives = false;

  @override
  void initState() {
    super.initState();
    _loadArchives();
  }

  @override
  void dispose() {
    _hostController.dispose();
    _portController.dispose();
    _tokenController.dispose();
    super.dispose();
  }

  Future<void> _loadArchives() async {
    setState(() {
      _loadingArchives = true;
    });
    final List<ChatArchive> archives = await _repository.getArchives();
    if (!mounted) {
      return;
    }
    setState(() {
      _archives = archives.where((ChatArchive archive) => !archive.isArchived).toList();
      _loadingArchives = false;
    });
  }

  Future<void> _checkConnection() async {
    final String host = _hostController.text.trim();
    final int? port = int.tryParse(_portController.text.trim());
    if (host.isEmpty || port == null || port <= 0) {
      _showSnack('Enter a valid phone IP address and port.');
      return;
    }

    setState(() {
      _checking = true;
      _status = 'Checking phone connection...';
      _progress = null;
    });

    try {
      final LocalTransferHandshake handshake = await _client.handshake(
        host: host,
        port: port,
      );
      if (!mounted) {
        return;
      }
      setState(() {
        _status =
            'Connected to ${handshake.app} on ${handshake.deviceAddress}:${handshake.port}.';
      });
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _status = 'Connection failed: $error';
      });
    } finally {
      if (mounted) {
        setState(() {
          _checking = false;
        });
      }
    }
  }

  Future<void> _sendSelectedArchives() async {
    final String host = _hostController.text.trim();
    final int? port = int.tryParse(_portController.text.trim());
    final String token = _tokenController.text.trim();
    if (host.isEmpty || port == null || port <= 0 || token.isEmpty) {
      _showSnack('Enter the phone IP address, port, and pairing code first.');
      return;
    }
    final List<ChatArchive> selectedArchives = _archives
        .where((ChatArchive archive) => _selectedArchiveIds.contains(archive.id))
        .toList();
    if (selectedArchives.isEmpty) {
      _showSnack('Select one or more imported chats first.');
      return;
    }

    setState(() {
      _sending = true;
    });

    int successCount = 0;
    final List<String> failures = <String>[];

    for (int index = 0; index < selectedArchives.length; index += 1) {
      final ChatArchive archive = selectedArchives[index];
      if (!mounted) {
        return;
      }
      setState(() {
        _status =
            'Preparing ${archive.displayName} (${index + 1}/${selectedArchives.length})';
        _progress = 0;
      });

      final LocalTransferBundle bundle =
          await _bundleService.createBundle(archive);

      if (!mounted) {
        return;
      }
      setState(() {
        _status =
            'Sending ${archive.displayName} (${index + 1}/${selectedArchives.length})';
        _progress = 0;
      });

      final LocalTransferClientResult result = await _client.uploadZip(
        host: host,
        port: port,
        token: token,
        zipPath: bundle.zipPath,
        onProgress: (int sentBytes, int totalBytes) {
          if (!mounted) {
            return;
          }
          setState(() {
            _progress = totalBytes > 0 ? sentBytes / totalBytes : null;
          });
        },
      );

      if (result.success) {
        successCount += 1;
      } else {
        failures.add(result.message);
      }

      if (!mounted) {
        return;
      }
      setState(() {
        _status = result.message;
      });
    }

    if (!mounted) {
      return;
    }
    setState(() {
      _sending = false;
      _progress = null;
      _status = failures.isEmpty
          ? 'Sent $successCount chats to your phone.'
          : 'Sent $successCount of ${selectedArchives.length}. ${failures.first}';
    });
  }

  void _showSnack(String message) {
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final SettingsController settings = SettingsScope.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Send to Phone'),
        backgroundColor: settings.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          const Text(
            'Open "Receive from desktop" on your phone, then enter the IP address, port, and pairing code shown there.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _hostController,
            decoration: const InputDecoration(
              labelText: 'Phone IP address',
              hintText: '192.168.1.40',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.url,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _portController,
            decoration: const InputDecoration(
              labelText: 'Port',
              hintText: '8080',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _tokenController,
            decoration: const InputDecoration(
              labelText: 'Pairing code',
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _checking || _sending ? null : _checkConnection,
                  icon: const Icon(Icons.wifi_tethering),
                  label: Text(_checking ? 'Checking...' : 'Test connection'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _sending || _loadingArchives ? null : _loadArchives,
                  icon: const Icon(Icons.refresh),
                  label: Text(
                    _loadingArchives ? 'Loading...' : 'Refresh chats',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Select imported chats',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          if (_archives.isEmpty && !_loadingArchives)
            const Text('No imported chats were found in this desktop app yet.'),
          for (final ChatArchive archive in _archives)
            CheckboxListTile(
              value: _selectedArchiveIds.contains(archive.id),
              onChanged: _sending
                  ? null
                  : (bool? value) {
                      setState(() {
                        if (value ?? false) {
                          _selectedArchiveIds.add(archive.id);
                        } else {
                          _selectedArchiveIds.remove(archive.id);
                        }
                      });
                    },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              title: Text(archive.displayName),
              subtitle: Text(archive.folderPath),
            ),
          const SizedBox(height: 8),
          if (_status != null)
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
                    _status!,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  if (_progress != null) ...<Widget>[
                    const SizedBox(height: 10),
                    LinearProgressIndicator(value: _progress),
                  ],
                ],
              ),
            ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _sending ? null : _sendSelectedArchives,
            icon: _sending
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.send),
            label: Text(_sending ? 'Sending...' : 'Send to phone'),
          ),
        ],
      ),
    );
  }
}
