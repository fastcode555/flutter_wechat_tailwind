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
        title: text('隐私').f18.mk,
      ),
      body: SingleChildScrollView(
        child: column.children([
          // 朋友圈
          _buildSection([
            row.white.p16.children([
              text('朋友圈和视频动态').f16.expanded.mk,
              Icons.chevron_right.icon.s24.grey.mk,
            ]).click(onTap: () => Get.toNamed(Routes.PRIVACY_MOMENTS)),
          ]),

          // 添加我的方式
          _buildSection([
            row.white.p16.children([
              column.crossStart.expanded.children([
                text('添加我的方式').f16.mk,
                h4,
                text('手机号、微信号').f14.grey.mk,
              ]),
              Icons.chevron_right.icon.s24.grey.mk,
            ]).click(onTap: () => controller.manageAddMethods()),
          ]),

          // 黑名单
          _buildSection([
            row.white.p16.children([
              text('黑名单').f16.expanded.mk,
              text('${controller.blacklist.length}个').f14.grey.mk,
              w8,
              Icons.chevron_right.icon.s24.grey.mk,
            ]).click(onTap: () => Get.toNamed(Routes.PRIVACY_BLACKLIST)),
          ]),

          // 隐私设置
          _buildSection([
            row.white.p16.children([
              text('加我为好友时需要验证').f16.expanded.mk,
              Obx(() => Switch(
                    value: controller.settings.value.requireVerification,
                    onChanged: controller.toggleVerification,
                  )),
            ]),
            h12,
            row.white.p16.children([
              text('向我推荐通讯录好友').f16.expanded.mk,
              Obx(() => Switch(
                    value: controller.settings.value.recommendContacts,
                    onChanged: controller.toggleRecommendContacts,
                  )),
            ]),
            h12,
            row.white.p16.children([
              text('开启朋友圈入口').f16.expanded.mk,
              Obx(() => Switch(
                    value: controller.settings.value.enableMoments,
                    onChanged: controller.toggleMoments,
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
