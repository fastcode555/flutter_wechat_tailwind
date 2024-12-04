import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

import '../controllers/account_security_controller.dart';

class AccountSecurityView extends GetView<AccountSecurityController> {
  const AccountSecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('账号与安全').f18.mk,
      ),
      body: SingleChildScrollView(
        child: column.children([
          // 微信号和手机号
          _buildSection([
            _buildMenuItem(
              icon: Icons.account_circle,
              title: '微信号',
              subtitle: controller.account.value.wxId,
              iconColor: Colors.blue,
              showArrow: false,
            ),
            h12,
            _buildMenuItem(
              icon: Icons.phone_android,
              title: '手机号',
              subtitle: controller.account.value.phone,
              iconColor: Colors.green,
              onTap: () => controller.changePhone(),
            ),
          ]),

          // 账号保护
          _buildSection([
            _buildMenuItem(
              icon: Icons.security,
              title: '账号保护',
              subtitle: '已开启',
              iconColor: Colors.orange,
              onTap: () => controller.manageProtection(),
            ),
          ]),

          // 登录设备管理
          _buildSection([
            _buildMenuItem(
              icon: Icons.devices,
              title: '登录设备管理',
              subtitle: '1台设备',
              iconColor: Colors.purple,
              onTap: () => controller.manageDevices(),
            ),
          ]),

          // 更多安全设置
          _buildSection([
            _buildMenuItem(
              icon: Icons.lock,
              title: '微信密码',
              iconColor: Colors.red,
              onTap: () => controller.changePassword(),
            ),
            h12,
            _buildMenuItem(
              icon: Icons.mic,
              title: '声音锁',
              iconColor: Colors.amber,
              onTap: () => controller.voiceLock(),
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
    VoidCallback? onTap,
    Color iconColor = Colors.blue,
    bool showArrow = true,
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
      if (showArrow) Icons.chevron_right.icon.s24.grey.mk,
    ]).click(onTap: onTap);
  }
}
