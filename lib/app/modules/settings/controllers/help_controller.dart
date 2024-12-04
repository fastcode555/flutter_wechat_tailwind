import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpController extends GetxController {
  void showFAQ() {
    // TODO: 显示常见问题页面
    Get.toNamed('/settings/help/faq');
  }

  void showFeedback() {
    // TODO: 显示意见反馈页面
    Get.toNamed('/settings/help/feedback');
  }

  Future<void> contactSupport() async {
    // TODO: 实现在线客服功能
    const url = 'https://support.wechat.com';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Get.snackbar('错误', '无法打开客服页面');
    }
  }

  void showComplaint() {
    // TODO: 显示投诉页面
    Get.toNamed('/settings/help/complaint');
  }
} 