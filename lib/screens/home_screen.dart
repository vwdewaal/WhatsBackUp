import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:path/path.dart' as p;

import '../models/chat_models.dart';
import '../services/chat_import_service.dart';
import '../services/chat_repository.dart';
import '../services/media_import_service.dart';
import '../services/revenuecat_service.dart';
import '../services/storage_utils.dart';
import '../settings_controller.dart';
import 'chat_screen.dart';
import 'how_to_import_screen.dart';
import 'onboarding_screen.dart';
import 'settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum _SelectionModeType { hide, lock }

enum _ImportUiState { idle, importing, done }

Future<String?> _showPasscodeDialog({
  required BuildContext context,
  required String title,
  required String hintText,
  required String submitLabel,
}) async {
  final TextEditingController controller = TextEditingController();
  bool obscure = true;
  final String? code = await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, void Function(void Function()) setState) {
          return AlertDialog(
            title: Text(title),
            content: TextField(
              controller: controller,
              autofocus: true,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              enableSuggestions: false,
              autocorrect: false,
              maxLength: 8,
              obscureText: obscure,
              obscuringCharacter: '•',
              decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: IconButton(
                  tooltip: obscure ? 'Show passcode' : 'Hide passcode',
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              onSubmitted: (_) => Navigator.of(context).pop(controller.text.trim()),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(controller.text.trim()),
                child: Text(submitLabel),
              ),
            ],
          );
        },
      );
    },
  );
  if (code == null || code.isEmpty) {
    return null;
  }
  return code;
}

class _ImportProgress {
  const _ImportProgress({
    required this.progress,
    required this.message,
    this.indeterminate = false,
  });

  final double progress;
  final String message;
  final bool indeterminate;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  static const MethodChannel _shareChannel = MethodChannel('whatsbackup/share');
  static const String _prefsHideModeKey = 'hide_mode';
  static const String _prefsImportCountKey = 'import_count';
  static const int _freeImportLimit = 5;

  final ChatRepository _repository = ChatRepository();
  final ChatImportService _importService = ChatImportService();
  late final MediaImportService _mediaImportService =
      MediaImportService(_repository, _importService);
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy').add_jm();
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<_ImportProgress?> _importProgress =
      ValueNotifier<_ImportProgress?>(null);
  late final AnimationController _importPulseController;
  late final Animation<double> _importPulse;
  late final AnimationController _importColorController;

  bool _busy = false;
  bool _importDialogShown = false;
  bool _largeImport = false;
  _ImportUiState _importUiState = _ImportUiState.idle;
  double _importUiProgress = 0.0;
  bool _importUiIndeterminate = false;
  List<ChatArchive> _archives = <ChatArchive>[];
  List<ChatArchive> _visibleActive = <ChatArchive>[];
  List<ChatArchive> _visibleArchived = <ChatArchive>[];
  bool _handlingShare = false;
  Set<String> _hiddenIds = <String>{};
  Set<String> _lockedIds = <String>{};
  bool _hideMode = false;
  bool _selectionMode = false;
  _SelectionModeType _selectionModeType = _SelectionModeType.hide;
  String? _pendingCode;
  final Set<String> _selectedIds = <String>{};
  Set<String> _disabledIds = <String>{};
  bool _searchExpanded = false;
  bool _mediaOnly = false;
  DateTime? _filterStart;
  DateTime? _filterEnd;
  String _searchQuery = '';
  Timer? _searchDebounce;
  bool _emptyTopExpanded = false;
  bool _importLocationBannerShown = false;
  Timer? _largeImportBannerTimer;
  final ValueNotifier<int> _importLocationCountdown =
      ValueNotifier<int>(0);
  Timer? _importLocationTimer;
  Completer<bool>? _importLocationCompleter;

  AppLocalizations get _l10n => AppLocalizations.of(context)!;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _importPulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _importPulse = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _importPulseController, curve: Curves.easeInOut),
    );
    _importColorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..value = 1.0;
    _loadArchives();
    _consumeSharedFiles();
    _maybeShowOnboarding();
    _loadHideMode();
    _mediaImportService.resumePendingJobs();
    // Import FAB visibility is driven by SettingsController.
    _searchController.addListener(_onSearchChanged);
    RevenueCatService.isPro.addListener(_handleProStatusChanged);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _searchDebounce?.cancel();
    _largeImportBannerTimer?.cancel();
    _searchController.dispose();
    _importProgress.dispose();
    _importPulseController.dispose();
    _importColorController.dispose();
    _mediaImportService.dispose();
    RevenueCatService.isPro.removeListener(_handleProStatusChanged);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _consumeSharedFiles();
      _loadHideMode();
      _mediaImportService.resumePendingJobs();
    }
  }

  Future<void> _consumeSharedFiles() async {
    if (_handlingShare) {
      return;
    }
    _handlingShare = true;
    try {
      final List<dynamic> raw =
          await _shareChannel.invokeMethod<List<dynamic>>('consumeSharedFiles') ??
              <dynamic>[];
      final List<String> paths = raw.whereType<String>().toList();
      if (paths.isEmpty) {
        return;
      }
      await _handleSharedPaths(paths);
    } on PlatformException catch (e) {
      if (context.mounted) {
        _showMessage(_l10n.importFailedWithDetail(e.message ?? e.code));
      }
    } catch (e) {
      if (context.mounted) {
        _showMessage(_l10n.importFailedWithDetail(e.toString()));
      }
    } finally {
      _handlingShare = false;
    }
  }

  Future<void> _maybeShowOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool hasSeen = prefs.getBool('has_seen_onboarding') ?? false;
    if (hasSeen || !mounted) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!context.mounted) {
        return;
      }
      await Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => OnboardingScreen(
            onDone: () {
              Navigator.of(context).pop();
            },
          ),
          fullscreenDialog: true,
        ),
      );
      await prefs.setBool('has_seen_onboarding', true);
    });
  }

  Future<void> _handleSharedPaths(List<String> paths) async {
    final bool canImport = await _ensureCanImport();
    if (!canImport) {
      return;
    }
    final String zipPath = paths.firstWhere(
      (String path) => path.toLowerCase().endsWith('.zip'),
      orElse: () => '',
    );
    if (zipPath.isEmpty) {
      _showMessage(_l10n.sharedFileNotZip);
      return;
    }

    if (context.mounted) {
      setState(() {
        _busy = true;
      });
    }

    String resolvedPath = zipPath;
    if (resolvedPath.startsWith('file://')) {
      resolvedPath = Uri.parse(resolvedPath).toFilePath();
    }

    try {
      _notifyImportTriggered();
      await _setLargeImportFlag(zipPath);
      await _showLargeImportStartedIfNeeded();
      _updateImportProgress(0.0, _l10n.importAnalyzing, indeterminate: true);
      _showImportProgressDialog();
      _updateImportProgress(0.0, _l10n.importPreparing);
      final PreparedImport prepared =
          await _importService.prepareImportTextOnlyFromPath(
        archivesRoot: await _repository.getArchivesRoot(),
        zipPath: resolvedPath,
        onProgress: (double progress) {
          _updateImportProgress(progress, _l10n.importExtracting);
        },
      );
      await _handlePreparedImport(prepared);
    } on FormatException catch (e) {
      if (context.mounted) {
        _showMessage(_importErrorMessage(e.message));
      }
    } catch (e) {
      if (context.mounted) {
        _showMessage(_l10n.importFailedWithDetail(e.toString()));
      }
    } finally {
      _hideLargeImportBanner();
      _largeImport = false;
      _clearImportProgress();
      _dismissImportProgressDialog();
      if (_importUiState != _ImportUiState.done) {
        _resetImportUi();
      }
      if (context.mounted) {
        setState(() {
          _busy = false;
        });
      }
    }
  }

  Future<void> _loadArchives() async {
    final List<ChatArchive> archives = await _repository.getArchives();
    final Set<String> disabledIds = _computeDisabledIds(archives);
    archives.sort((ChatArchive a, ChatArchive b) =>
        a.displayName.toLowerCase().compareTo(b.displayName.toLowerCase()));
    final Map<String, List<String>> hidden = await _repository.loadHiddenMap();
    final Map<String, List<String>> locked = await _repository.loadLockedMap();
    final Set<String> hiddenIds = <String>{};
    for (final List<String> ids in hidden.values) {
      hiddenIds.addAll(ids);
    }
    final Set<String> lockedIds = <String>{};
    for (final List<String> ids in locked.values) {
      lockedIds.addAll(ids);
    }
    if (!context.mounted) {
      return;
    }

    setState(() {
      _archives = archives;
      _hiddenIds = hiddenIds;
      _lockedIds = lockedIds;
      _disabledIds = disabledIds;
    });
    await _applyFilters();
  }

  Future<void> _loadHideMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool hideMode = prefs.getBool(_prefsHideModeKey) ?? false;
    if (!context.mounted) {
      return;
    }
    setState(() {
      _hideMode = hideMode;
    });
  }

  // Import FAB visibility is stored in SettingsController.

  void _onSearchChanged() {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 250), () {
      _searchQuery = _searchController.text.trim();
      _applyFilters();
    });
  }

  bool get _hasActiveFilters {
    return _searchQuery.isNotEmpty ||
        _mediaOnly ||
        _filterStart != null ||
        _filterEnd != null;
  }

  Future<void> _applyFilters() async {
    final List<ChatArchive> activeBase = _archives
        .where((ChatArchive a) => !a.isArchived && !_hiddenIds.contains(a.id))
        .toList();
    final List<ChatArchive> archivedBase = _archives
        .where((ChatArchive a) => a.isArchived && !_hiddenIds.contains(a.id))
        .toList();

    final bool hasQuery = _searchQuery.isNotEmpty;
    final bool hasDateFilter = _filterStart != null || _filterEnd != null;

    if (!hasQuery && !hasDateFilter && !_mediaOnly) {
      if (!context.mounted) {
        return;
      }
      setState(() {
        _visibleActive = activeBase;
        _visibleArchived = archivedBase;
      });
      return;
    }

    if (!context.mounted) {
      return;
    }
    final List<ChatArchive> activeMatches = <ChatArchive>[];
    for (final ChatArchive archive in activeBase) {
      if (await _archiveMatchesFilters(archive)) {
        activeMatches.add(archive);
      }
    }
    final List<ChatArchive> archivedMatches = <ChatArchive>[];
    for (final ChatArchive archive in archivedBase) {
      if (await _archiveMatchesFilters(archive)) {
        archivedMatches.add(archive);
      }
    }

    if (!context.mounted) {
      return;
    }
    setState(() {
      _visibleActive = activeMatches;
      _visibleArchived = archivedMatches;
    });
  }

  Future<bool> _archiveMatchesFilters(ChatArchive archive) async {
    if (_matchesArchiveName(archive) &&
        _filterStart == null &&
        _filterEnd == null &&
        !_mediaOnly) {
      return true;
    }

    ParsedChat parsed;
    try {
      parsed = await _importService.parseArchiveAsync(archive);
    } catch (_) {
      return false;
    }

    for (final ChatMessage message in parsed.messages) {
      if (!_messageMatchesQuery(message)) {
        continue;
      }
      if (!_messageMatchesDate(message)) {
        continue;
      }
      if (_mediaOnly && message.attachmentPath == null) {
        continue;
      }
      return true;
    }

    return false;
  }

  bool _matchesArchiveName(ChatArchive archive) {
    if (_searchQuery.isEmpty) {
      return false;
    }
    final String query = _searchQuery.toLowerCase();
    return archive.name.toLowerCase().contains(query) ||
        archive.sourceName.toLowerCase().contains(query);
  }

  bool _messageMatchesQuery(ChatMessage message) {
    if (_searchQuery.isEmpty) {
      return true;
    }
    final String query = _searchQuery.toLowerCase();
    return message.text.toLowerCase().contains(query);
  }

  bool _messageMatchesDate(ChatMessage message) {
    if (_filterStart == null && _filterEnd == null) {
      return true;
    }
    if (message.timestamp == null) {
      return false;
    }
    final DateTime ts = message.timestamp!;
    if (_filterStart != null && ts.isBefore(_filterStart!)) {
      return false;
    }
    if (_filterEnd != null) {
      final DateTime end = _filterEnd!.add(const Duration(days: 1)).subtract(const Duration(milliseconds: 1));
      if (ts.isAfter(end)) {
        return false;
      }
    }
    return true;
  }

  Future<void> _openFilterDialog() async {
    final TextEditingController localController =
        TextEditingController(text: _searchQuery);
    DateTime? localStart = _filterStart;
    DateTime? localEnd = _filterEnd;
    bool localMediaOnly = _mediaOnly;

    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setModalState) {
              Future<void> pickFrom() async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: localStart ?? DateTime.now(),
                  firstDate: DateTime(2010),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (picked == null) {
                  return;
                }
                setModalState(() {
                  localStart = picked;
                });
              }

              Future<void> pickTo() async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: localEnd ?? DateTime.now(),
                  firstDate: DateTime(2010),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (picked == null) {
                  return;
                }
                setModalState(() {
                  localEnd = picked;
                });
              }

              return Container(
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _l10n.searchTitle,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    Text(_l10n.textToInclude, style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 6),
                    TextField(
                      controller: localController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: _l10n.enterSearchText,
                        isDense: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(_l10n.dateRange, style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 6),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(_l10n.fromLabel, style: const TextStyle(fontSize: 12)),
                              const SizedBox(height: 4),
                              InkWell(
                                onTap: pickFrom,
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                  ),
                                  child: Text(
                                    localStart == null
                                        ? _l10n.selectLabel
                                        : DateFormat('dd/MM/yyyy').format(localStart!),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(_l10n.toLabel, style: const TextStyle(fontSize: 12)),
                              const SizedBox(height: 4),
                              InkWell(
                                onTap: pickTo,
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                  ),
                                  child: Text(
                                    localEnd == null
                                        ? _l10n.selectLabel
                                        : DateFormat('dd/MM/yyyy').format(localEnd!),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: localMediaOnly,
                          onChanged: (bool? value) {
                            setModalState(() {
                              localMediaOnly = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(_l10n.showOnlyMediaFiles, style: const TextStyle(fontSize: 14)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            setModalState(() {
                              localController.clear();
                              localStart = null;
                              localEnd = null;
                              localMediaOnly = false;
                            });
                          },
                          child: Text(_l10n.clearAction),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              _searchQuery = localController.text.trim();
                              _searchController.text = _searchQuery;
                              _filterStart = localStart;
                              _filterEnd = localEnd;
                              _mediaOnly = localMediaOnly;
                              _searchExpanded = true;
                            });
                            _applyFilters();
                          },
                          child: Text(_l10n.searchAction),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _renameArchive(ChatArchive archive) async {
    final TextEditingController controller = TextEditingController(text: archive.name);
    final String? updated = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_l10n.renameChatTitle),
          content: TextField(
            controller: controller,
            autofocus: true,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(hintText: _l10n.chatNameHint),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(_l10n.cancelAction),
            ),
            ElevatedButton(
              onPressed: () {
                final String value = controller.text.trim();
                Navigator.of(context).pop(value.isEmpty ? null : value);
              },
              child: Text(_l10n.saveAction),
            ),
          ],
        );
      },
    );

    if (updated == null || updated == archive.name) {
      return;
    }

    final ChatArchive renamed = ChatArchive(
      id: archive.id,
      name: updated,
      sourceName: archive.sourceName,
      folderPath: archive.folderPath,
      chatFilePath: archive.chatFilePath,
      createdAt: archive.createdAt,
      isArchived: archive.isArchived,
      additionalChatFiles: archive.additionalChatFiles,
    );
    await _repository.updateArchive(renamed);
    await _loadArchives();
  }

  void _clearSearchAndFilters() {
    setState(() {
      _searchController.clear();
      _searchQuery = '';
      _filterStart = null;
      _filterEnd = null;
      _mediaOnly = false;
      _searchExpanded = false;
    });
    _applyFilters();
  }

  Future<void> _import() async {
    if (_busy) {
      return;
    }

    final bool canImport = await _ensureCanImport();
    if (!canImport) {
      return;
    }

    if (context.mounted) {
      setState(() {
        _busy = true;
      });
    }
    _notifyImportTriggered();
    _showImportStartupBanner();
    final String? zipPath = await _importService.pickZipPath();
    if (zipPath == null) {
      _hideLargeImportBanner();
      _resetImportUi();
      if (context.mounted) {
        setState(() {
          _busy = false;
        });
      }
      return;
    }

    try {
      await _setLargeImportFlag(zipPath);
      await _showLargeImportStartedIfNeeded();
      _showImportProgressDialog();
      _updateImportProgress(0.0, _l10n.importPreparing);
      final PreparedImport prepared =
          await _importService.prepareImportTextOnlyFromPath(
        archivesRoot: await _repository.getArchivesRoot(),
        zipPath: zipPath,
        onProgress: (double progress) {
          _updateImportProgress(progress, _l10n.importExtracting);
        },
      );
      await _handlePreparedImport(prepared);
    } on FormatException catch (e) {
      if (!context.mounted) {
        return;
      }
      _showMessage(_importErrorMessage(e.message));
    } catch (e) {
      if (!context.mounted) {
        return;
      }
      _showMessage(_l10n.importFailedWithDetail(e.toString()));
    } finally {
      _hideLargeImportBanner();
      _largeImport = false;
      _clearImportProgress();
      _dismissImportProgressDialog();
      if (_importUiState != _ImportUiState.done) {
        _resetImportUi();
      }
      if (context.mounted) {
        setState(() {
          _busy = false;
        });
      }
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _buildMessageStoreIfNeeded(ChatArchive archive) async {
    final bool useStore = await _importService.shouldUseMessageStore(archive);
    if (!useStore) {
      return;
    }
    _updateImportProgress(0.0, _l10n.importFinalizing);
    if (!_importDialogShown && mounted) {
      _showImportProgressDialog();
    }
    await _importService.buildMessageStore(
      archive: archive,
      onProgress: (double progress) {
        _updateImportProgress(progress, _l10n.importFinalizing);
      },
    );
  }

  Future<void> _handlePreparedImport(PreparedImport prepared) async {
    bool finalized = false;
    try {
      final Directory root = await _repository.getArchivesRoot();
      final List<ChatArchive> existing = await _repository.getArchives();
      final String normalized =
          _importService.normalizeArchiveName(prepared.finalName);
      final List<ChatArchive> candidates =
          existing.where((ChatArchive archive) {
        final String bySource =
            _importService.normalizeArchiveName(archive.sourceName);
        final String byName = _importService.normalizeArchiveName(archive.name);
        return bySource == normalized || byName == normalized;
      }).toList();

      if (candidates.isEmpty) {
        _updateImportProgress(1.0, _l10n.importFinalizing);
        final ChatArchive archive = await _importService.finalizeNewImport(
          archivesRoot: root,
          prepared: prepared,
        );
        finalized = true;
        await _mediaImportService.startJob(
          archive: archive,
          zipPath: prepared.zipPath,
          targetDir: archive.folderPath,
        );
        await _recordImportIfNeeded();
        await _loadArchives();
        _markImportDone();
        if (!context.mounted) {
          return;
        }
        final NavigatorState navigator = Navigator.of(context);
        await navigator.push(
          MaterialPageRoute<void>(
            builder: (_) => ChatScreen(
              archive: archive,
              importService: _importService,
              mediaImportService: _mediaImportService,
            ),
          ),
        );
        await _loadArchives();
        _resetImportUi();
        return;
      }

      final ChatArchive? target =
          await _promptIncrementalTarget(prepared.finalName, candidates);
      if (target == null) {
        return;
      }

      _updateImportProgress(1.0, _l10n.importFinalizing);
      final String newChatFilePath =
          await _importService.finalizeIncrementalImport(
        archivesRoot: root,
        prepared: prepared,
        existing: target,
      );
      finalized = true;

      await _mediaImportService.startJob(
        archive: target,
        zipPath: prepared.zipPath,
        targetDir: p.dirname(newChatFilePath),
      );

      final List<String> additional =
          List<String>.from(target.additionalChatFiles);
      additional.add(newChatFilePath);
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
      await _loadArchives();
      _markImportDone();
      if (!context.mounted) {
        return;
      }
      _showMessage(_l10n.incrementalUpdated);
      final NavigatorState navigator = Navigator.of(context);
      await navigator.push(
        MaterialPageRoute<void>(
          builder: (_) => ChatScreen(
            archive: updated,
            importService: _importService,
            mediaImportService: _mediaImportService,
          ),
        ),
      );
      await _loadArchives();
      _resetImportUi();
    } finally {
      if (!finalized) {
        await _importService.discardPreparedImport(prepared);
      }
    }
  }

  Future<ChatArchive?> _promptIncrementalTarget(
    String finalName,
    List<ChatArchive> candidates,
  ) async {
    if (candidates.length == 1) {
      final bool? confirmed = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(_l10n.incrementalImportTitle),
            content: Text(_l10n.incrementalImportMessage(finalName)),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(_l10n.cancelAction),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(_l10n.incrementalAddAction),
              ),
            ],
          );
        },
      );
      return confirmed == true ? candidates.first : null;
    }

    return showModalBottomSheet<ChatArchive>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(_l10n.incrementalChooseTitle),
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: candidates.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ChatArchive archive = candidates[index];
                    return ListTile(
                      title: Text(archive.displayName),
                      subtitle: Text(
                        _l10n.importedOn(_dateFormat.format(archive.createdAt)),
                      ),
                      onTap: () => Navigator.of(context).pop(archive),
                    );
                  },
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(_l10n.cancelAction),
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleProStatusChanged() {
    if (!context.mounted) {
      return;
    }
    setState(() {
      _disabledIds = _computeDisabledIds(_archives);
    });
    _applyFilters();
  }

  Set<String> _computeDisabledIds(List<ChatArchive> archives) {
    if (RevenueCatService.isPro.value) {
      return <String>{};
    }
    if (archives.length <= _freeImportLimit) {
      return <String>{};
    }
    final List<ChatArchive> ordered = List<ChatArchive>.from(archives)
      ..sort((ChatArchive a, ChatArchive b) =>
          a.createdAt.compareTo(b.createdAt));
    return ordered
        .skip(_freeImportLimit)
        .map((ChatArchive archive) => archive.id)
        .toSet();
  }

  Future<void> _dismissImportFab() async {
    final SettingsController settings = SettingsScope.of(context);
    await settings.setHideImportFab(true);
    if (!context.mounted) {
      return;
    }
    _showMessage(_l10n.importButtonHiddenMessage);
  }

  Future<bool> _ensureCanImport() async {
    try {
      if (await RevenueCatService.hasEntitlement()) {
        return true;
      }
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final int count = prefs.getInt(_prefsImportCountKey) ?? 0;
      if (count < _freeImportLimit) {
        return true;
      }
      await RevenueCatService.presentPaywall();
      if (await RevenueCatService.hasEntitlement()) {
        return true;
      }
      if (context.mounted) {
        _showMessage(_l10n.unlockProToImportMoreChats);
      }
      return false;
    } catch (error) {
      final PurchasesErrorCode? code = RevenueCatService.parseErrorCode(error);
      if (code != PurchasesErrorCode.purchaseCancelledError && mounted) {
        _showMessage(_l10n.purchaseFailedTryAgain);
      }
      return false;
    }
  }

  Future<void> _recordImportIfNeeded() async {
    if (await RevenueCatService.hasEntitlement()) {
      return;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int count = prefs.getInt(_prefsImportCountKey) ?? 0;
    await prefs.setInt(_prefsImportCountKey, count + 1);
  }

  void _updateImportProgress(
    double progress,
    String message, {
    bool indeterminate = false,
  }) {
    final String effectiveMessage = _largeImport
        ? '$message\n${_l10n.importLargeFileNotice}'
        : message;
    _importProgress.value = _ImportProgress(
      progress: progress.clamp(0.0, 1.0),
      message: effectiveMessage,
      indeterminate: indeterminate,
    );
    if (mounted) {
      setState(() {
        _importUiState = _ImportUiState.importing;
        _importUiProgress = progress.clamp(0.0, 1.0);
        _importUiIndeterminate = indeterminate;
      });
    }
    if (!_importPulseController.isAnimating) {
      _importPulseController.repeat(reverse: true);
    }
    _importColorController.forward(from: 0.0);
  }

  String _importErrorMessage(String code) {
    switch (code) {
      case ChatImportService.errorOnlyZip:
        return _l10n.importErrorOnlyZip;
      case ChatImportService.errorNoChatText:
        return _l10n.importErrorNoChatText;
      case ChatImportService.errorChatAlreadyImported:
        return _l10n.importErrorAlreadyImported;
      default:
        return code;
    }
  }

  void _clearImportProgress() {
    _importProgress.value = null;
  }

  void _notifyImportTriggered() {
    if (!mounted) {
      return;
    }
    setState(() {
      _importUiState = _ImportUiState.importing;
      _importUiProgress = 0.0;
      _importUiIndeterminate = true;
    });
    if (!_importPulseController.isAnimating) {
      _importPulseController.repeat(reverse: true);
    }
  }

  void _markImportDone() {
    if (!mounted) {
      return;
    }
    setState(() {
      _importUiState = _ImportUiState.done;
      _importUiProgress = 1.0;
      _importUiIndeterminate = false;
    });
    _importPulseController.stop();
    _importColorController.value = 1.0;
  }

  void _resetImportUi() {
    if (!mounted) {
      return;
    }
    setState(() {
      _importUiState = _ImportUiState.idle;
      _importUiProgress = 0.0;
      _importUiIndeterminate = false;
    });
    _importPulseController.stop();
    _importColorController.value = 1.0;
  }

  Future<void> _showLargeImportStartedIfNeeded() async {
    if (!_largeImport || !mounted) {
      return;
    }
    _showImportStartupBanner();
    await Future<void>.delayed(const Duration(milliseconds: 1500));
  }

  void _showImportStartupBanner() {
    if (!mounted) {
      return;
    }
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    _largeImportBannerTimer?.cancel();
    messenger.hideCurrentMaterialBanner();
    messenger.showMaterialBanner(
      MaterialBanner(
        content: const Text(
          'Large files take a while to load. It can be up to a minute. Please be patient while the import starts.',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: _hideLargeImportBanner,
            child: const Text('OK'),
          ),
        ],
      ),
    );
    _largeImportBannerTimer = Timer(
      const Duration(seconds: 6),
      _hideLargeImportBanner,
    );
  }

  void _hideLargeImportBanner() {
    _largeImportBannerTimer?.cancel();
    _largeImportBannerTimer = null;
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
  }

  Future<void> _setLargeImportFlag(String zipPath) async {
    _largeImport = false;
    try {
      final File file = File(zipPath);
      if (!await file.exists()) {
        return;
      }
      final int bytes = await file.length();
      _largeImport = bytes >= 1024 * 1024 * 1024;
    } catch (_) {
      _largeImport = false;
    }
  }

  void _showImportProgressDialog() {
    if (_importDialogShown || !mounted) {
      return;
    }
    FocusScope.of(context).unfocus();
    _importDialogShown = true;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ValueListenableBuilder<_ImportProgress?>(
          valueListenable: _importProgress,
          builder: (BuildContext context, _ImportProgress? progress, _) {
            final double value = progress?.progress ?? 0.0;
            final String message = progress?.message ?? _l10n.working;
            final bool indeterminate = progress?.indeterminate ?? false;
            final int percent = (value * 100).round();
            return AlertDialog(
              content: Row(
                children: <Widget>[
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      value: indeterminate ? null : value,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(message),
                        if (!indeterminate) ...<Widget>[
                          const SizedBox(height: 4),
                          Text('$percent%'),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      _importDialogShown = false;
    });
  }

  void _dismissImportProgressDialog() {
    if (!_importDialogShown || !mounted) {
      return;
    }
    Navigator.of(context, rootNavigator: true).pop();
  }

  Future<void> _runWithBlockingDialog({
    required String message,
    required Future<void> Function() action,
  }) async {
    if (!context.mounted) {
      return;
    }
    final BuildContext currentContext = context;
    FocusScope.of(currentContext).unfocus();
    showDialog<void>(
      context: currentContext,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              const SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(),
              ),
              const SizedBox(width: 16),
              Expanded(child: Text(message)),
            ],
          ),
        );
      },
    );
    try {
      await action();
    } finally {
      if (currentContext.mounted) {
        Navigator.of(currentContext, rootNavigator: true).pop();
      }
    }
  }

  Widget _buildImportButton() {
    final bool importing = _importUiState == _ImportUiState.importing;
    final bool done = _importUiState == _ImportUiState.done;
    final ThemeData theme = Theme.of(context);
    final Color idleColor =
        theme.floatingActionButtonTheme.backgroundColor ?? Colors.teal;
    final Color startColor = const Color(0xFF253342);

    final String label = importing
        ? _l10n.importingLabel
        : done
            ? _l10n.importDoneLabel
            : _l10n.importAction;

    final Widget labelWidget = importing
        ? AnimatedBuilder(
            animation: _importPulse,
            builder: (BuildContext context, _) {
              return Opacity(
                opacity: _importPulse.value,
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
                ),
              );
            },
          )
        : Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
            ),
          );

    return AnimatedBuilder(
      animation: _importColorController,
      builder: (BuildContext context, _) {
        final double colorT = importing ? _importColorController.value : 1.0;
        final Color resolvedColor = Color.lerp(startColor, idleColor, colorT)!;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: resolvedColor,
            borderRadius: BorderRadius.circular(999),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            shape: const StadiumBorder(),
            child: InkWell(
              borderRadius: BorderRadius.circular(999),
              onTap: _busy ? null : _import,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (_busy && importing) ...<Widget>[
                      const SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ] else ...<Widget>[
                      const Icon(Icons.archive, size: 18, color: Colors.white),
                      const SizedBox(width: 8),
                    ],
                    DefaultTextStyle(
                      style: const TextStyle(color: Colors.white),
                      child: labelWidget,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final SettingsController settings = SettingsScope.of(context);
    final List<ChatArchive> active = _visibleActive;
    final List<ChatArchive> archived = _visibleArchived;
    final bool hasImportedChats = _archives.any(
      (ChatArchive archive) => !_hiddenIds.contains(archive.id),
    );
    final bool noVisibleChats = active.isEmpty && archived.isEmpty;
    final bool noChats = !hasImportedChats;
    final String emptySearchMessage = 'The searched word was not found.';
    final MediaQueryData media = MediaQuery.of(context);
    final bool compactActions =
        media.textScaler.scale(1.0) >= 1.2 || media.size.width < 380;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            tooltip: _l10n.hideChatsTooltip,
            icon: const SizedBox(
              width: 24,
              height: 24,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Icon(Icons.lock_outline, size: 22),
                  Icon(Icons.block, size: 22),
                ],
              ),
            ),
            onPressed: _promptHideCode,
          ),
          title: Text(
            AppLocalizations.of(context)!.appTitle,
            overflow: TextOverflow.ellipsis,
          ),
          backgroundColor: settings.primaryColor,
          foregroundColor: Colors.white,
          actions: compactActions
              ? <Widget>[
                  PopupMenuButton<String>(
                    tooltip: _l10n.moreOptionsTooltip,
                    onSelected: (String value) async {
                      if (value == 'help') {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const HowToImportScreen(),
                          ),
                        );
                        return;
                      }
                      if (value == 'settings') {
                        await Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const SettingsScreen(),
                          ),
                        );
                        await _loadHideMode();
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'help',
                          child: Text(_l10n.howToImport),
                        ),
                        PopupMenuItem<String>(
                          value: 'settings',
                          child: Text(_l10n.settings),
                        ),
                      ];
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                ]
              : <Widget>[
                  IconButton(
                    tooltip: AppLocalizations.of(context)!.howToImport,
                    icon: const Icon(Icons.help_outline),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const HowToImportScreen(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    tooltip: AppLocalizations.of(context)!.settings,
                    icon: const Icon(Icons.settings),
                    onPressed: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const SettingsScreen(),
                        ),
                      );
                      await _loadHideMode();
                    },
                  ),
                ],
          
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(_searchExpanded ? 104 : 48),
            child: noChats
                ? const SizedBox.shrink()
                : _buildSearchBar(settings.primaryColor),
          ),
        ),
        floatingActionButton: settings.hideImportFab
            ? null
            : Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  _buildImportButton(),
                  Positioned(
                    top: -6,
                    right: -6,
                    child: Material(
                      color: Colors.white,
                      shape: const CircleBorder(),
                      elevation: 2,
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: _dismissImportFab,
                        child: const SizedBox(
                          width: 24,
                          height: 24,
                          child: Icon(Icons.close, size: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        bottomNavigationBar: _selectionMode
            ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: <Widget>[
                      TextButton(
                        onPressed: _cancelSelection,
                        child: Text(_l10n.cancelAction),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: _submitHiddenSelection,
                        child: Text(
                          _selectionModeType == _SelectionModeType.hide
                              ? _l10n.hideAction
                              : _l10n.lockAction,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : null,
        body: noChats
            ? _buildEmptyImportState()
            : TabBarView(
                children: <Widget>[
                  _ArchiveList(
                    archives: active,
                    emptyMessage:
                        _hasActiveFilters && noVisibleChats
                            ? emptySearchMessage
                            : _l10n.noChatsYetHint,
                    dateFormat: _dateFormat,
                    importService: _importService,
                    repository: _repository,
                    archivedView: false,
                    onOpen: _handleChatTap,
                    onChanged: _loadArchives,
                    onRename: _renameArchive,
                    selectionMode: _selectionMode,
                    selectedIds: _selectedIds,
                    onToggleSelected: _toggleSelected,
                    lockedIds: _lockedIds,
                    disabledIds: _disabledIds,
                    onDisabledTap: () => _showMessage(_l10n.upgradeToAccessChat),
                    onRemoveLock: _removeLock,
                  ),
                  _ArchiveList(
                    archives: archived,
                    emptyMessage:
                        _hasActiveFilters && noVisibleChats
                            ? emptySearchMessage
                            : _l10n.noArchivedChats,
                    dateFormat: _dateFormat,
                    importService: _importService,
                    repository: _repository,
                    archivedView: true,
                    onOpen: _handleChatTap,
                    onChanged: _loadArchives,
                    onRename: _renameArchive,
                    selectionMode: _selectionMode,
                    selectedIds: _selectedIds,
                    onToggleSelected: _toggleSelected,
                    lockedIds: _lockedIds,
                    disabledIds: _disabledIds,
                    onDisabledTap: () => _showMessage(_l10n.upgradeToAccessChat),
                    onRemoveLock: _removeLock,
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildEmptyImportState() {
    final bool isIos = Platform.isIOS;
    final String topLabel = isIos ? 'Import on iOS' : 'Import on Android';
    final IconData topIcon = isIos ? Icons.phone_iphone : Icons.android;
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double availableHeight = constraints.maxHeight;
          final double spacing = 12;
          final double topHeight = _emptyTopExpanded
              ? availableHeight * 0.78
              : availableHeight * 0.5;
          final double bottomHeight =
              math.max(0, availableHeight - topHeight - spacing);
          return Column(
            children: <Widget>[
              SizedBox(
                height: topHeight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: _EmptyImportCard(
                    title: topLabel,
                    icon: topIcon,
                    expanded: _emptyTopExpanded,
                    bodyWidget:
                        _emptyTopExpanded ? _buildPlatformImportText() : null,
                    onTap: _toggleEmptyTopExpanded,
                  ),
                ),
              ),
              SizedBox(height: spacing),
              SizedBox(
                height: bottomHeight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: _EmptyImportCard(
                    title: 'Import from ZIP',
                    icon: Icons.archive,
                    onTap: _importWithPrompt,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _toggleEmptyTopExpanded() {
    setState(() {
      _emptyTopExpanded = !_emptyTopExpanded;
    });
  }

  Widget _buildPlatformImportText() {
    final AppLocalizations l10n = _l10n;
    final bool isIos = Platform.isIOS;
    final List<_EmptyStep> steps = isIos
        ? <_EmptyStep>[
            _EmptyStep(text: l10n.iosStepOpenChat),
            _EmptyStep(text: l10n.iosStepOpenInfo),
            _EmptyStep(text: l10n.iosStepExportChat),
            _EmptyStep(text: l10n.iosStepChooseMedia),
            _EmptyStep(text: l10n.iosStepShareToApp),
          ]
        : <_EmptyStep>[
            _EmptyStep(text: l10n.androidStepOpenChat),
            _EmptyStep(text: l10n.androidStepOpenMenu, icon: Icons.more_vert),
            _EmptyStep(text: l10n.androidStepMoreExport),
            _EmptyStep(text: l10n.androidStepChooseMedia),
            _EmptyStep(text: l10n.androidStepShareToApp),
            _EmptyStep(text: l10n.androidStepSaveToDevice),
            _EmptyStep(text: l10n.androidLargeImportNote),
          ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (int i = 0; i < steps.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${i + 1}. '),
                Expanded(child: Text(steps[i].text)),
                if (steps[i].icon != null) ...<Widget>[
                  const SizedBox(width: 6),
                  Icon(steps[i].icon, size: 18),
                ],
              ],
            ),
          ),
      ],
    );
  }

  Future<void> _importWithPrompt() async {
    final bool proceed = await _showImportLocationBanner();
    if (!proceed || !mounted) {
      return;
    }
    await _import();
  }

  Future<bool> _showImportLocationBanner() async {
    if (_importLocationBannerShown || !mounted) {
      return false;
    }
    _importLocationBannerShown = true;
    _importLocationCountdown.value = 7;
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    _importLocationCompleter = Completer<bool>();
    messenger.showMaterialBanner(
      MaterialBanner(
        content: Row(
          children: <Widget>[
            const Expanded(
              child: Text('Choose the location of your stored WhatsApp chats.'),
            ),
            const SizedBox(width: 12),
            ValueListenableBuilder<int>(
              valueListenable: _importLocationCountdown,
              builder: (_, int value, __) {
                return Text(
                  value.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w700),
                );
              },
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              messenger.hideCurrentMaterialBanner();
              _importLocationBannerShown = false;
              _importLocationTimer?.cancel();
              _importLocationTimer = null;
              _importLocationCompleter?.complete(true);
              _importLocationCompleter = null;
            },
            child: const Text('Dismiss'),
          ),
        ],
      ),
    );

    _importLocationTimer?.cancel();
    _importLocationTimer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      _importLocationCountdown.value = _importLocationCountdown.value - 1;
      if (_importLocationCountdown.value <= 0) {
        messenger.hideCurrentMaterialBanner();
        _importLocationBannerShown = false;
        t.cancel();
        _importLocationTimer = null;
        _importLocationCompleter?.complete(true);
        _importLocationCompleter = null;
        return;
      }
    });
    return _importLocationCompleter!.future;
  }

  Widget _buildSearchBar(Color background) {
    return Container(
      color: background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    if (_searchExpanded || _hasActiveFilters) {
                      _clearSearchAndFilters();
                      return;
                    }
                    setState(() {
                      _searchExpanded = true;
                    });
                  },
                  icon: Icon(
                    (_searchExpanded || _hasActiveFilters)
                        ? Icons.close
                        : Icons.search,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: TabBar(
                    labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    labelColor: Colors.white,
                    unselectedLabelColor: const Color(0xFFE0F2F1),
                    tabs: <Widget>[
                      Tab(text: _l10n.tabChats),
                      Tab(text: _l10n.tabArchived),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_searchExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      autofocus: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: _l10n.searchChatsHint,
                        hintStyle: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.filter_list, color: Colors.white),
                          onPressed: _openFilterDialog,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _openChat(ChatArchive archive) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChatScreen(
          archive: archive,
          importService: _importService,
          mediaImportService: _mediaImportService,
          initialSearchQuery: _searchQuery.isEmpty ? null : _searchQuery,
        ),
      ),
    );
    await _loadArchives();
  }

  Future<void> _handleChatTap(ChatArchive archive) async {
    if (_disabledIds.contains(archive.id)) {
      _showMessage(_l10n.upgradeToAccessChat);
      return;
    }
    if (_lockedIds.contains(archive.id)) {
      await _promptUnlock(archive);
      return;
    }
    await _openChat(archive);
  }

  Future<void> _promptHideCode() async {
    if (_selectionMode) {
      _cancelSelection();
      return;
    }
    await _loadHideMode();
    if (!context.mounted) {
      return;
    }
    final String? code = await _showPasscodeDialog(
      context: context,
      title: _l10n.enterCodeTitle,
      hintText: _l10n.upTo8DigitsHint,
      submitLabel: _l10n.continueAction,
    );
    if (code == null) {
      return;
    }
    final Map<String, List<String>> hidden =
        await _repository.loadHiddenMap();
    final Map<String, List<String>> locked =
        await _repository.loadLockedMap();
    if (hidden.containsKey(code)) {
      await _runWithBlockingDialog(
        message: _l10n.updatingHiddenChats,
        action: () async {
          await _repository.clearHiddenForCode(code);
          await _loadArchives();
        },
      );
      if (context.mounted) {
        _showMessage(_l10n.chatsUnhidden);
      }
      return;
    }
    if (locked.containsKey(code)) {
      await _runWithBlockingDialog(
        message: _l10n.updatingHiddenChats,
        action: () async {
          await _repository.clearLockedForCode(code);
          await _loadArchives();
        },
      );
      if (context.mounted) {
        _showMessage(_l10n.chatsUnlocked);
      }
      return;
    }
    if (_hideMode) {
      setState(() {
        _selectionMode = true;
        _selectionModeType = _SelectionModeType.hide;
        _pendingCode = code;
        _selectedIds.clear();
      });
      return;
    }

    setState(() {
      _selectionMode = true;
      _selectionModeType = _SelectionModeType.lock;
      _pendingCode = code;
      _selectedIds.clear();
    });
  }

  void _toggleSelected(String id) {
    if (_disabledIds.contains(id)) {
      _showMessage(_l10n.upgradeToAccessChat);
      return;
    }
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

  void _cancelSelection() {
    setState(() {
      _selectionMode = false;
      _pendingCode = null;
      _selectedIds.clear();
    });
  }

  Future<void> _submitHiddenSelection() async {
    if (_pendingCode == null) {
      _cancelSelection();
      return;
    }
    if (_selectedIds.isEmpty) {
      _showMessage(_l10n.selectAtLeastOneChat);
      return;
    }
    await _runWithBlockingDialog(
      message: _selectionModeType == _SelectionModeType.hide
          ? _l10n.hidingChats
          : _l10n.lockingChats,
      action: () async {
        if (_selectionModeType == _SelectionModeType.hide) {
          await _repository.setHiddenForCode(_pendingCode!, _selectedIds);
        } else {
          await _repository.setLockedForCode(_pendingCode!, _selectedIds);
        }
        await _loadArchives();
      },
    );
    if (!context.mounted) {
      return;
    }
    setState(() {
      _selectionMode = false;
      _pendingCode = null;
      _selectedIds.clear();
    });
    _showMessage(
      _selectionModeType == _SelectionModeType.hide
          ? _l10n.chatsHidden
          : _l10n.chatsLocked,
    );
  }

  Future<void> _promptUnlock(ChatArchive archive) async {
    final String? code = await _showPasscodeDialog(
      context: context,
      title: _l10n.unlockChatTitle,
      hintText: _l10n.enterPasscodeHint,
      submitLabel: _l10n.unlockAction,
    );
    if (code == null) {
      return;
    }
    final bool unlocked = await _repository.unlockChat(code, archive.id);
    if (!unlocked) {
      _showMessage(_l10n.incorrectCode);
      return;
    }
    await _openChat(archive);
  }

  Future<void> _removeLock(ChatArchive archive, AppLocalizations l10n) async {
    final String? code = await _showPasscodeDialog(
      context: context,
      title: 'Remove lock',
      hintText: _l10n.enterPasscodeHint,
      submitLabel: 'Remove lock',
    );
    if (code == null) {
      return;
    }
    final bool removed = await _repository.removeLockedChatForCode(code, archive.id);
    if (!removed) {
      _showMessage(_l10n.incorrectCode);
      return;
    }
    await _loadArchives();
    if (context.mounted) {
      _showMessage('Lock removed.');
    }
  }
}

class _EmptyImportCard extends StatelessWidget {
  const _EmptyImportCard({
    required this.title,
    required this.icon,
    required this.onTap,
    this.expanded = false,
    this.bodyWidget,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool expanded;
  final Widget? bodyWidget;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Material(
      color: const Color(0xFFF6F7F8),
      borderRadius: BorderRadius.circular(18),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(icon, size: 36, color: theme.colorScheme.primary),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (expanded && bodyWidget != null) ...<Widget>[
                const SizedBox(height: 16),
                bodyWidget!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyStep {
  const _EmptyStep({required this.text, this.icon});

  final String text;
  final IconData? icon;
}

class _ArchiveList extends StatefulWidget {
  const _ArchiveList({
    required this.archives,
    required this.emptyMessage,
    required this.dateFormat,
    required this.importService,
    required this.repository,
    required this.archivedView,
    required this.onOpen,
    required this.onChanged,
    required this.onRename,
    required this.selectionMode,
    required this.selectedIds,
    required this.onToggleSelected,
    required this.lockedIds,
    required this.disabledIds,
    required this.onDisabledTap,
    required this.onRemoveLock,
  });

  final List<ChatArchive> archives;
  final String emptyMessage;
  final DateFormat dateFormat;
  final ChatImportService importService;
  final ChatRepository repository;
  final bool archivedView;
  final Future<void> Function(ChatArchive archive) onOpen;
  final Future<void> Function() onChanged;
  final Future<void> Function(ChatArchive archive) onRename;
  final bool selectionMode;
  final Set<String> selectedIds;
  final void Function(String id) onToggleSelected;
  final Set<String> lockedIds;
  final Set<String> disabledIds;
  final VoidCallback onDisabledTap;
  final Future<void> Function(ChatArchive archive, AppLocalizations l10n) onRemoveLock;

  @override
  State<_ArchiveList> createState() => _ArchiveListState();
}

class _ArchiveListState extends State<_ArchiveList> {
  final Map<String, int> _sizeCache = <String, int>{};
  final Set<String> _sizeLoading = <String>{};
  late List<ChatArchive> _items;
  bool _suppressSync = false;

  @override
  void initState() {
    super.initState();
    _items = List<ChatArchive>.from(widget.archives);
  }

  @override
  void didUpdateWidget(covariant _ArchiveList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_suppressSync && oldWidget.archives != widget.archives) {
      _items = List<ChatArchive>.from(widget.archives);
    }
  }

  Future<void> _ensureSizeForArchive(ChatArchive archive) async {
    if (_sizeCache.containsKey(archive.id) || _sizeLoading.contains(archive.id)) {
      return;
    }
    _sizeLoading.add(archive.id);
    try {
      final int size = await calculateDirectorySize(Directory(archive.folderPath));
      if (!mounted) {
        return;
      }
      setState(() {
        _sizeCache[archive.id] = size;
      });
    } finally {
      _sizeLoading.remove(archive.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final SettingsController settings = SettingsScope.of(context);
    final bool showSizes = settings.showChatSizes;
    if (_items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            widget.emptyMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }

    return ListView.separated(
      itemCount: _items.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (BuildContext context, int index) {
        final ChatArchive archive = _items[index];
        if (showSizes) {
          _ensureSizeForArchive(archive);
        }
        final bool isDisabled = widget.disabledIds.contains(archive.id);
        if (widget.selectionMode) {
          final bool selected = widget.selectedIds.contains(archive.id);
          final Widget tile = ListTile(
            leading: Checkbox(
              value: selected,
              onChanged: isDisabled ? null : (_) => widget.onToggleSelected(archive.id),
              shape: const CircleBorder(),
            ),
            title: Text(
              archive.displayName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: showSizes
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(l10n.importedOn(
                          widget.dateFormat.format(archive.createdAt))),
                      Text(
                        _sizeCache.containsKey(archive.id)
                            ? formatBytes(_sizeCache[archive.id]!)
                            : l10n.storageCalculating,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                : Text(
                    l10n.importedOn(widget.dateFormat.format(archive.createdAt)),
                  ),
            trailing: isDisabled ? const Icon(Icons.lock_outline) : null,
            onTap: isDisabled
                ? widget.onDisabledTap
                : () => widget.onToggleSelected(archive.id),
          );
          return Opacity(
            opacity: isDisabled ? 0.4 : 1.0,
            child: tile,
          );
        }
        final bool isLocked = widget.lockedIds.contains(archive.id);
        return Slidable(
          key: ValueKey<String>(archive.id),
          enabled: !isDisabled && !isLocked,
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.5,
            children: <Widget>[
              SlidableAction(
                onPressed: (_) => _lockArchive(archive, l10n),
                backgroundColor: const Color(0xFF2E7D32),
                foregroundColor: Colors.white,
                icon: Icons.lock,
                label: l10n.lockAction,
              ),
              SlidableAction(
                onPressed: (_) => _hideArchive(archive, l10n),
                backgroundColor: const Color(0xFF1565C0),
                foregroundColor: Colors.white,
                icon: Icons.visibility_off,
                label: l10n.hideAction,
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.5,
            children: <Widget>[
              SlidableAction(
                onPressed: (_) => _toggleArchive(archive, l10n),
                backgroundColor: const Color(0xFF757575),
                foregroundColor: Colors.white,
                icon: widget.archivedView ? Icons.unarchive : Icons.archive,
                label: widget.archivedView
                    ? l10n.unarchiveAction
                    : l10n.archiveAction,
              ),
              SlidableAction(
                onPressed: (_) async {
                  final bool? confirmed = await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(l10n.deleteChatTitle),
                        content: Text(l10n.deleteChatConfirm),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text(l10n.cancelAction),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: Text(l10n.deleteAction),
                          ),
                        ],
                      );
                    },
                  );
                  if (confirmed == true) {
                    await _deleteArchive(archive, l10n);
                  }
                },
                backgroundColor: const Color(0xFFC62828),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: l10n.deleteAction,
              ),
            ],
          ),
          child: Opacity(
            opacity: isDisabled ? 0.4 : (isLocked ? 0.75 : 1.0),
            child: ListTile(
              leading: isLocked
                ? SizedBox(
                    width: 40,
                    height: 40,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundColor: Color(0xFF128C7E),
                          foregroundColor: Colors.white,
                          child: Icon(Icons.chat_bubble),
                        ),
                        Positioned(
                          right: -2,
                          bottom: -2,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.lock,
                              size: 14,
                              color: Color(0xFF455A64),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const CircleAvatar(
                    backgroundColor: Color(0xFF128C7E),
                    foregroundColor: Colors.white,
                    child: Icon(Icons.chat_bubble),
                  ),
            title: Text(
              archive.displayName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: showSizes
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(l10n.importedOn(
                          widget.dateFormat.format(archive.createdAt))),
                      Text(
                        _sizeCache.containsKey(archive.id)
                            ? formatBytes(_sizeCache[archive.id]!)
                            : l10n.storageCalculating,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                : Text(
                    l10n.importedOn(widget.dateFormat.format(archive.createdAt)),
                  ),
              trailing: isDisabled
                  ? const Icon(Icons.lock_outline)
                  : PopupMenuButton<String>(
                      onSelected: (String value) async {
                        if (value == 'remove_lock') {
                          await widget.onRemoveLock(archive, l10n);
                          return;
                        }
                        if (value == 'rename') {
                          widget.onRename(archive);
                          return;
                        }
                        if (value == 'delete') {
                          final bool? confirmed = await showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(l10n.deleteChatTitle),
                                content: Text(l10n.deleteChatConfirm),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: Text(l10n.cancelAction),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: Text(l10n.deleteAction),
                                  ),
                                ],
                              );
                            },
                          );
                          if (confirmed == true) {
                            await _deleteArchive(archive, l10n);
                          }
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[
                          if (isLocked)
                            const PopupMenuItem<String>(
                              value: 'remove_lock',
                              child: Text('Remove lock'),
                            ),
                          PopupMenuItem<String>(
                            value: 'rename',
                            child: Text(l10n.renameAction),
                          ),
                          PopupMenuItem<String>(
                            value: 'delete',
                            child: Text(l10n.deleteAction),
                          ),
                        ];
                      },
                      icon: const Icon(Icons.more_vert),
                    ),
              onTap: isDisabled ? widget.onDisabledTap : () => widget.onOpen(archive),
            ),
          ),
        );
      },
    );
  }


  Future<String?> _promptPasscode(AppLocalizations l10n) async {
    return _showPasscodeDialog(
      context: context,
      title: l10n.enterCodeTitle,
      hintText: l10n.upTo8DigitsHint,
      submitLabel: l10n.continueAction,
    );
  }

  Future<void> _lockArchive(ChatArchive archive, AppLocalizations l10n) async {
    final String? code = await _promptPasscode(l10n);
    if (code == null) {
      return;
    }
    _suppressSync = true;
    try {
      final Map<String, List<String>> locked =
          await widget.repository.loadLockedMap();
      final Set<String> ids =
          (locked[code] ?? <String>[]).toSet()..add(archive.id);
      await widget.repository.setLockedForCode(code, ids);
      await widget.onChanged();
      if (context.mounted) {
        _showSnack(l10n.chatsLocked);
      }
    } catch (e) {
      if (context.mounted) {
        _showSnack(l10n.updateFailedWithDetail(e.toString()));
      }
    } finally {
      _suppressSync = false;
    }
  }


  Future<void> _hideArchive(ChatArchive archive, AppLocalizations l10n) async {
    final String? code = await _promptPasscode(l10n);
    if (code == null) {
      return;
    }
    _suppressSync = true;
    try {
      final Map<String, List<String>> hidden =
          await widget.repository.loadHiddenMap();
      final Set<String> ids =
          (hidden[code] ?? <String>[]).toSet()..add(archive.id);
      await widget.repository.setHiddenForCode(code, ids);
      await widget.onChanged();
      if (context.mounted) {
        _showSnack(l10n.chatsHidden);
      }
    } catch (e) {
      if (context.mounted) {
        _showSnack(l10n.updateFailedWithDetail(e.toString()));
      }
    } finally {
      _suppressSync = false;
    }
  }

  Future<void> _toggleArchive(
    ChatArchive archive,
    AppLocalizations l10n,
  ) async {
    _suppressSync = true;
    try {
      final ChatArchive updated = ChatArchive(
        id: archive.id,
        name: archive.name,
        sourceName: archive.sourceName,
        folderPath: archive.folderPath,
        chatFilePath: archive.chatFilePath,
        createdAt: archive.createdAt,
        isArchived: !archive.isArchived,
        additionalChatFiles: archive.additionalChatFiles,
      );
      final bool saved = await widget.repository.updateArchive(updated);
      if (!saved && mounted) {
        _showSnack(l10n.archiveFolderMissing);
      }
      await widget.onChanged();
    } catch (e) {
      if (context.mounted) {
        _showSnack(l10n.updateFailedWithDetail(e.toString()));
      }
    } finally {
      _suppressSync = false;
      if (context.mounted) {
        setState(() {
          _items = List<ChatArchive>.from(widget.archives);
        });
      }
    }
  }

  Future<void> _deleteArchive(ChatArchive archive, AppLocalizations l10n) async {
    if (!context.mounted) {
      return;
    }
    _suppressSync = true;
    setState(() {
      _items.removeWhere((ChatArchive item) => item.id == archive.id);
    });
    try {
      final bool deleted = await widget.repository.deleteArchive(archive);
      if (!deleted && mounted) {
        _showSnack(l10n.archiveFolderMissing);
      }
      await widget.onChanged();
    } catch (e) {
      if (context.mounted) {
        _showSnack(l10n.updateFailedWithDetail(e.toString()));
      }
    } finally {
      _suppressSync = false;
      if (context.mounted) {
        setState(() {
          _items = List<ChatArchive>.from(widget.archives);
        });
      }
    }
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
