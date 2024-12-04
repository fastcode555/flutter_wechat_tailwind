import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutController extends GetxController {
  // 版本信息
  final version = '8.0.0'.obs;
  final buildNumber = '2024030101'.obs;

  // 检查更新
  Future<void> checkUpdate() async {
    Get.dialog(
      AlertDialog(
        title: const Text('检查更新'),
        content: const Text('当前已是最新版本'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  // 功能介绍
  Future<void> showFeatures() async {
    const url = 'https://weixin.qq.com/cgi-bin/readtemplate?t=weixin_faq_list';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Get.snackbar('错误', '无法打开功能介绍页面');
    }
  }

  // 隐私政策
  Future<void> showPrivacyPolicy() async {
    const url = 'https://weixin.qq.com/cgi-bin/readtemplate?t=weixin_agreement&type=privacy';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Get.snackbar('错误', '无法打开隐私政策页面');
    }
  }
}
