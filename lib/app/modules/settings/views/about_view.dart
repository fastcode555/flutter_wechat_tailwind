import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('settings_about'.tr).f18.mk,
      ),
      body: SingleChildScrollView(
        child: column.children([
          // Logo和版本号
          container.white.p32.center.child(
            column.children([
              Icons.wechat.icon.s64.primary.mk,
              h16,
              text('app_name'.tr).f18.bold.mk,
              h8,
              Obx(() => text('版本 ${controller.version.value}').f14.grey.mk),
              h4,
              Obx(() => text('Build ${controller.buildNumber.value}').f12.grey.mk),
            ]),
          ),

          // 功能列表
          _buildSection([
            _buildMenuItem(
              icon: Icons.update,
              title: '检查更新',
              iconColor: Colors.blue,
              onTap: () => controller.checkUpdate(),
            ),
            h12,
            _buildMenuItem(
              icon: Icons.security,
              title: '功能介绍',
              iconColor: Colors.green,
              onTap: () => controller.showFeatures(),
            ),
            h12,
            _buildMenuItem(
              icon: Icons.policy,
              title: '隐私政策',
              iconColor: Colors.orange,
              onTap: () => controller.showPrivacyPolicy(),
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
    required VoidCallback onTap,
    Color iconColor = Colors.blue,
  }) {
    return row.white.p16.children([
      icon.icon.s24.color(iconColor).mk,
      w12,
      text(title).f16.expanded.mk,
      Icons.chevron_right.icon.s24.grey.mk,
    ]).click(onTap: onTap);
  }
}