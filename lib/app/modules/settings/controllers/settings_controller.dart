import 'package:flutter/material.dart';
import 'package:flutter_wechat_tailwind/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/setting_item_model.dart';

class SettingsController extends GetxController {
  final accountSettings = <SettingItemModel>[
    SettingItemModel(
      title: '账号与安全',
      subtitle: '已开启账号保护',
      route: Routes.ACCOUNT_SECURITY,
    ),
  ].obs;

  final notificationSettings = <SettingItemModel>[
    SettingItemModel(
      title: '新消息通知',
      route: Routes.NOTIFICATIONS,
    ),
    SettingItemModel(
      title: '声音',
      isSwitch: true,
      switchValue: true,
      onSwitchChanged: (value) {
        // TODO: 实现声音开关
      },
    ),
    SettingItemModel(
      title: '振动',
      isSwitch: true,
      switchValue: true,
      onSwitchChanged: (value) {
        // TODO: 实现振动开关
      },
    ),
  ].obs;

  final privacySettings = <SettingItemModel>[
    SettingItemModel(
      title: '隐私',
      route: Routes.PRIVACY,
    ),
    SettingItemModel(
      title: '朋友圈',
      route: Routes.PRIVACY_MOMENTS,
    ),
    SettingItemModel(
      title: '黑名单',
      route: Routes.PRIVACY_BLACKLIST,
    ),
  ].obs;

  final generalSettings = <SettingItemModel>[
    SettingItemModel(
      title: '多语言',
      subtitle: '简体中文',
      route: Routes.GENERAL_LANGUAGE,
    ),
    SettingItemModel(
      title: '字体大小',
      subtitle: '标准',
      route: Routes.GENERAL_FONT_SIZE,
    ),
    SettingItemModel(
      title: '聊天背景',
      route: Routes.GENERAL_CHAT_BACKGROUND,
    ),
    SettingItemModel(
      title: '清理存储空间',
      subtitle: '2.1 GB',
      route: Routes.GENERAL_STORAGE,
    ),
  ].obs;

  final aboutSettings = <SettingItemModel>[
    SettingItemModel(
      title: '帮助与反馈',
      route: Routes.HELP,
    ),
    SettingItemModel(
      title: '关于微信',
      subtitle: '版本 8.0.0',
      route: Routes.ABOUT,
    ),
  ].obs;

  Future<void> logout() async {
    final result = await Get.dialog(
      AlertDialog(
        title: const Text('退出登录'),
        content: const Text('确定要退出登录吗？'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text('确定'),
          ),
        ],
      ),
    );

    if (result == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      Get.offAllNamed(Routes.AUTH);
    }
  }
}
