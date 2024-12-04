import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:flutter_wechat_tailwind/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/setting_item_model.dart';

class SettingsController extends GetxController {
  final accountSettings = <SettingItemModel>[
    SettingItemModel(
      title: 'settings_account_security',
      subtitle: 'settings_account_security_subtitle',
      route: Routes.ACCOUNT_SECURITY,
    ),
  ].obs;

  final notificationSettings = <SettingItemModel>[
    SettingItemModel(
      title: 'settings_notifications',
      route: Routes.NOTIFICATIONS,
    ),
    SettingItemModel(
      title: 'notifications_sound',
      isSwitch: true,
      switchValue: true,
      onSwitchChanged: (value) {
        // TODO: 实现声音开关
      },
    ),
    SettingItemModel(
      title: 'notifications_vibrate',
      isSwitch: true,
      switchValue: true,
      onSwitchChanged: (value) {
        // TODO: 实现振动开关
      },
    ),
  ].obs;

  final privacySettings = <SettingItemModel>[
    SettingItemModel(
      title: 'settings_privacy',
      route: Routes.PRIVACY,
    ),
    SettingItemModel(
      title: 'privacy_moments',
      route: Routes.PRIVACY_MOMENTS,
    ),
    SettingItemModel(
      title: 'privacy_blacklist',
      route: Routes.PRIVACY_BLACKLIST,
    ),
  ].obs;

  final generalSettings = <SettingItemModel>[
    SettingItemModel(
      title: 'general_language',
      subtitle: 'general_language_current',
      route: Routes.GENERAL_LANGUAGE,
    ),
    SettingItemModel(
      title: 'general_font_size',
      subtitle: 'font_size_normal',
      route: Routes.GENERAL_FONT_SIZE,
    ),
    SettingItemModel(
      title: 'general_chat_background',
      route: Routes.GENERAL_CHAT_BACKGROUND,
    ),
    SettingItemModel(
      title: 'general_storage',
      subtitle: '2.1 GB',
      route: Routes.GENERAL_STORAGE,
    ),
  ].obs;

  final aboutSettings = <SettingItemModel>[
    SettingItemModel(
      title: 'settings_help',
      route: Routes.HELP,
    ),
    SettingItemModel(
      title: 'settings_about',
      subtitle: 'v8.0.0',
      route: Routes.ABOUT,
    ),
  ].obs;

  Future<void> logout() async {
    final result = await Get.dialog<bool>(
      AlertDialog(
        title: text('settings_logout'.tr).f18.mk,
        content: text('settings_logout_confirm'.tr).f16.mk,
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: text('cancel'.tr).f16.mk,
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: text('confirm'.tr).f16.mk,
          ),
        ],
      ),
    );

    if (result == true) {
      // TODO: 实现退出登录逻辑
      Get.offAllNamed(Routes.AUTH);
    }
  }
}
