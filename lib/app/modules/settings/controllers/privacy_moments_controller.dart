import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

class PrivacyMomentsController extends GetxController {
  final settings = MomentsPrivacySettings(
    allowStrangerView: false,
    showUpdateReminder: true,
  ).obs;

  final hiddenFromList = <String>[].obs;
  final hideList = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSettings();
  }

  Future<void> loadSettings() async {
    // TODO: 从服务器加载设置
    await Future.delayed(const Duration(seconds: 1));
    hiddenFromList.value = ['用户1', '用户2'];
    hideList.value = ['用户3', '用户4'];
  }

  void setVisibleRange() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: column.children([
          text('可见范围').f18.p16.mk,
          h12,
          text('全部').f16.p16.click(onTap: () => Get.back(result: 'all')),
          h12,
          text('最近半年').f16.p16.click(onTap: () => Get.back(result: 'half_year')),
          h12,
          text('最近三个月').f16.p16.click(onTap: () => Get.back(result: 'three_months')),
          h12,
          text('取消').f16.p16.click(onTap: () => Get.back()),
        ]),
      ),
    );
  }

  void manageHiddenFrom() {
    // TODO: 实现管理不让谁看的功能
  }

  void manageHideList() {
    // TODO: 实现管理不看谁的功能
  }

  void toggleStrangerView(bool value) {
    settings.update((val) {
      val?.allowStrangerView = value;
    });
  }

  void toggleUpdateReminder(bool value) {
    settings.update((val) {
      val?.showUpdateReminder = value;
    });
  }
}

class MomentsPrivacySettings {
  bool allowStrangerView;
  bool showUpdateReminder;

  MomentsPrivacySettings({
    required this.allowStrangerView,
    required this.showUpdateReminder,
  });
}
