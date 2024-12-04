import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

import '../controllers/help_controller.dart';

class HelpView extends GetView<HelpController> {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('帮助与反馈').f18.mk,
      ),
      body: SingleChildScrollView(
        child: column.children([
          _buildSection([
            _buildMenuItem(
              icon: Icons.help_outline,
              title: '常见问题',
              iconColor: Colors.blue,
              onTap: () => controller.showFAQ(),
            ),
          ]),
          _buildSection([
            _buildMenuItem(
              icon: Icons.feedback_outlined,
              title: '意见反馈',
              iconColor: Colors.green,
              onTap: () => controller.showFeedback(),
            ),
          ]),
          _buildSection([
            _buildMenuItem(
              icon: Icons.support_agent,
              title: '在线客服',
              iconColor: Colors.orange,
              onTap: () => controller.contactSupport(),
            ),
          ]),
          _buildSection([
            _buildMenuItem(
              icon: Icons.report_problem_outlined,
              title: '投诉',
              iconColor: Colors.red,
              onTap: () => controller.showComplaint(),
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
