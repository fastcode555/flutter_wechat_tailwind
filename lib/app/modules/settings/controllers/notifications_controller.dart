import 'package:get/get.dart';

class NotificationsController extends GetxController {
  final settings = NotificationSettings(
    receiveNotifications: true,
    showMessageDetails: true,
    sound: true,
    vibration: true,
  ).obs;

  void toggleNotifications(bool value) {
    settings.update((val) {
      val?.receiveNotifications = value;
    });
  }

  void toggleMessageDetails(bool value) {
    settings.update((val) {
      val?.showMessageDetails = value;
    });
  }

  void toggleSound(bool value) {
    settings.update((val) {
      val?.sound = value;
    });
  }

  void toggleVibration(bool value) {
    settings.update((val) {
      val?.vibration = value;
    });
  }
}

class NotificationSettings {
  bool receiveNotifications;
  bool showMessageDetails;
  bool sound;
  bool vibration;

  NotificationSettings({
    required this.receiveNotifications,
    required this.showMessageDetails,
    required this.sound,
    required this.vibration,
  });
} 