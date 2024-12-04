import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsController extends GetxController {
  static const String _receiveKey = 'notification_receive';
  static const String _showDetailsKey = 'notification_show_details';
  static const String _soundKey = 'notification_sound';
  static const String _vibrateKey = 'notification_vibrate';

  final settings = NotificationSettings(
    receiveNotifications: true,
    showMessageDetails: true,
    sound: true,
    vibrate: true,
  ).obs;

  @override
  void onInit() {
    super.onInit();
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    settings.update((val) {
      if (val != null) {
        val.receiveNotifications = prefs.getBool(_receiveKey) ?? true;
        val.showMessageDetails = prefs.getBool(_showDetailsKey) ?? true;
        val.sound = prefs.getBool(_soundKey) ?? true;
        val.vibrate = prefs.getBool(_vibrateKey) ?? true;
      }
    });
  }

  Future<void> toggleNotifications(bool value) async {
    settings.update((val) {
      if (val != null) {
        val.receiveNotifications = value;
        // 如果关闭了通知，其他选项也应该被禁用
        if (!value) {
          val.showMessageDetails = false;
          val.sound = false;
          val.vibrate = false;
        }
      }
    });
    await _saveSettings();
    
    if (value) {
      // TODO: 请求通知权限
      _requestNotificationPermission();
    }
  }

  Future<void> toggleShowDetails(bool value) async {
    if (!settings.value.receiveNotifications) return;
    settings.update((val) {
      if (val != null) {
        val.showMessageDetails = value;
      }
    });
    await _saveSettings();
  }

  Future<void> toggleSound(bool value) async {
    if (!settings.value.receiveNotifications) return;
    settings.update((val) {
      if (val != null) {
        val.sound = value;
      }
    });
    await _saveSettings();
  }

  Future<void> toggleVibrate(bool value) async {
    if (!settings.value.receiveNotifications) return;
    settings.update((val) {
      if (val != null) {
        val.vibrate = value;
      }
    });
    await _saveSettings();
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_receiveKey, settings.value.receiveNotifications);
    await prefs.setBool(_showDetailsKey, settings.value.showMessageDetails);
    await prefs.setBool(_soundKey, settings.value.sound);
    await prefs.setBool(_vibrateKey, settings.value.vibrate);

    // TODO: 更新服务器端的通知设置
    await _updateServerSettings();
  }

  Future<void> _requestNotificationPermission() async {
    // TODO: 实现请求通知权限的逻辑
    // 可以使用 permission_handler 或 flutter_local_notifications 插件
    return;
  }

  Future<void> _updateServerSettings() async {
    // TODO: 实现更新服务器端通知设置的逻辑
    await Future.delayed(const Duration(seconds: 1));
  }

  // 测试通知
  Future<void> testNotification() async {
    if (!settings.value.receiveNotifications) {
      Get.snackbar(
        'notifications_disabled'.tr,
        'notifications_enable_first'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // TODO: 实现发送测试通知的逻辑
    Get.snackbar(
      'notifications_test'.tr,
      'notifications_test_sent'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

class NotificationSettings {
  bool receiveNotifications;
  bool showMessageDetails;
  bool sound;
  bool vibrate;

  NotificationSettings({
    required this.receiveNotifications,
    required this.showMessageDetails,
    required this.sound,
    required this.vibrate,
  });
} 