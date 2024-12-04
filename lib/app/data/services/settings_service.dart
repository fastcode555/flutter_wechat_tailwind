import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService extends GetxService {
  // 通知设置
  final notificationSettings = NotificationSettings(
    receiveNotifications: true,
    showMessageDetails: true,
    sound: true,
    vibration: true,
  ).obs;

  // 隐私设置
  final privacySettings = PrivacySettings(
    requireVerification: true,
    recommendContacts: true,
    enableMoments: true,
  ).obs;

  // 通用设置
  final generalSettings = GeneralSettings(
    language: 'zh_CN',
    fontSize: 16.0,
    chatBackground: 'default',
  ).obs;

  @override
  void onInit() {
    super.onInit();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    // 加载通知设置
    notificationSettings.value = NotificationSettings(
      receiveNotifications: prefs.getBool('notification_receive') ?? true,
      showMessageDetails: prefs.getBool('notification_details') ?? true,
      sound: prefs.getBool('notification_sound') ?? true,
      vibration: prefs.getBool('notification_vibration') ?? true,
    );

    // 加载隐私设置
    privacySettings.value = PrivacySettings(
      requireVerification: prefs.getBool('privacy_verification') ?? true,
      recommendContacts: prefs.getBool('privacy_recommend') ?? true,
      enableMoments: prefs.getBool('privacy_moments') ?? true,
    );

    // 加载通用设置
    generalSettings.value = GeneralSettings(
      language: prefs.getString('general_language') ?? 'zh_CN',
      fontSize: prefs.getDouble('general_font_size') ?? 16.0,
      chatBackground: prefs.getString('general_chat_background') ?? 'default',
    );
  }

  Future<void> saveSettings() async {
    final prefs = await SharedPreferences.getInstance();

    // 保存通知设置
    await prefs.setBool('notification_receive', notificationSettings.value.receiveNotifications);
    await prefs.setBool('notification_details', notificationSettings.value.showMessageDetails);
    await prefs.setBool('notification_sound', notificationSettings.value.sound);
    await prefs.setBool('notification_vibration', notificationSettings.value.vibration);

    // 保存隐私设置
    await prefs.setBool('privacy_verification', privacySettings.value.requireVerification);
    await prefs.setBool('privacy_recommend', privacySettings.value.recommendContacts);
    await prefs.setBool('privacy_moments', privacySettings.value.enableMoments);

    // 保存通用设置
    await prefs.setString('general_language', generalSettings.value.language);
    await prefs.setDouble('general_font_size', generalSettings.value.fontSize);
    await prefs.setString('general_chat_background', generalSettings.value.chatBackground);
  }
}

class NotificationSettings {
  final bool receiveNotifications;
  final bool showMessageDetails;
  final bool sound;
  final bool vibration;

  NotificationSettings({
    required this.receiveNotifications,
    required this.showMessageDetails,
    required this.sound,
    required this.vibration,
  });
}

class PrivacySettings {
  final bool requireVerification;
  final bool recommendContacts;
  final bool enableMoments;

  PrivacySettings({
    required this.requireVerification,
    required this.recommendContacts,
    required this.enableMoments,
  });
}

class GeneralSettings {
  final String language;
  final double fontSize;
  final String chatBackground;

  GeneralSettings({
    required this.language,
    required this.fontSize,
    required this.chatBackground,
  });
}
