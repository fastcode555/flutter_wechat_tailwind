import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';
import '../controllers/storage_controller.dart';

class StorageView extends GetView<StorageController> {
  const StorageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('存储空间').f18.mk,
      ),
      body: SingleChildScrollView(
        child: column.children([
          // 存储概览
          container.white.p16.child(
            column.children([
              text('已使用空间').f14.grey.mk,
              h16,
              Obx(() => text(controller.totalUsage.value).f24.bold.mk),
              h8,
              LinearProgressIndicator(
                value: controller.usagePercentage,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
              ),
            ]),
          ),

          // 存储详情
          _buildSection([
            _buildMenuItem(
              icon: Icons.image,
              title: '聊天图片',
              subtitle: controller.imageUsage.value,
              iconColor: Colors.blue,
              onTap: () => controller.cleanImages(),
            ),
            h12,
            _buildMenuItem(
              icon: Icons.videocam,
              title: '聊天视频',
              subtitle: controller.videoUsage.value,
              iconColor: Colors.green,
              onTap: () => controller.cleanVideos(),
            ),
            h12,
            _buildMenuItem(
              icon: Icons.file_copy,
              title: '聊天文件',
              subtitle: controller.fileUsage.value,
              iconColor: Colors.orange,
              onTap: () => controller.cleanFiles(),
            ),
          ]),

          // 一键清理
          container.white.mt12.p16.center.child(
            '一键清理'.elevatedButton.red.click(
              onTap: () => controller.cleanAll(),
            ),
          ),
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