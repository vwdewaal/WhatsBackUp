import 'dart:convert';

class ChatArchive {
  ChatArchive({
    required this.id,
    required this.name,
    required this.sourceName,
    required this.folderPath,
    required this.chatFilePath,
    required this.createdAt,
    this.isArchived = false,
    List<String>? additionalChatFiles,
  }) : additionalChatFiles = additionalChatFiles ?? <String>[];

  final String id;
  final String name;
  final String sourceName;
  final String folderPath;
  final String chatFilePath;
  final DateTime createdAt;
  final bool isArchived;
  final List<String> additionalChatFiles;

  String get displayName {
    String value = name;
    value = value.replaceFirst(
      RegExp(r'^whatsapp chat with\s+', caseSensitive: false),
      '',
    );
    value = value.replaceFirst(
      RegExp(r'^whatsapp chat -\s*', caseSensitive: false),
      '',
    );
    value = value.replaceFirst(
      RegExp(r'\.zip$', caseSensitive: false),
      '',
    );
    return value.trim().isEmpty ? name : value.trim();
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'sourceName': sourceName,
        'folderPath': folderPath,
        'chatFilePath': chatFilePath,
        'additionalChatFiles': additionalChatFiles,
        'createdAt': createdAt.toIso8601String(),
        'isArchived': isArchived,
      };

  static ChatArchive fromJson(Map<String, dynamic> json) {
    final String parsedName = json['name'] as String? ?? 'Chat';
    return ChatArchive(
      id: json['id'] as String,
      name: parsedName,
      sourceName: json['sourceName'] as String? ?? parsedName,
      folderPath: json['folderPath'] as String,
      chatFilePath: json['chatFilePath'] as String,
      additionalChatFiles: (json['additionalChatFiles'] as List<dynamic>?)
              ?.map((dynamic value) => value as String)
              .toList() ??
          <String>[],
      createdAt: DateTime.parse(json['createdAt'] as String),
      isArchived: (json['isArchived'] as bool?) ?? false,
    );
  }

  String serialize() => jsonEncode(toJson());

  static ChatArchive deserialize(String input) {
    final Map<String, dynamic> json = jsonDecode(input) as Map<String, dynamic>;
    return fromJson(json);
  }
}

enum ChatMessageType {
  text,
  image,
  video,
  audio,
  document,
  unknownFile,
  system,
}

class ChatMessage {
  ChatMessage({
    required this.timestamp,
    required this.sender,
    required this.text,
    required this.type,
    this.attachmentPath,
  });

  final DateTime? timestamp;
  final String sender;
  final String text;
  final ChatMessageType type;
  final String? attachmentPath;
}

class ParsedChat {
  ParsedChat({
    required this.archive,
    required this.messages,
    required this.senders,
  });

  final ChatArchive archive;
  final List<ChatMessage> messages;
  final List<String> senders;
}
