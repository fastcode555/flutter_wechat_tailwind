class UserModel {
  final String id;
  final String name;
  final String avatar;
  final String phone;
  final String wxId;

  UserModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.phone,
    required this.wxId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      phone: json['phone'],
      wxId: json['wxId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'phone': phone,
      'wxId': wxId,
    };
  }
} 