import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:flutter_wechat_tailwind/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/discover_controller.dart';

class DiscoverView extends GetView<DiscoverController> {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('发现').f18.mk,
      ),
      body: SingleChildScrollView(
        child: column.children([
          _buildMenuItem(
            icon: Icons.photo_camera_outlined,
            title: '朋友圈',
            iconColor: Colors.blue,
            onTap: () => Get.toNamed(Routes.MOMENTS),
          ),
          h12,
          _buildMenuItem(
            icon: Icons.qr_code_scanner_outlined,
            title: '扫一扫',
            iconColor: Colors.green,
            onTap: () => Get.toNamed(Routes.SCAN),
          ),
          h12,
          _buildMenuItem(
            icon: Icons.search_outlined,
            title: '搜一搜',
            iconColor: Colors.orange,
            onTap: () => Get.toNamed(Routes.SEARCH),
          ),
          h12,
          _buildMenuItem(
            icon: Icons.apps_outlined,
            title: '小程序',
            iconColor: Colors.purple,
            onTap: () => Get.toNamed(Routes.MINI_PROGRAMS),
          ),
        ]),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = Colors.blue,
  }) {
    return container.white.child(
      row.p16.children([
        icon.icon.s24.color(iconColor).mk,
        w12,
        text(title).f16.expanded.mk,
        Icons.chevron_right.icon.s24.grey.mk,
      ]),
    ).click(onTap: onTap);
  }
}
