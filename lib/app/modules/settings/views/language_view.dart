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
        title: text('general_language'.tr).f18.mk,
      ),
      body: Obx(() => listview.separated12.builder(
            controller.languages.length,
            (context, index) {
              final language = controller.languages[index];
              final isSelected = controller.currentLanguage.value == language.code;

              return row.white.p16.children([
                text(language.name).f16.expanded.mk,
                if (isSelected) Icons.check.icon.s24.primary.mk,
              ]).click(
                onTap: () => controller.changeLanguage(language.code),
              );
            },
          )),
    );
  }
}
