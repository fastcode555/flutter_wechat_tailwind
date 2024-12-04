import 'package:flutter_wechat_tailwind/app/modules/settings/controllers/account_security_controller.dart';
import 'package:flutter_wechat_tailwind/app/modules/settings/controllers/settings_controller.dart';
import 'package:flutter_wechat_tailwind/app/modules/settings/controllers/notifications_controller.dart';
import 'package:flutter_wechat_tailwind/app/modules/settings/controllers/privacy_controller.dart';
import 'package:flutter_wechat_tailwind/app/modules/settings/controllers/general_controller.dart';
import 'package:flutter_wechat_tailwind/app/modules/settings/controllers/privacy_moments_controller.dart';
import 'package:flutter_wechat_tailwind/app/data/services/settings_service.dart';
import 'package:get/get.dart';

import '../controllers/blacklist_controller.dart';
import '../controllers/font_size_controller.dart';
import '../controllers/language_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    // Initialize services first
    Get.put<SettingsService>(SettingsService(), permanent: true);

    // Initialize controllers
    Get.put<SettingsController>(SettingsController());
    Get.put<NotificationsController>(NotificationsController());
    Get.put<PrivacyController>(PrivacyController());
    Get.put<GeneralController>(GeneralController());
    Get.put<PrivacyMomentsController>(PrivacyMomentsController());
    Get.put<AccountSecurityController>(AccountSecurityController());
    Get.put<BlacklistController>(BlacklistController());
    Get.put<FontSizeController>(FontSizeController());
    Get.put<LanguageController>(LanguageController());
  }
}

class BlacklistBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BlacklistController>(BlacklistController());
  }
}

class FontSizeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FontSizeController>(FontSizeController());
  }
}

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LanguageController>(LanguageController());
  }
}
