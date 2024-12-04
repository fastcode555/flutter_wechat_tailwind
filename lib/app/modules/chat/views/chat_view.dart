import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:flutter_wechat_tailwind/app/common/extensions/datetime_extension.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('nav_wechat'.tr).f18.mk,
        actions: [
          Icons.add_circle_outline.icon.s24.grey.p12.mk,
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: text('loading'.tr).f16.grey.mk);
        }

        if (controller.chatList.isEmpty) {
          return Center(child: text('chat_no_messages'.tr).f16.grey.mk);
        }

        return listview.separated12.builder(
          controller.chatList.length,
          (context, index) {
            final chat = controller.chatList[index];
            return row.white.p16.children([
              chat.avatar.isEmpty
                  ? container.s48.circle.grey200.center.child(
                      Icons.person.icon.s24.grey.mk,
                    )
                  : chat.avatar.image.circle.s48.mk,
              w12,
              column.crossStart.expanded.children([
                text(chat.name).f16.mk,
                h4,
                text(chat.lastMessage).f14.grey.mk,
              ]),
              column.crossEnd.children([
                text(chat.time.timeAgo).f12.grey.mk,
                if (chat.unreadCount > 0)
                  container.mt4.s20.circle.red.center.child(
                    text(chat.unreadCount.toString()).f12.white.mk,
                  ),
              ]),
            ]).click(
              onTap: () => Get.toNamed('/chat/detail/${chat.id}'),
            );
          },
        );
      }),
    );
  }
}
