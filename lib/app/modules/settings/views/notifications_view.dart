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
        title: text('新消息通知').f18.mk,
      ),
      body: SingleChildScrollView(
        child: column.children([
          // 接收新消息通知
          _buildSection([
            _buildMenuItem(
              icon: Icons.notifications,
              title: '接收新消息通知',
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
              title: '通知显示消息详情',
              iconColor: Colors.green,
              trailing: Obx(() => Switch(
                value: controller.settings.value.showMessageDetails,
                onChanged: controller.toggleMessageDetails,
              )),
            ),
          ]),

          // 声音
          _buildSection([
            _buildMenuItem(
              icon: Icons.volume_up,
              title: '声音',
              iconColor: Colors.orange,
              trailing: Obx(() => Switch(
                value: controller.settings.value.sound,
                onChanged: controller.toggleSound,
              )),
            ),
          ]),

          // 振动
          _buildSection([
            _buildMenuItem(
              icon: Icons.vibration,
              title: '振动',
              iconColor: Colors.purple,
              trailing: Obx(() => Switch(
                value: controller.settings.value.vibration,
                onChanged: controller.toggleVibration,
              )),
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
    required Widget trailing,
    Color iconColor = Colors.blue,
  }) {
    return row.white.p16.children([
      icon.icon.s24.color(iconColor).mk,
      w12,
      text(title).f16.expanded.mk,
      trailing,
    ]);
  }
}
