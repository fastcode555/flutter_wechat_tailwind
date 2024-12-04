import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/consts.dart';

class ChatGroupController extends GetxController {
  final textController = TextEditingController();
  final messages = <GroupMessageModel>[].obs;
  final groupId = Get.parameters['id'] ?? '';
  final groupName = 'Group ${Get.parameters['id'] ?? ''}'.obs;
  final memberCount = 20.obs;

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
    await Future.delayed(const Duration(seconds: 1));
    messages.value = List.generate(
      20,
      (index) => GroupMessageModel(
        id: index,
        content: 'Message $index',
        senderName: index % 2 == 0 ? 'Me' : 'User $index',
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
      GroupMessageModel(
        id: messages.length,
        content: textController.text,
        senderName: 'Me',
        avatar: Consts.userAvatar,
        myAvatar: Consts.userAvatar,
        isMe: true,
        time: DateTime.now(),
      ),
    );

    textController.clear();
  }

  void showGroupInfo() {
    Get.toNamed('/chat/group/$groupId/info');
  }

  void addMember() {
    // TODO: 实现添加群成员
    Get.snackbar('提示', '添加群成员功能开发中');
  }

  void leaveGroup() {
    Get.dialog(
      AlertDialog(
        title: const Text('退出群聊'),
        content: const Text('确定要退出该群聊吗？'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.back(); // 返回聊天列表
              Get.snackbar('提示', '已退出群聊');
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }
}

class GroupMessageModel {
  final int id;
  final String content;
  final String senderName;
  final String avatar;
  final String myAvatar;
  final bool isMe;
  final DateTime time;

  GroupMessageModel({
    required this.id,
    required this.content,
    required this.senderName,
    required this.avatar,
    required this.myAvatar,
    required this.isMe,
    required this.time,
  });
} 