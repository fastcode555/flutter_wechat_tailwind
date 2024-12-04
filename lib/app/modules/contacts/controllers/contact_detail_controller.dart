import 'package:flutter_wechat_tailwind/app/modules/contacts/controllers/contacts_controller.dart';
import 'package:get/get.dart';

class ContactDetailController extends GetxController {
  final contact = ContactModel(
    id: 0,
    name: 'Contact ${Get.parameters['id'] ?? ''}',
    avatar: '',
    pinyin: 'C',
  ).obs;

  @override
  void onInit() {
    super.onInit();
    loadContactDetail();
  }

  Future<void> loadContactDetail() async {
    // TODO: 实现加载联系人详情的逻辑
    await Future.delayed(const Duration(seconds: 1));
  }
}
