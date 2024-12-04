import 'package:get/get.dart';

import '../../../data/services/message_service.dart';

class ChatController extends GetxController {
  final MessageService _messageService = Get.find<MessageService>();

  final chatList = <ChatModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadChats();
  }

  Future<void> _loadChats() async {
    isLoading.value = true;
    try {
      // TODO: 从服务器加载聊天列表
      await Future.delayed(const Duration(seconds: 1));
      chatList.value = [
        ChatModel(
          id: '1',
          name: '张三',
          avatar: 'https://gd-hbimg.huaban.com/5c1d5c1d144116ca3ce033c949ae0a96e2e2b98e474c5-tEGCOm',
          lastMessage: '你好',
          time: DateTime.now().subtract(const Duration(minutes: 5)),
          unreadCount: 1,
        ),
        ChatModel(
          id: '2',
          name: '李四',
          avatar: 'https://gd-hbimg.huaban.com/89dcccffe17ab56b700c1363d00b2b8399a48b564b78b-9Km1PM',
          lastMessage: '在吗？',
          time: DateTime.now(),
          unreadCount: 2,
        ),
      ];
    } finally {
      isLoading.value = false;
    }
  }

  void deleteChat(String chatId) {
    chatList.removeWhere((chat) => chat.id == chatId);
  }

  void pinChat(String chatId) {
    final index = chatList.indexWhere((chat) => chat.id == chatId);
    if (index != -1) {
      final chat = chatList[index];
      chatList.removeAt(index);
      chatList.insert(0, chat.copyWith(isPinned: !chat.isPinned));
    }
  }
}

class ChatModel {
  final String id;
  final String name;
  final String avatar;
  final String lastMessage;
  final DateTime time;
  final int unreadCount;
  final bool isPinned;

  ChatModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    this.isPinned = false,
  });

  ChatModel copyWith({bool? isPinned}) {
    return ChatModel(
      id: id,
      name: name,
      avatar: avatar,
      lastMessage: lastMessage,
      time: time,
      unreadCount: unreadCount,
      isPinned: isPinned ?? this.isPinned,
    );
  }
}
