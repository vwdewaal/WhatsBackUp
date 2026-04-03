import 'dart:convert';

class MediaImportJob {
  MediaImportJob({
    required this.id,
    required this.archiveId,
    required this.zipPath,
    required this.targetDir,
    required this.createdAt,
    required this.status,
    required this.processed,
    required this.total,
    this.error,
  });

  final String id;
  final String archiveId;
  final String zipPath;
  final String targetDir;
  final DateTime createdAt;
  final String status;
  final int processed;
  final int total;
  final String? error;

  MediaImportJob copyWith({
    String? zipPath,
    String? status,
    int? processed,
    int? total,
    String? error,
  }) {
    return MediaImportJob(
      id: id,
      archiveId: archiveId,
      zipPath: zipPath ?? this.zipPath,
      targetDir: targetDir,
      createdAt: createdAt,
      status: status ?? this.status,
      processed: processed ?? this.processed,
      total: total ?? this.total,
      error: error,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'archiveId': archiveId,
        'zipPath': zipPath,
        'targetDir': targetDir,
        'createdAt': createdAt.toIso8601String(),
        'status': status,
        'processed': processed,
        'total': total,
        'error': error,
      };

  static MediaImportJob fromJson(Map<String, dynamic> json) {
    return MediaImportJob(
      id: json['id'] as String,
      archiveId: json['archiveId'] as String,
      zipPath: json['zipPath'] as String,
      targetDir: json['targetDir'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String? ?? 'running',
      processed: json['processed'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
      error: json['error'] as String?,
    );
  }

  String serialize() => jsonEncode(toJson());

  static MediaImportJob deserialize(String input) {
    final Map<String, dynamic> json = jsonDecode(input) as Map<String, dynamic>;
    return fromJson(json);
  }
}
