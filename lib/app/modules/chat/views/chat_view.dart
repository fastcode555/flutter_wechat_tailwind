import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('微信').f18.mk,
        actions: [
          Icons.search.icon.s24.grey.p12.mk,
          Icons.add_circle_outline.icon.s24.primary.p12.mk,
        ],
      ),
      body: Obx(() => listview.separated12.builder(
            controller.chatList.length,
            (context, index) {
              final chat = controller.chatList[index];
              return row.white.p16.children([
                chat.avatar.isEmpty
                    ? container.s40.circle.grey200.center.child(
                        icon(Icons.person).s24.grey.mk,
                      )
                    : chat.avatar.image.circle.s40.mk,
                w12,
                column.crossStart.expanded.children([
                  text(chat.name).f16.bold.mk,
                  h4,
                  text(chat.lastMessage).f14.grey.maxLine1.ellipsis.mk,
                ]),
                w12,
                column.crossEnd.children([
                  text(chat.time.toString()).f12.grey.mk,
                  h4,
                  if (chat.unreadCount > 0)
                    container.s20.circle.red.center.child(text('${chat.unreadCount}').white.f12.bold.mk),
                ]),
              ]).click(
                onTap: () => Get.toNamed('/chat/detail/${chat.id}'),
              );
            },
          )),
    );
  }
}
