import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';
import '../models/setting_item_model.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('settings_title'.tr).f18.mk,
      ),
      body: SingleChildScrollView(
        child: column.children([
          // 账号设置
          _buildSettingSection(controller.accountSettings),

          // 通知设置
          _buildSettingSection(controller.notificationSettings),

          // 隐私设置
          _buildSettingSection(controller.privacySettings),

          // 通用设置
          _buildSettingSection(controller.generalSettings),

          // 关于
          _buildSettingSection(controller.aboutSettings),

          // 退出登录
          _buildSection([
            row.white.p16.children([
              text('settings_logout'.tr).f16.red.expanded.mk,
            ]).click(onTap: () => controller.logout()),
          ]),
        ]),
      ),
    );
  }

  Widget _buildSettingSection(RxList<SettingItemModel> settings) {
    return Obx(() => _buildSection(
          settings.map((item) => _buildSettingItem(item)).toList(),
        ));
  }

  Widget _buildSettingItem(SettingItemModel item) {
    if (item.isSwitch) {
      return row.white.p16.children([
        text(item.title.tr).f16.expanded.mk,
        Switch(
          value: item.switchValue,
          onChanged: item.onSwitchChanged,
        ),
      ]);
    }

    return row.white.p16.children([
      column.crossStart.expanded.children([
        text(item.title.tr).f16.mk,
        if (item.subtitle != null) ...[
          h4,
          text(item.subtitle!.tr).f14.grey.mk,
        ],
      ]),
      if (item.route != null) icon(Icons.chevron_right).s24.grey.mk,
    ]).click(onTap: item.route != null ? () => Get.toNamed(item.route!) : null);
  }

  Widget _buildSection(List<Widget> children) {
    return column.children([
      h12,
      ...children,
    ]);
  }
}
