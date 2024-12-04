import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';
import '../controllers/chat_group_controller.dart';

class ChatGroupView extends GetView<ChatGroupController> {
  const ChatGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text(controller.groupName.value).f18.center.mk,
        actions: [
          Icons.more_horiz.icon.s24.grey.p12.mk,
        ],
      ),
      body: column.children([
        Expanded(
          child: Obx(() => listview.reverse.builder(
            controller.messages.length,
            (context, index) {
              final message = controller.messages[index];
              return GroupMessageBubble(message: message);
            },
          )),
        ),
        container.white.child(
          row.p16.children([
            Icons.emoji_emotions_outlined.icon.s24.amber.mk,
            w12,
            Expanded(
              child: TextField(
                controller: controller.textController,
                decoration: InputDecoration(
                  hintText: '发送消息',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              ),
            ),
            w12,
            Icons.add_circle_outline.icon.s24.primary.mk,
            w12,
            '发送'.elevatedButton.white.click(onTap: controller.sendMessage),
          ]),
        ),
      ]),
    );
  }
}

class GroupMessageBubble extends StatelessWidget {
  final GroupMessageModel message;

  const GroupMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;

    return row.p8.crossStart.children([
      if (!isMe) ...[
        message.avatar.isEmpty
            ? container.s40.circle.grey200.center.child(
                Icons.person.icon.s24.grey.mk,
              )
            : message.avatar.image.circle.s40.mk,
        w8,
      ],
      column.crossStart.expanded.children([
        if (!isMe) text(message.senderName).f12.grey.mk,
        if (!isMe) container.rounded16.p12.grey200.child(text(message.content).f14.mk),
        if (isMe)
          Align(
            alignment: Alignment.centerRight,
            child: container.rounded16.p12.primary.child(
              text(message.content).white.f14.mk,
            ),
          ),
      ]),
      if (isMe) ...[
        w8,
        message.myAvatar.isEmpty
            ? container.s40.circle.grey200.center.child(
                Icons.person.icon.s24.grey.mk,
              )
            : message.myAvatar.image.circle.s40.mk,
      ],
    ]);
  }
} 