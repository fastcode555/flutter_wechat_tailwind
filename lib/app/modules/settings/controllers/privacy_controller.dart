import 'package:get/get.dart';

class PrivacyController extends GetxController {
  final settings = PrivacySettings(
    requireVerification: true,
    recommendContacts: true,
    enableMoments: true,
  ).obs;

  final blacklist = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBlacklist();
  }

  Future<void> loadBlacklist() async {
    // TODO: 从服务器加载黑名单
    await Future.delayed(const Duration(seconds: 1));
    blacklist.value = ['用户1', '用户2', '用户3'];
  }

  void manageAddMethods() {
    // TODO: 实现添加方式管理
  }

  void toggleVerification(bool value) {
    settings.update((val) {
      val?.requireVerification = value;
    });
  }

  void toggleRecommendContacts(bool value) {
    settings.update((val) {
      val?.recommendContacts = value;
    });
  }

  void toggleMoments(bool value) {
    settings.update((val) {
      val?.enableMoments = value;
    });
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