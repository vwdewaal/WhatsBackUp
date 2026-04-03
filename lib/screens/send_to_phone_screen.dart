import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

import '../services/chat_import_service.dart';
import '../services/local_transfer_client.dart';
import '../settings_controller.dart';

class SendToPhoneScreen extends StatefulWidget {
  const SendToPhoneScreen({super.key});

  @override
  State<SendToPhoneScreen> createState() => _SendToPhoneScreenState();
}

class _SendToPhoneScreenState extends State<SendToPhoneScreen> {
  final ChatImportService _importService = ChatImportService();
  final LocalTransferClient _client = const LocalTransferClient();
  final TextEditingController _hostController = TextEditingController();
  final TextEditingController _portController =
      TextEditingController(text: '0');
  final TextEditingController _tokenController = TextEditingController();

  List<String> _zipPaths = <String>[];
  String? _status;
  double? _progress;
  bool _sending = false;
  bool _checking = false;

  @override
  void dispose() {
    _hostController.dispose();
    _portController.dispose();
    _tokenController.dispose();
    super.dispose();
  }

  Future<void> _pickZips() async {
    final List<String> paths = await _importService.pickZipPaths(
      allowMultiple: true,
    );
    if (!mounted || paths.isEmpty) {
      return;
    }
    setState(() {
      _zipPaths = paths;
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

  Future<void> _sendSelectedZips() async {
    final String host = _hostController.text.trim();
    final int? port = int.tryParse(_portController.text.trim());
    final String token = _tokenController.text.trim();
    if (host.isEmpty || port == null || port <= 0 || token.isEmpty) {
      _showSnack('Enter the phone IP address, port, and pairing code first.');
      return;
    }
    if (_zipPaths.isEmpty) {
      _showSnack('Select one or more ZIPs first.');
      return;
    }

    setState(() {
      _sending = true;
    });

    int successCount = 0;
    final List<String> failures = <String>[];

    for (int index = 0; index < _zipPaths.length; index += 1) {
      final String zipPath = _zipPaths[index];
      if (!mounted) {
        return;
      }
      setState(() {
        _status =
            'Sending ${p.basenameWithoutExtension(zipPath)} (${index + 1}/${_zipPaths.length})';
        _progress = 0;
      });

      final LocalTransferClientResult result = await _client.uploadZip(
        host: host,
        port: port,
        token: token,
        zipPath: zipPath,
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
          ? 'Sent $successCount chat ZIPs to your phone.'
          : 'Sent $successCount of ${_zipPaths.length}. ${failures.first}';
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
                  onPressed: _sending ? null : _pickZips,
                  icon: const Icon(Icons.folder_zip),
                  label: Text(
                    _zipPaths.isEmpty
                        ? 'Select ZIPs'
                        : 'Selected ${_zipPaths.length}',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (_zipPaths.isNotEmpty) ...<Widget>[
            const Text(
              'Ready to send',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            for (final String zipPath in _zipPaths)
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.archive_outlined),
                title: Text(p.basenameWithoutExtension(zipPath)),
                subtitle: Text(zipPath),
              ),
            const SizedBox(height: 8),
          ],
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
            onPressed: _sending ? null : _sendSelectedZips,
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
