import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:flutter_wechat_tailwind/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/general_controller.dart';

class GeneralView extends GetView<GeneralController> {
  const GeneralView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('通用').f18.mk,
      ),
      body: SingleChildScrollView(
        child: column.children([
          // 多语言
          _buildSection([
            _buildMenuItem(
              icon: Icons.language,
              title: '多语言',
              subtitle: '简体中文',
              iconColor: Colors.blue,
              onTap: () => Get.toNamed(Routes.GENERAL_LANGUAGE),
            ),
          ]),

          // 字体大小
          _buildSection([
            _buildMenuItem(
              icon: Icons.format_size,
              title: '字体大小',
              subtitle: '标准',
              iconColor: Colors.green,
              onTap: () => Get.toNamed(Routes.GENERAL_FONT_SIZE),
            ),
          ]),

          // 聊天
          _buildSection([
            _buildMenuItem(
              icon: Icons.wallpaper,
              title: '聊天背景',
              iconColor: Colors.purple,
              onTap: () => Get.toNamed(Routes.GENERAL_CHAT_BACKGROUND),
            ),
            h12,
            _buildMenuItem(
              icon: Icons.emoji_emotions,
              title: '表情管理',
              iconColor: Colors.amber,
              onTap: () => controller.manageEmojis(),
            ),
          ]),

          // 存储空间
          _buildSection([
            _buildMenuItem(
              icon: Icons.storage,
              title: '存储空间',
              subtitle: '2.1 GB',
              iconColor: Colors.orange,
              onTap: () => Get.toNamed(Routes.GENERAL_STORAGE),
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
}
