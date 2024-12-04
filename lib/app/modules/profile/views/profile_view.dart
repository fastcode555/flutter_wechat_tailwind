import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:flutter_wechat_tailwind/app/common/consts.dart';
import 'package:flutter_wechat_tailwind/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('我').f18.mk,
        actions: [
          Icons.settings_outlined.icon.s24.grey.p12.mk,
        ],
      ),
      body: SingleChildScrollView(
        child: column.children([
          // 个人信息卡片
          row.white.p16.children([
            Consts.userAvatar.image.circle.s55.mk,
            w16,
            column.crossStart.expanded.children([
              text('用户名').f18.bold.mk,
              h8,
              text('微信号: wxid_123').f14.grey.mk,
            ]),
            icon(Icons.qr_code).s24.grey.mk,
            w8,
            icon(Icons.chevron_right).s24.grey.mk,
          ]),

          h12,

          // 支付
          _buildMenuItem(
            icon: Icons.account_balance_wallet_outlined,
            title: '支付',
            iconColor: Colors.red,
            onTap: () => Get.toNamed(Routes.WALLET),
          ),
          h12,

          // 收藏和相册
          _buildMenuItem(
            icon: Icons.star_border_outlined,
            title: '收藏',
            iconColor: Colors.amber,
            onTap: () => Get.toNamed(Routes.FAVORITES),
          ),
          h12,
          _buildMenuItem(
            icon: Icons.photo_outlined,
            title: '相册',
            iconColor: Colors.blue,
            onTap: () => Get.toNamed(Routes.ALBUMS),
          ),
          h12,
          _buildMenuItem(
            icon: Icons.card_giftcard_outlined,
            title: '卡包',
            iconColor: Colors.orange,
            onTap: () => Get.toNamed(Routes.CARDS),
          ),
          h12,
          _buildMenuItem(
            icon: Icons.emoji_emotions_outlined,
            title: '表情',
            iconColor: Colors.yellow,
            onTap: () => Get.toNamed(Routes.STICKERS),
          ),
          h12,

          // 设置
          _buildMenuItem(
            icon: Icons.settings_outlined,
            title: '设置',
            iconColor: Colors.grey,
            onTap: () => Get.toNamed(Routes.SETTINGS),
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
    return row.white.p16.children([
      icon.icon.s24.color(iconColor).mk,
      w12,
      text(title).f16.expanded.mk,
      Icons.chevron_right.icon.s24.grey.mk,
    ]).click(onTap: onTap);
  }
}
