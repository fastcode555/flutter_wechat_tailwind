import 'package:flutter_wechat_tailwind/app/data/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MomentModel {
  final String id;
  final String userId;
  final String content;
  final List<String> images;
  final DateTime createdAt;
  final List<LikeModel> likes;
  final List<CommentModel> comments;
  final MomentPrivacy privacy;

  String get userName {
    final userService = Get.find<AuthService>();
    if (userId == userService.user?.id) {
      return userService.user?.name ?? '';
    }
    return '用户$userId';
  }

  String get time {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inMinutes < 1) {
      return '刚刚';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}分钟前';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}小时前';
    } else if (difference.inDays < 30) {
      return '${difference.inDays}天前';
    } else {
      return DateFormat('yyyy年MM月dd日').format(createdAt);
    }
  }

  MomentModel({
    required this.id,
    required this.userId,
    required this.content,
    required this.images,
    required this.createdAt,
    required this.likes,
    required this.comments,
    this.privacy = MomentPrivacy.public,
  });

  factory MomentModel.fromJson(Map<String, dynamic> json) {
    return MomentModel(
      id: json['id'],
      userId: json['userId'],
      content: json['content'],
      images: List<String>.from(json['images']),
      createdAt: DateTime.parse(json['createdAt']),
      likes: (json['likes'] as List).map((e) => LikeModel.fromJson(e)).toList(),
      comments: (json['comments'] as List).map((e) => CommentModel.fromJson(e)).toList(),
      privacy: MomentPrivacy.values[json['privacy'] ?? 0],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
      'images': images,
      'createdAt': createdAt.toIso8601String(),
      'likes': likes.map((e) => e.toJson()).toList(),
      'comments': comments.map((e) => e.toJson()).toList(),
      'privacy': privacy.index,
    };
  }

  MomentModel copyWith({
    String? id,
    String? userId,
    String? content,
    List<String>? images,
    DateTime? createdAt,
    List<LikeModel>? likes,
    List<CommentModel>? comments,
    MomentPrivacy? privacy,
  }) {
    return MomentModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      privacy: privacy ?? this.privacy,
    );
  }
}

enum MomentPrivacy {
  public,
  friends,
  private,
}

class LikeModel {
  final String id;
  final String userId;
  final DateTime createdAt;

  String get userName {
    final userService = Get.find<AuthService>();
    if (userId == userService.user?.id) {
      return userService.user?.name ?? '';
    }
    return '用户$userId';
  }

  LikeModel({
    required this.id,
    required this.userId,
    required this.createdAt,
  });

  factory LikeModel.fromJson(Map<String, dynamic> json) {
    return LikeModel(
      id: json['id'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class CommentModel {
  final String id;
  final String userId;
  final String content;
  final DateTime createdAt;
  final String? replyTo;

  String get userName {
    final userService = Get.find<AuthService>();
    if (userId == userService.user?.id) {
      return userService.user?.name ?? '';
    }
    return '用户$userId';
  }

  String? get replyToUserName {
    if (replyTo == null) return null;
    return '用户$replyTo';
  }

  CommentModel({
    required this.id,
    required this.userId,
    required this.content,
    required this.createdAt,
    this.replyTo,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      userId: json['userId'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
      replyTo: json['replyTo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'replyTo': replyTo,
    };
  }
}
