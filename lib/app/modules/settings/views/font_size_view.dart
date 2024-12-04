import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

import '../controllers/font_size_controller.dart';

class FontSizeView extends GetView<FontSizeController> {
  const FontSizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('字体大小').f18.mk,
      ),
      body: SingleChildScrollView(
        child: column.children([
          // 预览区域
          container.white.p16.child(
            column.children([
              text('预览效果').f14.grey.mk,
              h16,
              Obx(() => text('这是聊天内容的预览文字').f(controller.currentSize.value).mk),
            ]),
          ),

          // 滑动条
          container.white.mt12.p16.child(
            column.children([
              row.spaceBetween.children([
                text('小').f14.grey.mk,
                text('标准').f14.grey.mk,
                text('大').f14.grey.mk,
              ]),
              h8,
              Obx(() => Slider(
                    value: controller.currentSize.value,
                    min: 12,
                    max: 24,
                    divisions: 6,
                    onChanged: controller.changeSize,
                  )),
            ]),
          ),

          // 当前大小
          container.white.mt12.p16.center.child(
            Obx(() => text('当前大小: ${controller.sizeLabel}').f14.grey.mk),
          ),
        ]),
      ),
    );
  }
}
