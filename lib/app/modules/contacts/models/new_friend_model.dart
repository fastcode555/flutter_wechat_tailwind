class NewFriendModel {
  final int id;
  final String name;
  final String message;
  final bool isAccepted;
  final String avatar;

  NewFriendModel({
    required this.id,
    required this.name,
    required this.message,
    required this.isAccepted,
    this.avatar = '',
  });

  factory NewFriendModel.fromJson(Map<String, dynamic> json) {
    return NewFriendModel(
      id: json['id'] as int,
      name: json['name'] as String,
      message: json['message'] as String,
      isAccepted: json['isAccepted'] as bool,
      avatar: json['avatar'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'message': message,
      'isAccepted': isAccepted,
      'avatar': avatar,
    };
  }
} 