import 'package:flutter/material.dart';
import 'package:flutter_wechat_tailwind/app/common/consts.dart';
import 'package:get/get.dart';

class ChatDetailController extends GetxController {
  final textController = TextEditingController();
  final messages = <MessageModel>[].obs;
  final chatId = Get.parameters['id'] ?? '';
  final chatName = 'User ${Get.parameters['id'] ?? ''}'.obs;

  @override
  void onInit() {
    super.onInit();
    loadMessages();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  Future<void> loadMessages() async {
    // 模拟加载消息
    // await Future.delayed(const Duration(seconds: 1));
    messages.value = List.generate(
      20,
      (index) => MessageModel(
        id: index,
        content: 'Message $index',
        senderName: index % 2 == 0 ? 'Me' : 'User $chatId',
        avatar: index % 2 == 0 ? Consts.userAvatar : Consts.avatar,
        myAvatar: index % 2 == 0 ? Consts.userAvatar : Consts.avatar,
        isMe: index % 2 == 0,
        time: DateTime.now().subtract(Duration(minutes: index * 2)),
      ),
    );
  }

  void sendMessage() {
    if (textController.text.trim().isEmpty) return;

    messages.insert(
      0,
      MessageModel(
        id: messages.length,
        content: textController.text,
        senderName: 'Me',
        avatar: 'avatar_me',
        myAvatar:
            'https://image.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/7da7bd62-5763-4480-bb2a-117be0160322/width=450/00185-3178120287.jpeg',
        isMe: true,
        time: DateTime.now(),
      ),
    );

    textController.clear();
  }
}

class MessageModel {
  final int id;
  final String content;
  final String senderName;
  final String avatar;
  final String myAvatar;
  final bool isMe;
  final DateTime time;

  MessageModel({
    required this.id,
    required this.content,
    required this.senderName,
    required this.avatar,
    required this.myAvatar,
    required this.isMe,
    required this.time,
  });
}
