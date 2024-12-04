import 'package:flutter/material.dart';
import 'package:flutter_wechat_tailwind/app/data/models/contact_model.dart';
import 'package:get/get.dart';

class ContactDetailController extends GetxController {
  final contact = ContactModel(
    id: Get.parameters['id'] ?? '0',
    name: 'Contact ${Get.parameters['id'] ?? ''}',
    avatar: '',
    wxId: 'wxid_${Get.parameters['id'] ?? ''}',
    pinyin: 'C',
    remark: '',
    region: '',
    tags: [],
  ).obs;

  final isStarred = false.obs;
  final isBlocked = false.obs;

  void sendMessage() {
    Get.toNamed('/chat/detail/${contact.value.id}');
  }

  void videoCall() {
    // TODO: Implement video call functionality
    Get.snackbar('提示'.tr, 'video_call_not_implemented'.tr);
  }

  void editRemark() {
    // Show dialog to edit remark
    Get.defaultDialog(
      title: 'contacts_edit_remark'.tr,
      content: TextField(
        controller: TextEditingController(text: contact.value.remark),
        decoration: InputDecoration(hintText: 'contacts_enter_remark'.tr),
      ),
      onConfirm: () {
        // TODO: Save remark
        Get.back();
      },
      textConfirm: 'confirm'.tr,
      textCancel: 'cancel'.tr,
    );
  }

  void manageTags() {
    Get.toNamed('/contacts/tags', arguments: contact.value);
  }

  void viewMoments() {
    Get.toNamed('/moments/${contact.value.id}');
  }

  void toggleStar() {
    isStarred.value = !isStarred.value;
    // TODO: Update star status in backend
  }

  void toggleBlock() {
    isBlocked.value = !isBlocked.value;
    // TODO: Update block status in backend
  }

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
