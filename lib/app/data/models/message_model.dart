class MessageModel {
  final String id;
  final String senderId;
  final String receiverId;
  final String content;
  final DateTime time;
  final MessageType type;
  final bool isRead;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.time,
    required this.type,
    this.isRead = false,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      content: json['content'],
      time: DateTime.parse(json['time']),
      type: MessageType.values[json['type']],
      isRead: json['isRead'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'content': content,
      'time': time.toIso8601String(),
      'type': type.index,
      'isRead': isRead,
    };
  }
}

enum MessageType {
  text,
  image,
  voice,
  video,
  file,
  location,
} 