enum NotificationType {
  message,      // 聊天消息
  friendRequest,// 好友请求
  comment,      // 朋友圈评论
  like,         // 朋友圈点赞
  system,       // 系统通知
}

class NotificationModel {
  final String id;
  final String title;
  final String body;
  final NotificationType type;
  final String? targetId;  // 关联的目标ID（如消息ID、朋友圈ID等）
  final String? senderId;  // 发送者ID
  final DateTime createdAt;
  final bool isRead;
  final Map<String, dynamic>? extra; // 额外数据

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    this.targetId,
    this.senderId,
    required this.createdAt,
    this.isRead = false,
    this.extra,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      type: NotificationType.values[json['type']],
      targetId: json['targetId'],
      senderId: json['senderId'],
      createdAt: DateTime.parse(json['createdAt']),
      isRead: json['isRead'] ?? false,
      extra: json['extra'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'type': type.index,
      'targetId': targetId,
      'senderId': senderId,
      'createdAt': createdAt.toIso8601String(),
      'isRead': isRead,
      'extra': extra,
    };
  }
} 