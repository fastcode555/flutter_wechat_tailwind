import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';
import '../controllers/language_controller.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('语言').f18.mk,
      ),
      body: SingleChildScrollView(
        child: column.children([
          _buildSection([
            Obx(() => column.children(
              controller.languages.map((lang) => _buildMenuItem(
                icon: Icons.language,
                title: lang.name,
                iconColor: Colors.blue,
                trailing: lang.code == controller.currentLanguage.value
                    ? Icons.check.icon.s24.primary.mk
                    : const SizedBox(),
                onTap: () => controller.changeLanguage(lang.code),
              )).toList(),
            )),
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
    required VoidCallback onTap,
    Color iconColor = Colors.blue,
  }) {
    return row.white.p16.children([
      icon.icon.s24.color(iconColor).mk,
      w12,
      text(title).f16.expanded.mk,
      trailing,
    ]).click(onTap: onTap);
  }
}
