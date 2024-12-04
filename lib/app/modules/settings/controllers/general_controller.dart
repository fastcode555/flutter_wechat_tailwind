import 'package:get/get.dart';

class GeneralController extends GetxController {
  final settings = GeneralSettings(
    language: 'zh_CN',
    fontSize: 'normal',
    chatBackground: 'default',
    storageUsage: '2.1 GB',
  ).obs;

  void manageEmojis() {
    // TODO: 实现表情管理
  }

  Future<void> loadSettings() async {
    // TODO: 从服务器加载设置
    await Future.delayed(const Duration(seconds: 1));
  }
}

class GeneralSettings {
  String language;
  String fontSize;
  String chatBackground;
  String storageUsage;

  GeneralSettings({
    required this.language,
    required this.fontSize,
    required this.chatBackground,
    required this.storageUsage,
  });
} 