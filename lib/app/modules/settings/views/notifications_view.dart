import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('settings_notifications'.tr).f18.mk,
      ),
      body: SingleChildScrollView(
        child: column.children([
          // 接收新消息通知
          _buildSection([
            _buildMenuItem(
              icon: Icons.notifications,
              title: 'notifications_receive'.tr,
              iconColor: Colors.blue,
              trailing: Obx(() => Switch(
                value: controller.settings.value.receiveNotifications,
                onChanged: controller.toggleNotifications,
              )),
            ),
          ]),

          // 通知显示消息详情
          _buildSection([
            _buildMenuItem(
              icon: Icons.visibility,
              title: 'notifications_show_detail'.tr,
              iconColor: Colors.green,
              trailing: Obx(() => Switch(
                value: controller.settings.value.showMessageDetails,
                onChanged: controller.toggleShowDetails,
              )),
            ),
          ]),

          // 声音和振动
          _buildSection([
            _buildMenuItem(
              icon: Icons.volume_up,
              title: 'notifications_sound'.tr,
              iconColor: Colors.orange,
              trailing: Obx(() => Switch(
                value: controller.settings.value.sound,
                onChanged: controller.toggleSound,
              )),
            ),
            h12,
            _buildMenuItem(
              icon: Icons.vibration,
              title: 'notifications_vibrate'.tr,
              iconColor: Colors.purple,
              trailing: Obx(() => Switch(
                value: controller.settings.value.vibrate,
                onChanged: controller.toggleVibrate,
              )),
            ),
          ]),

          // 测试通知
          _buildSection([
            _buildMenuItem(
              icon: Icons.notifications_active,
              title: 'notifications_test'.tr,
              iconColor: Colors.blue,
              onTap: () => controller.testNotification(),
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
    required Color iconColor,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return row.white.p16.children([
      icon.icon.s24.color(iconColor).mk,
      w12,
      text(title).f16.expanded.mk,
      if (trailing != null) trailing,
    ]).click(onTap: onTap);
  }
}
