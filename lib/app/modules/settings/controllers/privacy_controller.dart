import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyController extends GetxController {
  final settings = PrivacySettings(
    requireVerification: true,
    recommendContacts: true,
    enableMoments: true,
  ).obs;

  final blacklist = <String>[].obs;
  final allowStrangerChat = false.obs;
  final addMeMethods = <AddMeMethod>[
    AddMeMethod(
      type: 'phone',
      title: 'privacy_add_by_phone'.tr,
      enabled: true,
    ),
    AddMeMethod(
      type: 'wechat_id',
      title: 'privacy_add_by_wechat_id'.tr,
      enabled: true,
    ),
    AddMeMethod(
      type: 'qr_code',
      title: 'privacy_add_by_qr_code'.tr,
      enabled: true,
    ),
    AddMeMethod(
      type: 'card',
      title: 'privacy_add_by_card'.tr,
      enabled: true,
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    loadSettings();
  }

  Future<void> loadSettings() async {
    // TODO: Load settings from backend
    await Future.delayed(const Duration(seconds: 1));
    loadBlacklist();
  }

  Future<void> loadBlacklist() async {
    // TODO: Load blacklist from backend
    await Future.delayed(const Duration(seconds: 1));
    blacklist.value = ['用户1', '用户2', '用户3'];
  }

  void showAddMeSettings() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('privacy_add_me_settings'.tr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView.separated(
                itemCount: addMeMethods.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final method = addMeMethods[index];
                  return ListTile(
                    title: Text(method.title),
                    trailing: Switch(
                      value: method.enabled,
                      onChanged: (value) => toggleAddMeMethod(index, value),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toggleAddMeMethod(int index, bool value) {
    final method = addMeMethods[index];
    addMeMethods[index] = AddMeMethod(
      type: method.type,
      title: method.title,
      enabled: value,
    );
  }

  void toggleStrangerChat(bool value) {
    allowStrangerChat.value = value;
    // TODO: Update setting in backend
  }

  Future<void> saveSettings() async {
    // TODO: Save settings to backend
    await Future.delayed(const Duration(seconds: 1));
    Get.snackbar(
      'success'.tr,
      'settings_saved'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

class PrivacySettings {
  bool requireVerification;
  bool recommendContacts;
  bool enableMoments;

  PrivacySettings({
    required this.requireVerification,
    required this.recommendContacts,
    required this.enableMoments,
  });
}

class AddMeMethod {
  final String type;
  final String title;
  final bool enabled;

  AddMeMethod({
    required this.type,
    required this.title,
    required this.enabled,
  });
} 