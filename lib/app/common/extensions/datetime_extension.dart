import 'package:get/get.dart';

extension DateTimeExtension on DateTime {
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()}${'years_ago'.tr}';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()}${'months_ago'.tr}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}${'days_ago'.tr}';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}${'hours_ago'.tr}';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}${'minutes_ago'.tr}';
    } else {
      return 'just_now'.tr;
    }
  }
} 