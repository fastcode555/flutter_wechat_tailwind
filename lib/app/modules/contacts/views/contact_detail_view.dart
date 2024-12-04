import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:flutter_wechat_tailwind/app/common/consts.dart';
import 'package:get/get.dart';

import '../controllers/contact_detail_controller.dart';

class ContactDetailView extends GetView<ContactDetailController> {
  const ContactDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('联系人信息').f18.mk,
        actions: [
          Icons.more_horiz.icon.s24.grey.p12.mk,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 头像和基本信息
            row.p16.children([
              Consts.randomImage.image.circle.s60.mk,
              w16,
              column.crossStart.expanded.children([
                text(controller.contact.value.name).f18.bold.mk,
                h8,
                text('微信号: ${controller.contact.value.id}').f14.grey.mk,
              ]),
              Icons.qr_code.icon.s24.primary.mk,
            ]),
            h12,

            // 操作按钮
            row.p16.spaceEvenly.children([
              column.center.children([
                Icons.chat_bubble_outline.icon.s32.primary.mk,
                h8,
                text('发消息').f14.mk,
              ]).click(
                onTap: () => Get.toNamed('/chat/detail/${controller.contact.value.id}'),
              ),
              column.center.children([
                Icons.videocam_outlined.icon.s32.blue.mk,
                h8,
                text('视频通话').f14.mk,
              ]),
            ]),
            h12,
            // 朋友圈
            row.white.p16.children([
              text('朋友圈').f16.expanded.mk,
              Icons.chevron_right.icon.s24.grey.mk,
            ]).click(onTap: () {}),
            h12,
            // 更多信息
            row.white.p16.children([
              text('更多信息').f16.expanded.mk,
              Icons.chevron_right.icon.s24.grey.mk,
            ]).click(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
