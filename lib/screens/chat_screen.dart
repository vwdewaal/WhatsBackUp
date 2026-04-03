import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:intl/intl.dart';
import '../l10n/app_localizations.dart';
import 'package:just_audio/just_audio.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as p;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import '../models/chat_models.dart';
import '../services/chat_import_service.dart';
import '../services/chat_message_store.dart';
import '../services/media_import_service.dart';
import '../settings_controller.dart';
import '../models/media_import_job.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.archive,
    required this.importService,
    required this.mediaImportService,
    this.initialSearchQuery,
  });

  final ChatArchive archive;
  final ChatImportService importService;
  final MediaImportService mediaImportService;
  final String? initialSearchQuery;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  AppLocalizations get _l10n => AppLocalizations.of(context)!;
  final DateFormat _timeFormat = DateFormat.jm();
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  final Map<String, String> _attachmentPathCache = <String, String>{};
  final Set<String> _attachmentLookup = <String>{};
  StreamSubscription<MediaImportJob>? _mediaJobSub;
  MediaImportJob? _mediaJob;
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();
  Timer? _scrollSaveTimer;
  ParsedChat? _chat;
  List<_ChatListEntry> _entries = <_ChatListEntry>[];
  List<ChatMessage> _allMessages = <ChatMessage>[];
  List<ChatMessage> _messages = <ChatMessage>[];
  List<int> _messageToEntry = <int>[];
  List<int> _matchMessageIndices = <int>[];
  ChatMessageStore? _store;
  bool _dbMode = false;
  int _dbVisibleCount = 0;
  List<int>? _dbFilteredIds;
  Map<int, int>? _dbIdToFilteredIndex;
  List<int> _dbMatchIds = <int>[];
  List<String> _dbSenders = <String>[];
  final Map<int, List<ChatMessage?>> _pageCache =
      <int, List<ChatMessage?>>{};
  final Map<int, List<int>> _dbPageIds = <int, List<int>>{};
  final Set<int> _pageLoading = <int>{};
  Set<String> _bookmarkKeys = <String>{};
  Set<int> _dbBookmarkIds = <int>{};
  List<int> _bookmarkIndices = <int>[];
  int _currentBookmarkIndex = 0;
  static const int _pageSize = 200;
  bool _dbBuilding = false;
  double? _dbBuildProgress;
  String? _mySender;
  bool _mySenderPromptShown = false;
  Object? _error;
  int? _restoredIndex;
  int _currentMatchIndex = 0;
  String? _activeSearchQuery;
  int? _highlightedIndex;
  Timer? _highlightTimer;
  bool _buildingInBackground = false;
  int _builtMessageCount = 0;
  DateTime? _lastEntryDate;
  bool _autoScrollToBottom = false;
  DateTimeRange? _filterDateRange;
  Set<String> _filterSenders = <String>{};
  bool _filterIncludeMedia = true;
  bool _filterMediaOnly = false;
  bool _isScrubbing = false;
  double _scrubberFraction = 1;
  String? _scrubLabel;

  @override
  void initState() {
    super.initState();
    _activeSearchQuery = widget.initialSearchQuery?.trim();
    _itemPositionsListener.itemPositions.addListener(_handlePositionsChanged);
    _loadMediaJob();
    _mediaJobSub = widget.mediaImportService.jobUpdates
        .listen((MediaImportJob job) {
      if (job.archiveId != widget.archive.id) {
        return;
      }
      if (!mounted) {
        return;
      }
      setState(() {
        _mediaJob = job;
      });
    });
    _load();
  }

  @override
  void dispose() {
    _scrollSaveTimer?.cancel();
    _highlightTimer?.cancel();
    _itemPositionsListener.itemPositions.removeListener(_handlePositionsChanged);
    _mediaJobSub?.cancel();
    _store?.close();
    super.dispose();
  }

  Future<void> _loadMediaJob() async {
    await widget.mediaImportService.loadJobs();
    if (!mounted) {
      return;
    }
    setState(() {
      _mediaJob =
          widget.mediaImportService.activeJobForArchive(widget.archive.id);
    });
  }

  String? _attachmentNameFromText(String text) {
    final String cleaned = text.trim();
    final RegExp tagged = RegExp(r'<attached: (.+?)>');
    final RegExpMatch? taggedMatch = tagged.firstMatch(cleaned);
    if (taggedMatch != null) {
      return taggedMatch.group(1)?.trim();
    }
    final RegExp oldStyle = RegExp(r'^(.+?) \\(file attached\\)$');
    final RegExpMatch? oldStyleMatch = oldStyle.firstMatch(cleaned);
    if (oldStyleMatch != null) {
      return oldStyleMatch.group(1)?.trim();
    }
    return null;
  }

  void _resolveAttachmentPath(String attachmentName) {
    if (_attachmentPathCache.containsKey(attachmentName) ||
        _attachmentLookup.contains(attachmentName)) {
      return;
    }
    _attachmentLookup.add(attachmentName);
    widget.importService
        .resolveAttachmentPath(
      archive: widget.archive,
      attachmentName: attachmentName,
    )
        .then((String? path) {
      if (!mounted) {
        return;
      }
      if (path != null) {
        setState(() {
          _attachmentPathCache[attachmentName] = path;
        });
      }
    }).whenComplete(() {
      _attachmentLookup.remove(attachmentName);
    });
  }

  Widget _buildMediaImportBanner() {
    final MediaImportJob? job = _mediaJob;
    if (job == null) {
      return const SizedBox.shrink();
    }
    if (job.status == MediaImportService.statusDone) {
      return const SizedBox.shrink();
    }
    final bool paused = job.status == MediaImportService.statusPaused;
    final bool failed = job.status == MediaImportService.statusFailed;
    final double? progress =
        job.total > 0 ? (job.processed / job.total).clamp(0.0, 1.0) : null;

    String title = _l10n.mediaImportingTitle;
    String subtitle = _l10n.mediaImportingSubtitle;
    if (paused) {
      title = _l10n.mediaImportPausedTitle;
      subtitle = _l10n.mediaImportPausedSubtitle;
    } else if (failed) {
      title = _l10n.mediaImportFailedTitle;
      subtitle = _l10n.mediaImportFailedSubtitle;
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          const Icon(Icons.downloading, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF667781)),
                ),
                if (!paused && !failed) ...<Widget>[
                  const SizedBox(height: 8),
                  LinearProgressIndicator(value: progress),
                ],
              ],
            ),
          ),
          if (paused || failed)
            TextButton(
              onPressed: () async {
                final MediaImportJob? current = _mediaJob;
                if (current == null) {
                  return;
                }
                final bool resumed =
                    await widget.mediaImportService.resumeJobWithPicker(current);
                if (resumed) {
                  await _loadMediaJob();
                }
              },
              child: Text(_l10n.mediaImportResumeAction),
            ),
        ],
      ),
    );
  }

  Future<void> _load() async {
    try {
      await _loadBookmarks();
      final bool useStore =
          await widget.importService.shouldUseMessageStore(widget.archive);
      if (useStore) {
        await _ensureStoreBuilt();
        final ChatMessageStore store =
            await ChatMessageStore.openForArchive(widget.archive);
        final SettingsController settings = SettingsScope.of(context);
        String? selectedSender = await store.fetchTopSender();
        final List<String> senders = await store.fetchSenders();
        final String? preferredSender = settings.mySenderName;
        if (preferredSender != null && senders.contains(preferredSender)) {
          selectedSender = preferredSender;
        }
        final int totalCount = await store.countMessages();
        if (!mounted) {
          await store.close();
          return;
        }
        final int? savedIndex = await _loadSavedIndex();
        if (!mounted) {
          await store.close();
          return;
        }

        setState(() {
          _dbMode = true;
          _store = store;
          _dbVisibleCount = totalCount;
          _dbFilteredIds = null;
          _dbIdToFilteredIndex = null;
          _dbMatchIds = <int>[];
          _currentMatchIndex = 0;
          _restoredIndex = savedIndex;
          _mySender = selectedSender;
          _dbSenders = senders;
          _entries = <_ChatListEntry>[];
          _allMessages = <ChatMessage>[];
          _messages = <ChatMessage>[];
          _messageToEntry = <int>[];
          _matchMessageIndices = <int>[];
          _builtMessageCount = 0;
          _lastEntryDate = null;
          _autoScrollToBottom = savedIndex == null;
        });
        await _reloadDbFilters(scrollToTop: savedIndex == null);
        await _rebuildBookmarkIndices();
        await _maybePromptForMySender(senders);
        return;
      }

      final ParsedChat parsed =
          await widget.importService.parseArchiveAsync(widget.archive);

      final SettingsController settings = SettingsScope.of(context);
      String? selectedSender = _chooseDefaultSender(parsed.messages);
      final String? preferredSender = settings.mySenderName;
      if (preferredSender != null && parsed.senders.contains(preferredSender)) {
        selectedSender = preferredSender;
      }
      if (!mounted) {
        return;
      }

      final int? savedIndex = await _loadSavedIndex();
      if (!mounted) {
        return;
      }

      setState(() {
        _chat = parsed;
        _entries = <_ChatListEntry>[];
        _allMessages = parsed.messages;
        _messages = _applyMessageFilters(parsed.messages);
        _messageToEntry = List<int>.filled(_messages.length, -1);
        _mySender = selectedSender;
        _matchMessageIndices = _findMatchMessageIndices(
          _messages,
          _activeSearchQuery,
        );
        _currentMatchIndex = 0;
        _restoredIndex = savedIndex;
        _builtMessageCount = 0;
        _lastEntryDate = null;
        _autoScrollToBottom =
            _matchMessageIndices.isEmpty && _restoredIndex == null;
      });

      await _buildUntilInitialTarget();
      await _rebuildBookmarkIndices();
      await _maybePromptForMySender(parsed.senders);
      _startBackgroundBuild();
    } catch (e) {
      if (!mounted) {
        return;
      }
      setState(() {
        _error = e;
      });
    }
  }

  String? _chooseDefaultSender(List<ChatMessage> messages) {
    final Map<String, int> counts = <String, int>{};

    for (final ChatMessage message in messages) {
      if (message.sender == 'System') {
        continue;
      }
      counts[message.sender] = (counts[message.sender] ?? 0) + 1;
    }

    if (counts.isEmpty) {
      return null;
    }

    final List<MapEntry<String, int>> sorted = counts.entries.toList()
      ..sort((MapEntry<String, int> a, MapEntry<String, int> b) {
        final int countCompare = b.value.compareTo(a.value);
        if (countCompare != 0) {
          return countCompare;
        }
        return a.key.compareTo(b.key);
      });

    return sorted.first.key;
  }

  Future<void> _maybePromptForMySender(List<String> senders) async {
    if (_mySenderPromptShown || !mounted) {
      return;
    }
    final SettingsController settings = SettingsScope.of(context);
    if (settings.mySenderName != null || settings.mySenderPrompted) {
      return;
    }
    if (senders.isEmpty) {
      return;
    }
    _mySenderPromptShown = true;
    await settings.setMySenderPrompted(true);
    if (!mounted) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) {
        return;
      }
      final List<String> options = List<String>.from(senders)..sort();
      final String? selected = await showModalBottomSheet<String>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          final AppLocalizations l10n = AppLocalizations.of(context)!;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    l10n.identifyMeTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l10n.identifyMeSubtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Flexible(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: options.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (BuildContext context, int index) {
                        final String sender = options[index];
                        return ListTile(
                          title: Text(sender),
                          onTap: () => Navigator.of(context).pop(sender),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(l10n.identifyMeNotNow),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
      if (selected == null || !mounted) {
        return;
      }
      await settings.setMySenderName(selected);
      if (!mounted) {
        return;
      }
      setState(() {
        _mySender = selected;
      });
    });
  }

  List<int> _findMatchMessageIndices(
    List<ChatMessage> messages,
    String? query,
  ) {
    if (query == null || query.isEmpty) {
      return <int>[];
    }
    final String lowered = query.toLowerCase();
    final List<int> matches = <int>[];
    for (int i = 0; i < messages.length; i++) {
      final ChatMessage message = messages[i];
      if (message.text.toLowerCase().contains(lowered)) {
        matches.add(i);
      }
    }
    return matches;
  }

  bool get _hasActiveFilters {
    return _filterDateRange != null ||
        _filterSenders.isNotEmpty ||
        !_filterIncludeMedia ||
        _filterMediaOnly;
  }

  bool _isMediaMessage(ChatMessage message) {
    if (message.type == ChatMessageType.system) {
      return false;
    }
    return message.type != ChatMessageType.text;
  }

  List<ChatMessage> _applyMessageFilters(List<ChatMessage> input) {
    if (!_hasActiveFilters) {
      return input;
    }
    final DateTimeRange? range = _filterDateRange;
    final Set<String> senders = _filterSenders;
    return input.where((ChatMessage message) {
      if (range != null) {
        final DateTime? ts = message.timestamp;
        if (ts == null ||
            ts.isBefore(range.start) ||
            ts.isAfter(range.end)) {
          return false;
        }
      }
      if (senders.isNotEmpty && !senders.contains(message.sender)) {
        return false;
      }
      final bool isMedia = _isMediaMessage(message);
      if (_filterMediaOnly) {
        return isMedia;
      }
      if (!_filterIncludeMedia && isMedia) {
        return false;
      }
      return true;
    }).toList();
  }

  ChatMessageFilter _currentDbFilter() {
    return ChatMessageFilter(
      dateRange: _filterDateRange,
      senders: _filterSenders,
      includeMedia: _filterIncludeMedia,
      mediaOnly: _filterMediaOnly,
    );
  }

  Future<void> _ensureStoreBuilt() async {
    if (_dbBuilding) {
      return;
    }
    final File storeFile = File(p.join(widget.archive.folderPath, 'chat.db'));
    if (storeFile.existsSync()) {
      final ChatMessageStore store =
          await ChatMessageStore.openForArchive(widget.archive);
      final bool built = await store.isBuilt();
      await store.close();
      if (built) {
        return;
      }
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _dbBuilding = true;
      _dbBuildProgress = 0;
    });

    if (mounted) {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: Text(_l10n.importFinalizing),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              LinearProgressIndicator(value: _dbBuildProgress),
              const SizedBox(height: 12),
              Text(_l10n.importFinalizing),
            ],
          ),
        ),
      );
    }

    try {
      await widget.importService.buildMessageStore(
        archive: widget.archive,
        onProgress: (double progress) {
          if (!mounted) {
            return;
          }
          setState(() {
            _dbBuildProgress = progress;
          });
        },
      );
    } finally {
      if (mounted) {
        Navigator.of(context, rootNavigator: true).pop();
        setState(() {
          _dbBuilding = false;
          _dbBuildProgress = null;
        });
      }
    }
  }

  Future<void> _reloadDbFilters({bool scrollToTop = true}) async {
    final ChatMessageStore? store = _store;
    if (store == null) {
      return;
    }
    final ChatMessageFilter filter = _currentDbFilter();
    List<int>? filteredIds;
    Map<int, int>? idToIndex;
    int visibleCount = 0;

    if (_hasActiveFilters) {
      filteredIds = await store.fetchMessageIds(filter: filter);
      idToIndex = <int, int>{};
      for (int i = 0; i < filteredIds.length; i++) {
        idToIndex[filteredIds[i]] = i;
      }
      visibleCount = filteredIds.length;
    } else {
      visibleCount = await store.countMessages();
    }

    List<int> matchIds = <int>[];
    if (_activeSearchQuery != null && _activeSearchQuery!.isNotEmpty) {
      matchIds = await store.fetchMessageIds(
        filter: filter,
        searchQuery: _activeSearchQuery,
      );
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _dbFilteredIds = filteredIds;
      _dbIdToFilteredIndex = idToIndex;
      _dbVisibleCount = visibleCount;
      _dbMatchIds = matchIds;
      _currentMatchIndex = 0;
      _pageCache.clear();
      _dbPageIds.clear();
      _pageLoading.clear();
      _autoScrollToBottom = !scrollToTop && matchIds.isEmpty;
    });

    if (!_itemScrollController.isAttached) {
      return;
    }
    if (_dbMatchIds.isNotEmpty) {
      final int index = await _resolveDbIndexForId(_dbMatchIds.first);
      await _scrollToDbIndex(index);
      _highlightedIndex = index;
      _highlightTimer?.cancel();
      _highlightTimer = Timer(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _highlightedIndex = null;
          });
        }
      });
      return;
    }
    if (scrollToTop) {
      await _scrollToDbIndex(0);
    } else if (_autoScrollToBottom && _dbVisibleCount > 0) {
      await _scrollToDbIndex(_dbVisibleCount - 1);
    }
  }

  Future<int> _resolveDbIndexForId(int id) async {
    final Map<int, int>? indexMap = _dbIdToFilteredIndex;
    if (indexMap != null) {
      return indexMap[id] ?? 0;
    }
    final ChatMessageStore? store = _store;
    if (store == null) {
      return 0;
    }
    return store.positionForId(
      id,
      filter: _hasActiveFilters ? _currentDbFilter() : null,
    );
  }

  Future<void> _scrollToDbIndex(int index) async {
    if (!_itemScrollController.isAttached) {
      return;
    }
    final int clamped = index.clamp(0, max(0, _dbVisibleCount - 1));
    await _itemScrollController.scrollTo(
      index: clamped,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  void _loadDbPage(int pageIndex) {
    if (_pageLoading.contains(pageIndex)) {
      return;
    }
    _pageLoading.add(pageIndex);
    Future<void>(() async {
      final ChatMessageStore? store = _store;
      if (store == null) {
        return;
      }
      final int start = pageIndex * _pageSize;
      if (start >= _dbVisibleCount) {
        return;
      }
      final int end = min(start + _pageSize, _dbVisibleCount);
      List<ChatMessage?> page = <ChatMessage?>[];
      if (_dbFilteredIds != null) {
        final List<int> ids = _dbFilteredIds!.sublist(start, end);
        final List<ChatMessage> messages = await store.fetchByIds(ids);
        page = List<ChatMessage?>.filled(ids.length, null);
        for (int i = 0; i < messages.length && i < page.length; i++) {
          page[i] = messages[i];
        }
        _dbPageIds[pageIndex] = ids;
      } else {
        final List<DbMessage> messages = await store.fetchRangeWithIds(
          offset: start,
          limit: end - start,
        );
        page = messages.map((DbMessage msg) => msg.message).toList();
        _dbPageIds[pageIndex] =
            messages.map((DbMessage msg) => msg.id).toList();
      }

      if (!mounted) {
        return;
      }
      setState(() {
        _pageCache[pageIndex] = page;
      });
    }).whenComplete(() {
      _pageLoading.remove(pageIndex);
    });
  }

  ChatMessage? _dbMessageAt(int index) {
    if (index < 0 || index >= _dbVisibleCount) {
      return null;
    }
    final int pageIndex = index ~/ _pageSize;
    final int offset = index % _pageSize;
    final List<ChatMessage?>? page = _pageCache[pageIndex];
    if (page == null || offset >= page.length) {
      _loadDbPage(pageIndex);
      return null;
    }
    return page[offset];
  }

  Future<void> _applyFiltersAndRebuild({
    bool scrollToTop = true,
  }) async {
    if (_dbMode) {
      await _reloadDbFilters(scrollToTop: scrollToTop);
      return;
    }
    setState(() {
      _entries = <_ChatListEntry>[];
      _messages = _applyMessageFilters(_allMessages);
      _messageToEntry = List<int>.filled(_messages.length, -1);
      _matchMessageIndices = _findMatchMessageIndices(
        _messages,
        _activeSearchQuery,
      );
      _currentMatchIndex = 0;
      _restoredIndex = scrollToTop ? null : _restoredIndex;
      _builtMessageCount = 0;
      _lastEntryDate = null;
      _autoScrollToBottom = !scrollToTop && _matchMessageIndices.isEmpty;
    });
    await _buildUntilInitialTarget();
    _startBackgroundBuild();
    if (scrollToTop &&
        mounted &&
        _itemScrollController.isAttached &&
        _entries.isNotEmpty) {
      _itemScrollController.jumpTo(index: 0);
    }
  }

  Future<void> _clearFilters() async {
    setState(() {
      _filterDateRange = null;
      _filterSenders.clear();
      _filterIncludeMedia = true;
      _filterMediaOnly = false;
    });
    await _applyFiltersAndRebuild();
  }

  Future<void> _openFilterDialog() async {
    final ParsedChat? chat = _chat;
    final List<String> senders =
        _dbMode ? _dbSenders : (chat?.senders ?? <String>[]);
    if (!_dbMode && chat == null) {
      return;
    }
    DateTimeRange? tempRange = _filterDateRange;
    Set<String> tempSenders = Set<String>.from(_filterSenders);
    bool tempIncludeMedia = _filterIncludeMedia;
    bool tempMediaOnly = _filterMediaOnly;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setModal) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(_l10n.filterTitle),
                      trailing: IconButton(
                        tooltip: _l10n.clearFilters,
                        icon: const Icon(Icons.refresh),
                        onPressed: () {
                          setModal(() {
                            tempRange = null;
                            tempSenders.clear();
                            tempIncludeMedia = true;
                            tempMediaOnly = false;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.date_range),
                      title: Text(_l10n.filterDateRange),
                      subtitle: Text(
                        tempRange == null
                            ? _l10n.filterAnyDate
                            : '${_dateFormat.format(tempRange!.start)} - ${_dateFormat.format(tempRange!.end)}',
                      ),
                      onTap: () async {
                        final DateTime now = DateTime.now();
                        final DateTimeRange? picked = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(now.year - 20),
                          lastDate: DateTime(now.year + 1),
                          initialDateRange: tempRange,
                        );
                        if (!context.mounted) {
                          return;
                        }
                        if (picked != null) {
                          setModal(() {
                            tempRange = picked;
                          });
                        }
                      },
                    ),
                    SwitchListTile(
                      title: Text(_l10n.filterIncludeMedia),
                      value: tempIncludeMedia,
                      onChanged: tempMediaOnly
                          ? null
                          : (bool value) {
                              setModal(() {
                                tempIncludeMedia = value;
                              });
                            },
                    ),
                    SwitchListTile(
                      title: Text(_l10n.filterMediaOnly),
                      value: tempMediaOnly,
                      onChanged: (bool value) {
                        setModal(() {
                          tempMediaOnly = value;
                          if (value) {
                            tempIncludeMedia = true;
                          }
                        });
                      },
                    ),
                    if (senders.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _l10n.filterSenders,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                    if (senders.isNotEmpty)
                      SizedBox(
                        height: 220,
                        child: ListView(
                          children: senders.map((String sender) {
                            final bool selected = tempSenders.contains(sender);
                            return CheckboxListTile(
                              title: Text(sender),
                              value: selected,
                              onChanged: (bool? value) {
                                setModal(() {
                                  if (value == true) {
                                    tempSenders.add(sender);
                                  } else {
                                    tempSenders.remove(sender);
                                  }
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(_l10n.cancelAction),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                _filterDateRange = tempRange;
                                _filterSenders = tempSenders;
                                _filterIncludeMedia = tempIncludeMedia;
                                _filterMediaOnly = tempMediaOnly;
                              });
                              await _applyFiltersAndRebuild();
                              if (!context.mounted) {
                                return;
                              }
                              Navigator.of(context).pop();
                            },
                            child: Text(_l10n.applyFilters),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<int?> _loadSavedIndex() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_scrollIndexKey());
  }

  Future<void> _saveIndex(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_scrollIndexKey(), index);
  }

  String _scrollIndexKey() => 'chat_scroll_index_${widget.archive.id}';

  String _bookmarkKeysPrefsKey() =>
      'chat_bookmarks_keys_${widget.archive.id}';

  String _bookmarkIdsPrefsKey() =>
      'chat_bookmarks_ids_${widget.archive.id}';

  String _messageBookmarkKey(ChatMessage message) {
    final int ts = message.timestamp?.millisecondsSinceEpoch ?? 0;
    final String attachment = message.attachmentPath ?? '';
    return '${ts}|${message.sender}|${message.type.index}|${attachment}|${message.text}';
  }

  Future<void> _loadBookmarks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> keys =
        prefs.getStringList(_bookmarkKeysPrefsKey()) ?? <String>[];
    final List<String> ids =
        prefs.getStringList(_bookmarkIdsPrefsKey()) ?? <String>[];
    _bookmarkKeys = keys.toSet();
    _dbBookmarkIds = ids
        .map((String value) => int.tryParse(value))
        .whereType<int>()
        .toSet();
  }

  Future<void> _saveBookmarks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _bookmarkKeysPrefsKey(),
      _bookmarkKeys.toList(growable: false),
    );
    await prefs.setStringList(
      _bookmarkIdsPrefsKey(),
      _dbBookmarkIds
          .map((int id) => id.toString())
          .toList(growable: false),
    );
  }

  int? _dbIdForIndex(int index) {
    final List<int>? filteredIds = _dbFilteredIds;
    if (filteredIds != null) {
      if (index < 0 || index >= filteredIds.length) {
        return null;
      }
      return filteredIds[index];
    }
    final int pageIndex = index ~/ _pageSize;
    final int offset = index % _pageSize;
    final List<int>? ids = _dbPageIds[pageIndex];
    if (ids == null || offset >= ids.length) {
      return null;
    }
    return ids[offset];
  }

  Future<void> _rebuildBookmarkIndices() async {
    if (_dbMode) {
      if (_dbBookmarkIds.isEmpty) {
        if (!mounted) return;
        setState(() {
          _bookmarkIndices = <int>[];
          _currentBookmarkIndex = 0;
        });
        return;
      }
      final List<int> indices = <int>[];
      if (_dbFilteredIds != null) {
        for (int i = 0; i < _dbFilteredIds!.length; i++) {
          if (_dbBookmarkIds.contains(_dbFilteredIds![i])) {
            indices.add(i);
          }
        }
      } else {
        final ChatMessageStore? store = _store;
        if (store != null) {
          for (final int id in _dbBookmarkIds) {
            final int idx = await store.positionForId(id,
                filter: _hasActiveFilters ? _currentDbFilter() : null);
            indices.add(idx);
          }
        }
      }
      indices.sort();
      if (!mounted) return;
      setState(() {
        _bookmarkIndices = indices;
        if (_currentBookmarkIndex >= indices.length) {
          _currentBookmarkIndex = indices.isEmpty ? 0 : indices.length - 1;
        }
      });
      return;
    }
    if (_messages.isEmpty) {
      if (!mounted) return;
      setState(() {
        _bookmarkIndices = <int>[];
        _currentBookmarkIndex = 0;
      });
      return;
    }
    final List<int> indices = <int>[];
    for (int i = 0; i < _messages.length; i++) {
      final String key = _messageBookmarkKey(_messages[i]);
      if (_bookmarkKeys.contains(key)) {
        indices.add(i);
      }
    }
    if (!mounted) return;
    setState(() {
      _bookmarkIndices = indices;
      if (_currentBookmarkIndex >= indices.length) {
        _currentBookmarkIndex = indices.isEmpty ? 0 : indices.length - 1;
      }
    });
  }

  Future<void> _toggleBookmarkForMessage(int messageIndex, ChatMessage message) async {
    final String key = _messageBookmarkKey(message);
    if (_bookmarkKeys.contains(key)) {
      _bookmarkKeys.remove(key);
    } else {
      _bookmarkKeys.add(key);
    }
    await _saveBookmarks();
    await _rebuildBookmarkIndices();
  }

  Future<void> _toggleBookmarkForDbId(int id) async {
    if (_dbBookmarkIds.contains(id)) {
      _dbBookmarkIds.remove(id);
    } else {
      _dbBookmarkIds.add(id);
    }
    await _saveBookmarks();
    await _rebuildBookmarkIndices();
  }

  Future<void> _jumpToBookmark(int delta) async {
    if (_bookmarkIndices.isEmpty || !_itemScrollController.isAttached) {
      return;
    }
    _autoScrollToBottom = false;
    setState(() {
      _currentBookmarkIndex =
          (_currentBookmarkIndex + delta) % _bookmarkIndices.length;
      if (_currentBookmarkIndex < 0) {
        _currentBookmarkIndex += _bookmarkIndices.length;
      }
    });
    final int targetIndex = _bookmarkIndices[_currentBookmarkIndex];
    if (_dbMode) {
      await _scrollToDbIndex(targetIndex);
      setState(() {
        _highlightedIndex = targetIndex;
      });
      _highlightTimer?.cancel();
      _highlightTimer = Timer(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _highlightedIndex = null;
          });
        }
      });
      return;
    }
    await _buildUntilMessageIndex(targetIndex);
    if (!mounted || !_itemScrollController.isAttached) {
      return;
    }
    final int entryIndex = _messageToEntry[targetIndex];
    if (entryIndex < 0) {
      return;
    }
    _setHighlightedIndex(entryIndex);
    _itemScrollController.scrollTo(
      index: entryIndex,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _buildUntilInitialTarget() async {
    if (_dbMode) {
      return;
    }
    if (_matchMessageIndices.isNotEmpty) {
      await _buildUntilMessageIndex(_matchMessageIndices.first);
      if (_itemScrollController.isAttached) {
        await _jumpToMatchByMessageIndex(_matchMessageIndices.first);
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _jumpToMatchByMessageIndex(_matchMessageIndices.first);
        });
      }
      return;
    }
    if (_restoredIndex != null) {
      await _buildUntilEntryIndex(_restoredIndex!);
      if (!mounted) {
        return;
      }
      if (_itemScrollController.isAttached) {
        _itemScrollController.jumpTo(index: _restoredIndex!);
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted || !_itemScrollController.isAttached) {
            return;
          }
          _itemScrollController.jumpTo(index: _restoredIndex!);
        });
      }
      return;
    }
    if (_entries.isEmpty && _messages.isNotEmpty) {
      _appendNextChunk();
    }
  }

  Future<void> _buildUntilMessageIndex(int messageIndex) async {
    while (mounted &&
        _builtMessageCount <= messageIndex &&
        _builtMessageCount < _messages.length) {
      _appendNextChunk();
      await Future<void>.delayed(const Duration(milliseconds: 1));
    }
  }

  Future<void> _buildUntilEntryIndex(int entryIndex) async {
    while (mounted &&
        _entries.length <= entryIndex &&
        _builtMessageCount < _messages.length) {
      _appendNextChunk();
      await Future<void>.delayed(const Duration(milliseconds: 1));
    }
  }

  void _appendNextChunk() {
    const int chunkSize = 200;
    final int start = _builtMessageCount;
    if (start >= _messages.length) {
      return;
    }
    final int end = min(start + chunkSize, _messages.length);
    for (int i = start; i < end; i++) {
      final ChatMessage message = _messages[i];
      final DateTime? timestamp = message.timestamp;
      if (timestamp != null) {
        final DateTime dateKey =
            DateTime(timestamp.year, timestamp.month, timestamp.day);
        if (_lastEntryDate == null || _lastEntryDate != dateKey) {
          _entries.add(_ChatListEntry.date(dateKey));
          _lastEntryDate = dateKey;
        }
      }
      _entries.add(_ChatListEntry.message(message, i));
      _messageToEntry[i] = _entries.length - 1;
    }
    _builtMessageCount = end;
    if (mounted) {
      setState(() {});
    }
  }

  void _startBackgroundBuild() {
    if (_buildingInBackground) {
      return;
    }
    _buildingInBackground = true;
    _buildRemainingInBackground();
  }

  Future<void> _buildRemainingInBackground() async {
    while (mounted && _builtMessageCount < _messages.length) {
      _appendNextChunk();
      await Future<void>.delayed(const Duration(milliseconds: 8));
    }
    _buildingInBackground = false;
    if (!mounted || !_autoScrollToBottom || !_itemScrollController.isAttached) {
      return;
    }
    if (_entries.isNotEmpty) {
      _itemScrollController.jumpTo(index: _entries.length - 1);
    }
  }

  void _handlePositionsChanged() {
    if (_dbMode) {
      if (_dbVisibleCount == 0) {
        return;
      }
    } else if (_entries.isEmpty) {
      return;
    }
    final Iterable<ItemPosition> positions =
        _itemPositionsListener.itemPositions.value;
    if (positions.isEmpty) {
      return;
    }
    final Iterable<ItemPosition> visible =
        positions.where((ItemPosition pos) => pos.itemLeadingEdge >= 0);
    final Iterable<ItemPosition> source =
        visible.isEmpty ? positions : visible;
    final int minIndex = source
        .map((ItemPosition pos) => pos.index)
        .fold<int>(source.first.index, (int prev, int curr) {
      return curr < prev ? curr : prev;
    });
    if (!_isScrubbing) {
      setState(() {
        final int maxIndex = _dbMode ? _dbVisibleCount - 1 : _entries.length - 1;
        _scrubberFraction = minIndex / max(1, maxIndex);
      });
    }
    _scrollSaveTimer?.cancel();
    _scrollSaveTimer = Timer(const Duration(milliseconds: 300), () {
      _saveIndex(minIndex);
    });
  }

  Future<void> _jumpToMatch(int delta) async {
    _autoScrollToBottom = false;
    if (_dbMode) {
      if (_dbMatchIds.isEmpty || !_itemScrollController.isAttached) {
        return;
      }
      setState(() {
        _currentMatchIndex =
            (_currentMatchIndex + delta) % _dbMatchIds.length;
        if (_currentMatchIndex < 0) {
          _currentMatchIndex += _dbMatchIds.length;
        }
      });
      final int index = await _resolveDbIndexForId(
        _dbMatchIds[_currentMatchIndex],
      );
      await _scrollToDbIndex(index);
      setState(() {
        _highlightedIndex = index;
      });
      _highlightTimer?.cancel();
      _highlightTimer = Timer(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _highlightedIndex = null;
          });
        }
      });
      return;
    }
    if (_matchMessageIndices.isEmpty || !_itemScrollController.isAttached) {
      return;
    }
    setState(() {
      _currentMatchIndex =
          (_currentMatchIndex + delta) % _matchMessageIndices.length;
      if (_currentMatchIndex < 0) {
        _currentMatchIndex += _matchMessageIndices.length;
      }
    });
    await _jumpToMatchByMessageIndex(_matchMessageIndices[_currentMatchIndex]);
  }

  Future<void> _jumpToMatchByMessageIndex(int messageIndex) async {
    if (_dbMode) {
      return;
    }
    _autoScrollToBottom = false;
    await _buildUntilMessageIndex(messageIndex);
    if (!mounted || !_itemScrollController.isAttached) {
      return;
    }
    final int entryIndex = _messageToEntry[messageIndex];
    if (entryIndex < 0) {
      return;
    }
    _setHighlightedIndex(entryIndex);
    _itemScrollController.scrollTo(
      index: entryIndex,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  void _setHighlightedIndex(int index) {
    _highlightTimer?.cancel();
    setState(() {
      _highlightedIndex = index;
    });
    _highlightTimer = Timer(const Duration(seconds: 2), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _highlightedIndex = null;
      });
    });
  }

  String _labelForEntryIndex(int index) {
    if (_dbMode) {
      final ChatMessage? message = _dbMessageAt(index);
      final DateTime? ts = message?.timestamp;
      return ts == null ? '' : _dateFormat.format(ts);
    }
    if (index < 0 || index >= _entries.length) {
      return '';
    }
    final _ChatListEntry entry = _entries[index];
    if (entry.isDate) {
      return _dateFormat.format(entry.date!);
    }
    final DateTime? ts = entry.message?.timestamp;
    if (ts == null) {
      return '';
    }
    return _dateFormat.format(ts);
  }

  void _scrubToFraction(double fraction) {
    _autoScrollToBottom = false;
    if (_dbMode) {
      if (_dbVisibleCount == 0 || !_itemScrollController.isAttached) {
        return;
      }
      final double clamped = fraction.clamp(0.0, 1.0);
      final int targetIndex =
          (clamped * max(0, _dbVisibleCount - 1)).round();
      _itemScrollController.jumpTo(index: targetIndex);
      setState(() {
        _scrubberFraction = clamped;
        _scrubLabel = _labelForEntryIndex(targetIndex);
      });
      return;
    }
    if (_entries.isEmpty || !_itemScrollController.isAttached) {
      return;
    }
    final double clamped = fraction.clamp(0.0, 1.0);
    final int targetIndex =
        (clamped * max(0, _entries.length - 1)).round();
    _itemScrollController.jumpTo(index: targetIndex);
    setState(() {
      _scrubberFraction = clamped;
      _scrubLabel = _labelForEntryIndex(targetIndex);
    });
  }

  Widget _buildDbEntry(int index) {
    final ChatMessage? message = _dbMessageAt(index);
    if (message == null) {
      return const SizedBox(height: 28);
    }
    final ChatMessage? previous =
        index > 0 ? _dbMessageAt(index - 1) : null;
    final DateTime? ts = message.timestamp;
    bool showDate = false;
    if (ts != null) {
      final DateTime dateKey = DateTime(ts.year, ts.month, ts.day);
      final DateTime? prevTs = previous?.timestamp;
      if (prevTs == null) {
        showDate = true;
      } else {
        final DateTime prevKey =
            DateTime(prevTs.year, prevTs.month, prevTs.day);
        showDate = prevKey != dateKey;
      }
    }

    final bool isMe = _mySender != null && message.sender == _mySender;
    final bool isHighlighted =
        _highlightedIndex != null && _highlightedIndex == index;

    final int? dbId = _dbIdForIndex(index);
    final bool bookmarked = dbId != null && _dbBookmarkIds.contains(dbId);
    final String? attachmentName = _attachmentNameFromText(message.text);
    final String? cachedPath = attachmentName == null
        ? null
        : _attachmentPathCache[attachmentName];
    if (attachmentName != null && cachedPath == null) {
      _resolveAttachmentPath(attachmentName);
    }
    final Widget bubble = _MessageBubble(
      message: message,
      isMe: isMe,
      timeFormat: _timeFormat,
      highlight: isHighlighted,
      highlightQuery: isHighlighted ? _activeSearchQuery : null,
      bookmarked: bookmarked,
      attachmentName: attachmentName,
      resolvedAttachmentPath: message.attachmentPath ?? cachedPath,
      onLongPress: dbId == null ? null : () => _toggleBookmarkForDbId(dbId),
      onBookmarkTap: dbId == null ? null : () => _toggleBookmarkForDbId(dbId),
    );

    if (!showDate || ts == null) {
      return bubble;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _DateSeparator(label: _dateFormat.format(ts)),
        bubble,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final ParsedChat? chat = _chat;
    final List<String> senders =
        _dbMode ? _dbSenders : (chat?.senders ?? <String>[]);
    final bool isReady = _dbMode ? _store != null : chat != null;
    final Object? error = _error;
    final String? errorMessage = error == null
        ? null
        : (error is FileSystemException &&
                error.message == ChatImportService.errorChatFileNotFound)
            ? l10n.chatFileNotFound
            : error.toString();
    final SettingsController settings = SettingsScope.of(context);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 140,
        leading: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).maybePop(),
            ),
            IconButton(
              tooltip: l10n.filterTitle,
              icon: const Icon(Icons.filter_list),
              onPressed: _openFilterDialog,
            ),
            if (_hasActiveFilters)
              IconButton(
                tooltip: l10n.clearFilters,
                icon: const Icon(Icons.clear),
                onPressed: _clearFilters,
              ),
          ],
        ),
        title: Text(widget.archive.displayName),
        backgroundColor: settings.primaryColor,
        foregroundColor: Colors.white,
        actions: <Widget>[
          if ((_dbMode ? _dbMatchIds.length : _matchMessageIndices.length) > 0)
            Row(
              children: <Widget>[
                Text(
                  '${_currentMatchIndex + 1}/${_dbMode ? _dbMatchIds.length : _matchMessageIndices.length}',
                  style: const TextStyle(fontSize: 12),
                ),
                IconButton(
                  tooltip: l10n.previousMatch,
                  icon: const Icon(Icons.keyboard_arrow_up),
                  onPressed: () => _jumpToMatch(-1),
                ),
                IconButton(
                  tooltip: l10n.nextMatch,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  onPressed: () => _jumpToMatch(1),
                ),
              ],
            ),
          if (senders.isNotEmpty)
            PopupMenuButton<String>(
              tooltip: l10n.selectSenderOnRight,
              icon: const Icon(Icons.swap_horiz),
              onSelected: (String sender) {
                setState(() {
                  _mySender = sender;
                });
                settings.setMySenderName(sender);
              },
            itemBuilder: (_) {
                return senders
                    .map(
                      (String sender) => PopupMenuItem<String>(
                        value: sender,
                        child: Text(
                          _mySender == sender
                              ? l10n.senderMeLabel(sender)
                              : sender,
                        ),
                      ),
                    )
                    .toList();
              },
            ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFE5DDD5),
        ),
        child: _error != null
            ? Center(
                child: Text(
                  l10n.couldNotOpenArchive(errorMessage ?? l10n.unknownError),
                  textAlign: TextAlign.center,
                ),
              )
            : !isReady
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: <Widget>[
                      _buildMediaImportBanner(),
                      if (_bookmarkIndices.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                color: Color(0x22000000),
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              const Icon(Icons.bookmark, size: 18),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  _l10n.bookmarksLabel,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                '${_currentBookmarkIndex + 1}/${_bookmarkIndices.length}',
                                style: const TextStyle(fontSize: 12),
                              ),
                              IconButton(
                                tooltip: _l10n.previousBookmark,
                                icon: const Icon(Icons.keyboard_arrow_up),
                                onPressed: () => _jumpToBookmark(-1),
                              ),
                              IconButton(
                                tooltip: _l10n.nextBookmark,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                onPressed: () => _jumpToBookmark(1),
                              ),
                            ],
                          ),
                        ),
                      Expanded(
                        child: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) {
                            final double listHeight = constraints.maxHeight;
                            final EdgeInsets safe = MediaQuery.of(context).padding;
                            final double knobSize = 44;
                            final double trackTop = 8 + safe.top;
                            final double trackBottom = 8 + safe.bottom;
                            final double available =
                                max(1, listHeight - knobSize - trackTop - trackBottom);
                            final double knobTop = trackTop + available * _scrubberFraction;
                            return Stack(
                              children: <Widget>[
                                ScrollablePositionedList.builder(
                                  itemScrollController: _itemScrollController,
                                  itemPositionsListener: _itemPositionsListener,
                                  padding: EdgeInsets.fromLTRB(10, 12, 10, 12 + safe.bottom),
                                  itemCount:
                                      _dbMode ? _dbVisibleCount : _entries.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    if (_dbMode) {
                                      return _buildDbEntry(index);
                                    }
                                    final _ChatListEntry entry = _entries[index];
                                    if (entry.isDate) {
                                      return _DateSeparator(
                                        label: _dateFormat.format(entry.date!),
                                      );
                                    }
                                    final ChatMessage message = entry.message!;
                                    final bool isMe =
                                        _mySender != null && message.sender == _mySender;
                                    final bool isHighlighted =
                                        _highlightedIndex != null &&
                                            _highlightedIndex == index;
                                    final int? messageIndex = entry.messageIndex;
                                    final bool bookmarked = messageIndex != null &&
                                        _bookmarkKeys.contains(
                                          _messageBookmarkKey(message),
                                        );
                                    final String? attachmentName =
                                        _attachmentNameFromText(message.text);
                                    final String? cachedPath = attachmentName == null
                                        ? null
                                        : _attachmentPathCache[attachmentName];
                                    if (attachmentName != null && cachedPath == null) {
                                      _resolveAttachmentPath(attachmentName);
                                    }
                                    return _MessageBubble(
                                      message: message,
                                      isMe: isMe,
                                      timeFormat: _timeFormat,
                                      highlight: isHighlighted,
                                      highlightQuery:
                                          isHighlighted ? _activeSearchQuery : null,
                                      bookmarked: bookmarked,
                                      attachmentName: attachmentName,
                                      resolvedAttachmentPath:
                                          message.attachmentPath ?? cachedPath,
                                      onLongPress: messageIndex == null
                                          ? null
                                          : () => _toggleBookmarkForMessage(
                                                messageIndex,
                                                message,
                                              ),
                                      onBookmarkTap: messageIndex == null
                                          ? null
                                          : () => _toggleBookmarkForMessage(
                                                messageIndex,
                                                message,
                                              ),
                                    );
                                  },
                                ),
                                Positioned(
                                  right: 8,
                                  top: knobTop,
                                  child: GestureDetector(
                                    onPanStart: (_) {
                                      setState(() {
                                        _isScrubbing = true;
                                      });
                                      _scrubToFraction(_scrubberFraction);
                                    },
                                    onPanUpdate: (DragUpdateDetails details) {
                                      final double currentDy =
                                          _scrubberFraction * available;
                                      final double nextDy =
                                          (currentDy + details.delta.dy)
                                              .clamp(0, available);
                                      _scrubToFraction(nextDy / available);
                                    },
                                    onPanEnd: (_) {
                                      setState(() {
                                        _isScrubbing = false;
                                      });
                                    },
                                    child: Container(
                                      width: knobSize,
                                      height: knobSize,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: const <BoxShadow>[
                                          BoxShadow(
                                            color: Color(0x33000000),
                                            blurRadius: 6,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.unfold_more,
                                        color: Color(0xFF1F2A32),
                                      ),
                                    ),
                                  ),
                                ),
                                if (_isScrubbing && _scrubLabel != null)
                                  Positioned(
                                    right: 60,
                                    top: knobTop - 4,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1F2A32),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Text(
                                        _scrubLabel!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
      ),
    );

  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({
    required this.message,
    required this.isMe,
    required this.timeFormat,
    required this.highlight,
    required this.highlightQuery,
    required this.bookmarked,
    required this.attachmentName,
    required this.resolvedAttachmentPath,
    this.onLongPress,
    this.onBookmarkTap,
  });

  final ChatMessage message;
  final bool isMe;
  final DateFormat timeFormat;
  final bool highlight;
  final String? highlightQuery;
  final bool bookmarked;
  final String? attachmentName;
  final String? resolvedAttachmentPath;
  final VoidCallback? onLongPress;
  final VoidCallback? onBookmarkTap;

  String _visibleText(String input) {
    String value = input;
    value = value.replaceAll(RegExp(r'<attached: .*?>'), '').trim();
    value = value.replaceAll(RegExp(r'\s*\(file attached\)\s*'), '').trim();
    return value;
  }

  TextSpan _buildHighlightedText(
    String text,
    TextStyle baseStyle,
    String? query,
  ) {
    if (query == null || query.isEmpty) {
      return TextSpan(text: text, style: baseStyle);
    }
    final String loweredText = text.toLowerCase();
    final String loweredQuery = query.toLowerCase();
    final List<TextSpan> spans = <TextSpan>[];
    int start = 0;
    while (true) {
      final int index = loweredText.indexOf(loweredQuery, start);
      if (index == -1) {
        if (start < text.length) {
          spans.add(TextSpan(text: text.substring(start), style: baseStyle));
        }
        break;
      }
      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index), style: baseStyle));
      }
      spans.add(
        TextSpan(
          text: text.substring(index, index + loweredQuery.length),
          style: baseStyle.copyWith(
            backgroundColor: const Color(0xFFFFF3A6),
            fontWeight: FontWeight.w700,
          ),
        ),
      );
      start = index + loweredQuery.length;
    }
    return TextSpan(children: spans);
  }

  List<TextSpan> _buildLinkifiedText(
    String text,
    TextStyle baseStyle,
    String? query,
  ) {
    final RegExp linkExp = RegExp(r'(https?:\/\/[^\s]+|www\.[^\s]+)');
    final Iterable<RegExpMatch> matches = linkExp.allMatches(text);
    if (matches.isEmpty) {
      return <TextSpan>[_buildHighlightedText(text, baseStyle, query)];
    }

    final List<TextSpan> spans = <TextSpan>[];
    int cursor = 0;
    for (final RegExpMatch match in matches) {
      if (match.start > cursor) {
        spans.add(
          _buildHighlightedText(
            text.substring(cursor, match.start),
            baseStyle,
            query,
          ),
        );
      }
      final String raw = match.group(0) ?? '';
      if (raw.isNotEmpty) {
        final String url = raw.startsWith('http') ? raw : 'https://$raw';
        spans.add(
          TextSpan(
            text: raw,
            style: baseStyle.copyWith(
              color: const Color(0xFF1A73E8),
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                final Uri uri = Uri.parse(url);
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              },
          ),
        );
      }
      cursor = match.end;
    }
    if (cursor < text.length) {
      spans.add(
        _buildHighlightedText(
          text.substring(cursor),
          baseStyle,
          query,
        ),
      );
    }
    return spans;
  }

  @override
  Widget build(BuildContext context) {
    final SettingsController settings = SettingsScope.of(context);
    final Color accent = settings.primaryColor;
    final bool highContrast = settings.highContrast;
    final Color outgoingBubbleColor = Color.alphaBlend(
      accent.withValues(alpha: highContrast ? 0.34 : 0.22),
      Colors.white,
    );
    final Color systemBubbleColor = Color.alphaBlend(
      accent.withValues(alpha: highContrast ? 0.18 : 0.12),
      Colors.white,
    );
    final bool system = message.type == ChatMessageType.system;
    final String visibleText = _visibleText(message.text);
    final TextStyle themeBody =
        Theme.of(context).textTheme.bodyMedium ??
            DefaultTextStyle.of(context).style;
    final TextStyle baseTextStyle = themeBody.copyWith(
      color: const Color(0xFF111B21),
    );
    final double maxBubbleWidth =
        min(340, MediaQuery.of(context).size.width * 0.78);

    Widget bubble;
    if (system) {
      bubble = Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: systemBubbleColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            message.text,
            style: const TextStyle(fontSize: 12, color: Color(0xFF54656F)),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      bubble = Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: AnimatedScale(
          scale: highlight ? 1.02 : 1,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
            constraints: BoxConstraints(maxWidth: maxBubbleWidth),
            duration: const Duration(milliseconds: 180),
            decoration: BoxDecoration(
              color: isMe ? outgoingBubbleColor : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: highlight
                  ? Border.all(color: const Color(0xFFFFB400), width: 1.4)
                  : null,
              boxShadow: <BoxShadow>[
                if (highlight)
                  const BoxShadow(
                    color: Color(0x33FFB400),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  )
                else
                  const BoxShadow(
                    color: Color(0x22000000),
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (!isMe)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      message.sender,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF667781),
                      ),
                    ),
                  ),
                if (resolvedAttachmentPath != null || attachmentName != null)
                  resolvedAttachmentPath != null
                      ? _AttachmentContent(
                          path: resolvedAttachmentPath!,
                          type: message.type,
                        )
                      : _AttachmentPlaceholder(name: attachmentName),
                if (visibleText.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: RichText(
                      textScaler: MediaQuery.textScalerOf(context),
                      text: TextSpan(
                        children: _buildLinkifiedText(
                          visibleText,
                          baseTextStyle,
                          highlight ? highlightQuery : null,
                        ),
                      ),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      message.timestamp == null
                          ? ''
                          : timeFormat.format(message.timestamp!),
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF667781),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (bookmarked) {
      bubble = Stack(
        children: <Widget>[
          bubble,
          Positioned(
            right: 6,
            top: 6,
            child: GestureDetector(
              onTap: onBookmarkTap,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.bookmark,
                  size: 14,
                  color: Color(0xFF1F2A32),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return GestureDetector(
      onLongPress: onLongPress,
      child: bubble,
    );
  }
}

class _AttachmentContent extends StatelessWidget {
  const _AttachmentContent({
    required this.path,
    required this.type,
  });

  final String path;
  final ChatMessageType type;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final File file = File(path);
    if (!file.existsSync()) {
      return _FileMissing(path: path);
    }

    final String ext = p.extension(path).toLowerCase();
    if (ext == '.vcf' || ext == '.vcard') {
      return _VcardAttachment(path: path);
    }

    if (type == ChatMessageType.image) {
      return _ImageAttachment(path: path);
    }

    if (type == ChatMessageType.video) {
      return _VideoAttachment(path: path);
    }

    if (type == ChatMessageType.audio) {
      return _AudioAttachment(path: path);
    }

    if (p.extension(path).toLowerCase() == '.pdf') {
      return _OpenableAttachment(
        icon: Icons.picture_as_pdf,
        label: p.basename(path),
        action: l10n.openPdf,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => _PdfViewerScreen(path: path),
            ),
          );
        },
      );
    }

    return _OpenableAttachment(
      icon: Icons.insert_drive_file,
      label: p.basename(path),
      action: l10n.openFile,
      onTap: () async {
        final OpenResult result = await OpenFilex.open(path);
        if (context.mounted && result.type != ResultType.done) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                l10n.couldNotOpenFile(
                  result.message.isEmpty ? l10n.unknownError : result.message,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class _AttachmentPlaceholder extends StatelessWidget {
  const _AttachmentPlaceholder({required this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final String label = name == null || name!.isEmpty
        ? l10n.mediaImportingLabel
        : '${l10n.mediaImportingLabel} · ${p.basename(name!)}';
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4F7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x22000000)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(Icons.hourglass_top, size: 18, color: Color(0xFF54656F)),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 12, color: Color(0xFF54656F)),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _VcardAttachment extends StatelessWidget {
  const _VcardAttachment({required this.path});

  final String path;

  Future<Map<String, List<String>>> _parseVcard(String input) async {
    final List<String> lines = input.split(RegExp(r'\r?\n'));
    final List<String> unfolded = <String>[];
    for (final String line in lines) {
      if (line.startsWith(' ') || line.startsWith('\t')) {
        if (unfolded.isNotEmpty) {
          unfolded[unfolded.length - 1] += line.trimLeft();
        }
      } else {
        unfolded.add(line.trim());
      }
    }

    String? name;
    final List<String> phones = <String>[];
    final List<String> emails = <String>[];
    final List<String> orgs = <String>[];

    for (final String raw in unfolded) {
      if (raw.isEmpty || !raw.contains(':')) {
        continue;
      }
      final int idx = raw.indexOf(':');
      final String key = raw.substring(0, idx).toUpperCase();
      final String value = raw.substring(idx + 1).trim();
      if (key == 'FN') {
        name = value;
      } else if (key.startsWith('N') && (name == null || name!.isEmpty)) {
        name = value.replaceAll(';', ' ').trim();
      } else if (key.startsWith('TEL')) {
        phones.add(value);
      } else if (key.startsWith('EMAIL')) {
        emails.add(value);
      } else if (key.startsWith('ORG')) {
        orgs.add(value);
      }
    }

    return <String, List<String>>{
      'name': <String>[name ?? ''],
      'phones': phones,
      'emails': emails,
      'orgs': orgs,
    };
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return FutureBuilder<String>(
      future: File(path).readAsString(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F4F7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0x22000000)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(Icons.person, size: 18, color: Color(0xFF54656F)),
                const SizedBox(width: 8),
                Text(
                  l10n.contactLoadingLabel,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF54656F)),
                ),
              ],
            ),
          );
        }
        return FutureBuilder<Map<String, List<String>>>(
          future: _parseVcard(snapshot.data ?? ''),
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, List<String>>> parsed) {
            final Map<String, List<String>> data =
                parsed.data ?? <String, List<String>>{};
            final String name = (data['name']?.first ?? '').trim();
            final List<String> phones = data['phones'] ?? <String>[];
            final List<String> emails = data['emails'] ?? <String>[];
            final List<String> orgs = data['orgs'] ?? <String>[];

            return Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F4F7),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0x22000000)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.person, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          name.isEmpty ? l10n.contactUnknownName : name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (orgs.isNotEmpty) ...<Widget>[
                    const SizedBox(height: 6),
                    Text(
                      orgs.first,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF54656F),
                      ),
                    ),
                  ],
                  if (phones.isNotEmpty) ...<Widget>[
                    const SizedBox(height: 8),
                    Text(
                      '${l10n.contactPhoneLabel}: ${phones.first}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                  if (emails.isNotEmpty) ...<Widget>[
                    const SizedBox(height: 6),
                    Text(
                      '${l10n.contactEmailLabel}: ${emails.first}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () async {
                        final OpenResult result = await OpenFilex.open(
                          path,
                          type: 'text/x-vcard',
                          uti: 'public.vcard',
                        );
                        if (result.type != ResultType.done && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                l10n.contactOpenFailed(result.message),
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(l10n.openContactAction),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _AudioAttachment extends StatefulWidget {
  const _AudioAttachment({required this.path});

  final String path;

  @override
  State<_AudioAttachment> createState() => _AudioAttachmentState();
}

class _AudioAttachmentState extends State<_AudioAttachment> {
  final AudioPlayer _player = AudioPlayer();
  Duration? _duration;
  bool _ready = false;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    try {
      await _player.setFilePath(widget.path);
      _duration = _player.duration;
      if (!mounted) {
        return;
      }
      setState(() {
        _ready = true;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _failed = true;
      });
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    if (_failed) {
      return _OpenableAttachment(
        icon: Icons.audiotrack,
        label: p.basename(widget.path),
        action: l10n.openAudio,
        onTap: () async {
          final OpenResult result = await OpenFilex.open(widget.path);
          if (context.mounted && result.type != ResultType.done) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  l10n.couldNotOpenFile(
                    result.message.isEmpty ? l10n.unknownError : result.message,
                  ),
                ),
              ),
            );
          }
        },
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 2),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          StreamBuilder<PlayerState>(
            stream: _player.playerStateStream,
            builder: (BuildContext context, AsyncSnapshot<PlayerState> snap) {
              final bool playing = snap.data?.playing ?? false;
              final bool loading = !_ready;
              return IconButton(
                iconSize: 28,
                onPressed: loading
                    ? null
                    : () {
                        if (playing) {
                          _player.pause();
                        } else {
                          _player.play();
                        }
                      },
                icon: Icon(
                  loading
                      ? Icons.hourglass_empty
                      : (playing ? Icons.pause_circle : Icons.play_circle),
                ),
              );
            },
          ),
          const SizedBox(width: 4),
          SizedBox(
            width: 140,
            child: StreamBuilder<Duration>(
              stream: _player.positionStream,
              builder: (BuildContext context, AsyncSnapshot<Duration> snap) {
                final Duration position = snap.data ?? Duration.zero;
                final Duration total = _duration ?? Duration.zero;
                final double maxValue =
                    total.inMilliseconds > 0 ? total.inMilliseconds.toDouble() : 1;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Slider(
                      value: min(
                        position.inMilliseconds.toDouble(),
                        maxValue,
                      ),
                      max: maxValue,
                      onChanged: (double value) {
                        _player.seek(Duration(milliseconds: value.toInt()));
                      },
                    ),
                    Text(
                      '${_formatDuration(position)} / ${_formatDuration(total)}',
                      style: const TextStyle(fontSize: 11, color: Color(0xFF54656F)),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration value) {
    final int minutes = value.inMinutes;
    final int seconds = value.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

class _ImageAttachment extends StatelessWidget {
  const _ImageAttachment({required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    final File image = File(path);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => _ImageViewerScreen(path: path),
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.file(
          image,
          fit: BoxFit.cover,
          width: 230,
          errorBuilder: (_, error, stackTrace) => _FileMissing(path: path),
        ),
      ),
    );
  }
}

class _VideoAttachment extends StatelessWidget {
  const _VideoAttachment({required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => _VideoViewerScreen(path: path),
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 230,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Icon(Icons.play_circle_fill, color: Colors.white, size: 48),
        ),
      ),
    );
  }
}

class _OpenableAttachment extends StatelessWidget {
  const _OpenableAttachment({
    required this.icon,
    required this.label,
    required this.action,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.only(top: 2),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F2F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    action,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF54656F),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FileMissing extends StatelessWidget {
  const _FileMissing({required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.only(top: 2),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(l10n.attachmentMissing(p.basename(path))),
    );
  }
}

class _ImageViewerScreen extends StatelessWidget {
  const _ImageViewerScreen({required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(p.basename(path)),
        backgroundColor: SettingsScope.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child: Image.file(File(path)),
        ),
      ),
    );
  }
}

class _PdfViewerScreen extends StatelessWidget {
  const _PdfViewerScreen({required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(p.basename(path)),
        backgroundColor: SettingsScope.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: PDFView(
        filePath: path,
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: true,
        pageFling: true,
      ),
    );
  }
}

class _VideoViewerScreen extends StatefulWidget {
  const _VideoViewerScreen({required this.path});

  final String path;

  @override
  State<_VideoViewerScreen> createState() => _VideoViewerScreenState();
}

class _VideoViewerScreenState extends State<_VideoViewerScreen> {
  late final VideoPlayerController _controller;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path));
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _ready = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(p.basename(widget.path)),
        backgroundColor: SettingsScope.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: _ready
          ? Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
                VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      });
                    },
                    iconSize: 44,
                    color: Colors.white,
                    icon: Icon(
                      _controller.value.isPlaying ? Icons.pause_circle : Icons.play_circle,
                    ),
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}


class _DateSeparator extends StatelessWidget {
  const _DateSeparator({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFE1F3FB),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF54656F)),
        ),
      ),
    );
  }
}

class _ChatListEntry {
  _ChatListEntry.message(this.message, this.messageIndex)
      : date = null,
        isDate = false;

  _ChatListEntry.date(this.date)
      : message = null,
        messageIndex = null,
        isDate = true;

  final ChatMessage? message;
  final int? messageIndex;
  final DateTime? date;
  final bool isDate;
}
