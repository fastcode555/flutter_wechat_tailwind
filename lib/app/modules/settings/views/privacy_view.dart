import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:flutter_wechat_tailwind/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/privacy_controller.dart';

class PrivacyView extends GetView<PrivacyController> {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('settings_privacy'.tr).f18.mk,
      ),
      body: SingleChildScrollView(
        child: column.children([
          // 朋友圈
          _buildSection([
            row.white.p16.children([
              text('privacy_moments'.tr).f16.expanded.mk,
              Icons.chevron_right.icon.s24.grey.mk,
            ]).click(onTap: () => Get.toNamed(Routes.PRIVACY_MOMENTS)),
          ]),

          // 黑名单
          _buildSection([
            row.white.p16.children([
              text('privacy_blacklist'.tr).f16.expanded.mk,
              text('${controller.blacklist.length}人').f14.grey.mk,
              w8,
              Icons.chevron_right.icon.s24.grey.mk,
            ]).click(onTap: () => Get.toNamed(Routes.PRIVACY_BLACKLIST)),
          ]),

          // 添加我的方式
          _buildSection([
            row.white.p16.children([
              text('privacy_add_friends'.tr).f16.expanded.mk,
              Icons.chevron_right.icon.s24.grey.mk,
            ]).click(onTap: () => controller.showAddMeSettings()),
          ]),

          // 允许陌生人聊天
          _buildSection([
            row.white.p16.children([
              text('privacy_stranger_chat'.tr).f16.expanded.mk,
              Obx(() => Switch(
                value: controller.allowStrangerChat.value,
                onChanged: controller.toggleStrangerChat,
              )),
            ]),
          ]),
        ]),
      ),
    );
  }

  Widget _buildSection(List<Widget> children) {
    return column.children([
      h12,
      ...children,
    ]);
  }
}
