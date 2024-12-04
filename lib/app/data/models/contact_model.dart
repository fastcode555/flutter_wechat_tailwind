class ContactModel {
  final String id;
  final String name;
  final String avatar;
  final String wxId;
  final String? phone;
  final String pinyin;
  final String? remark;
  final String? region;
  final List<String> tags;
  final bool isStarred;
  final bool isBlocked;

  ContactModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.wxId,
    this.phone,
    required this.pinyin,
    this.remark,
    this.region,
    this.tags = const [],
    this.isStarred = false,
    this.isBlocked = false,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      wxId: json['wxId'],
      phone: json['phone'],
      pinyin: json['pinyin'],
      remark: json['remark'],
      region: json['region'],
      tags: List<String>.from(json['tags'] ?? []),
      isStarred: json['isStarred'] ?? false,
      isBlocked: json['isBlocked'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'wxId': wxId,
      'phone': phone,
      'pinyin': pinyin,
      'remark': remark,
      'region': region,
      'tags': tags,
      'isStarred': isStarred,
      'isBlocked': isBlocked,
    };
  }
} 