import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:path/path.dart' as p;

import '../models/chat_models.dart';
import '../models/media_import_job.dart';
import 'chat_import_service.dart';
import 'chat_repository.dart';

class MediaImportService {
  MediaImportService(this._repository, this._importService);

  static const String _jobsFile = 'media_import_jobs.json';
  static const String statusRunning = 'running';
  static const String statusPaused = 'paused';
  static const String statusFailed = 'failed';
  static const String statusDone = 'done';
  static const String errorMissingZip = 'missing_zip';

  final ChatRepository _repository;
  final ChatImportService _importService;
  final StreamController<MediaImportJob> _jobStreamController =
      StreamController<MediaImportJob>.broadcast();
  final Map<String, MediaImportJob> _jobs = <String, MediaImportJob>{};
  final List<String> _queue = <String>[];
  Future<void>? _runner;
  String? _activeJobId;
  bool _loaded = false;

  Stream<MediaImportJob> get jobUpdates => _jobStreamController.stream;

  Future<void> dispose() async {
    await _jobStreamController.close();
  }

  Future<List<MediaImportJob>> loadJobs() async {
    if (_loaded) {
      return _jobs.values.toList();
    }
    _loaded = true;
    final Directory root = await _repository.getArchivesRoot();
    final File file = File(p.join(root.path, _jobsFile));
    if (!file.existsSync()) {
      return _jobs.values.toList();
    }
    try {
      final Map<String, dynamic> json =
          jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
      final List<dynamic> raw = (json['jobs'] as List<dynamic>? ?? <dynamic>[]);
      for (final dynamic entry in raw) {
        if (entry is Map<String, dynamic>) {
          final MediaImportJob job = MediaImportJob.fromJson(entry);
          _jobs[job.id] = job;
        }
      }
      await _migrateLegacyDesktopJobs();
    } catch (_) {
      // Ignore malformed file.
    }
    return _jobs.values.toList();
  }

  Future<void> _persistJobs() async {
    final Directory root = await _repository.getArchivesRoot();
    final File file = File(p.join(root.path, _jobsFile));
    final Map<String, dynamic> json = <String, dynamic>{
      'jobs': _jobs.values.map((MediaImportJob job) => job.toJson()).toList(),
    };
    file.writeAsStringSync(jsonEncode(json));
  }

  List<MediaImportJob> jobsForArchive(String archiveId) {
    return _jobs.values
        .where((MediaImportJob job) => job.archiveId == archiveId)
        .toList();
  }

  MediaImportJob? activeJobForArchive(String archiveId) {
    final List<MediaImportJob> candidates = jobsForArchive(archiveId)
        .where((MediaImportJob job) =>
            job.status == statusRunning ||
            job.status == statusPaused ||
            job.status == statusFailed)
        .toList();
    if (candidates.isEmpty) {
      return null;
    }
    candidates.sort((MediaImportJob a, MediaImportJob b) =>
        b.createdAt.compareTo(a.createdAt));
    return candidates.first;
  }

  Future<MediaImportJob> startJob({
    required ChatArchive archive,
    required String zipPath,
    required String targetDir,
  }) async {
    await loadJobs();
    final String id = DateTime.now().millisecondsSinceEpoch.toString();
    final MediaImportJob job = MediaImportJob(
      id: id,
      archiveId: archive.id,
      zipPath: zipPath,
      targetDir: targetDir,
      createdAt: DateTime.now(),
      status: statusRunning,
      processed: 0,
      total: 0,
    );
    _jobs[id] = job;
    await _persistJobs();
    _enqueueJob(id);
    return job;
  }

  Future<void> resumePendingJobs() async {
    await loadJobs();
    for (final MediaImportJob job in _jobs.values) {
      if (job.status == statusRunning || job.status == statusPaused) {
        if (_shouldPauseExternalDesktopJob(job)) {
          final MediaImportJob updated = job.copyWith(
            status: statusPaused,
            error: errorMissingZip,
          );
          _jobs[job.id] = updated;
          await _persistJobs();
          _jobStreamController.add(updated);
          continue;
        }
        if (_activeJobId == job.id) {
          continue;
        }
        _enqueueJob(job.id);
      }
    }
  }

  Future<bool> resumeJobWithPicker(MediaImportJob job) async {
    final String? path = await _importService.pickZipPath();
    if (path == null) {
      return false;
    }
    final MediaImportJob updated = job.copyWith(
      zipPath: path,
      status: statusRunning,
      error: null,
    );
    _jobs[job.id] = updated;
    await _persistJobs();
    _enqueueJob(job.id);
    return true;
  }

  void _enqueueJob(String id) {
    if (_queue.contains(id)) {
      return;
    }
    _queue.add(id);
    _runner ??= _runQueue();
  }

  Future<void> _runQueue() async {
    while (_queue.isNotEmpty) {
      final String id = _queue.removeAt(0);
      final MediaImportJob? job = _jobs[id];
      if (job == null) {
        continue;
      }
      if (job.status == statusDone) {
        continue;
      }
      if (_activeJobId == id) {
        continue;
      }
      await _executeJob(job);
    }
    _runner = null;
  }

  Future<void> _executeJob(MediaImportJob job) async {
    _activeJobId = job.id;
    DateTime lastEmit = DateTime.fromMillisecondsSinceEpoch(0);
    int lastProcessed = job.processed;
    final File zipFile = File(job.zipPath);
    if (!zipFile.existsSync()) {
      final MediaImportJob updated = job.copyWith(
        status: statusPaused,
        error: errorMissingZip,
      );
      _jobs[job.id] = updated;
      await _persistJobs();
      _jobStreamController.add(updated);
      _activeJobId = null;
      return;
    }

    MediaImportJob current = job.copyWith(status: statusRunning, error: null);
    _jobs[job.id] = current;
    await _persistJobs();
    _jobStreamController.add(current);

    try {
      await _importService.extractMediaFromZip(
        zipPath: current.zipPath,
        targetDir: current.targetDir,
        startIndex: current.processed,
        onProgress: (int processed, int total) async {
          final DateTime now = DateTime.now();
          final bool force = processed >= total;
          if (!force &&
              now.difference(lastEmit).inMilliseconds < 400) {
            return;
          }
          lastEmit = now;
          lastProcessed = processed;
          current = current.copyWith(processed: processed, total: total);
          _jobs[current.id] = current;
          await _persistJobs();
          _jobStreamController.add(current);
        },
      );
      current = current.copyWith(status: statusDone, processed: current.total);
      _jobs[current.id] = current;
      await _persistJobs();
      _jobStreamController.add(current);
    } catch (e) {
      current = current.copyWith(
        status: statusFailed,
        error: e.toString(),
      );
      _jobs[current.id] = current;
      await _persistJobs();
      _jobStreamController.add(current);
    } finally {
      if (_activeJobId == job.id) {
        _activeJobId = null;
      }
    }
  }

  Future<void> _migrateLegacyDesktopJobs() async {
    bool changed = false;
    for (final MapEntry<String, MediaImportJob> entry in _jobs.entries.toList()) {
      final MediaImportJob job = entry.value;
      if (_shouldPauseExternalDesktopJob(job)) {
        _jobs[entry.key] = job.copyWith(
          status: statusPaused,
          error: errorMissingZip,
        );
        changed = true;
      }
    }
    if (changed) {
      await _persistJobs();
    }
  }

  bool _shouldPauseExternalDesktopJob(MediaImportJob job) {
    if (kIsWeb) {
      return false;
    }
    if (!(Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
      return false;
    }
    return !p.isWithin(job.targetDir, job.zipPath) && !job.zipPath.startsWith(job.targetDir);
  }
}
