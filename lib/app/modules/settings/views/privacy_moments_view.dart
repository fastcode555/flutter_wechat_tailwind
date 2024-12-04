import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

import '../controllers/privacy_moments_controller.dart';

class PrivacyMomentsView extends GetView<PrivacyMomentsController> {
  const PrivacyMomentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('朋友圈隐私设置').f18.mk,
      ),
      body: SingleChildScrollView(
        child: column.children([
          // 允许朋友查看朋友圈的范围
          _buildSection([
            _buildMenuItem(
              icon: Icons.visibility,
              title: '允许朋友查看朋友圈的范围',
              subtitle: '最近半年',
              iconColor: Colors.blue,
              onTap: () => controller.setVisibleRange(),
            ),
          ]),

          // 不让他看我的朋友圈
          _buildSection([
            _buildMenuItem(
              icon: Icons.block,
              title: '不让他看我的朋友圈',
              subtitle: '${controller.hiddenFromList.length}人',
              iconColor: Colors.red,
              onTap: () => controller.manageHiddenFrom(),
            ),
          ]),

          // 不看他的朋友圈
          _buildSection([
            _buildMenuItem(
              icon: Icons.visibility_off,
              title: '不看他的朋友圈',
              subtitle: '${controller.hideList.length}人',
              iconColor: Colors.orange,
              onTap: () => controller.manageHideList(),
            ),
          ]),

          // 其他设置
          _buildSection([
            _buildSwitchItem(
              icon: Icons.public,
              title: '允许陌生人查看十条朋友圈',
              iconColor: Colors.green,
              value: controller.settings.value.allowStrangerView,
              onChanged: controller.toggleStrangerView,
            ),
            h12,
            _buildSwitchItem(
              icon: Icons.notifications,
              title: '显示朋友圈更新提醒',
              iconColor: Colors.purple,
              value: controller.settings.value.showUpdateReminder,
              onChanged: controller.toggleUpdateReminder,
            ),
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

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    Color iconColor = Colors.blue,
  }) {
    return row.white.p16.children([
      icon.icon.s24.color(iconColor).mk,
      w12,
      column.crossStart.expanded.children([
        text(title).f16.mk,
        if (subtitle != null) ...[
          h4,
          text(subtitle).f14.grey.mk,
        ],
      ]),
      Icons.chevron_right.icon.s24.grey.mk,
    ]).click(onTap: onTap);
  }

  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
    Color iconColor = Colors.blue,
  }) {
    return row.white.p16.children([
      icon.icon.s24.color(iconColor).mk,
      w12,
      text(title).f16.expanded.mk,
      Switch(value: value, onChanged: onChanged),
    ]);
  }
}
