import 'package:get/get.dart';
import '../models/message_model.dart';

class MessageService extends GetxService {
  final _messages = <MessageModel>[].obs;
  List<MessageModel> get messages => _messages;

  final _unreadCount = 0.obs;
  int get unreadCount => _unreadCount.value;

  @override
  void onInit() {
    super.onInit();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    // TODO: 从服务器加载消息
    _messages.value = [
      MessageModel(
        id: '1',
        senderId: '2',
        receiverId: '1',
        content: '你好',
        time: DateTime.now().subtract(const Duration(minutes: 5)),
        type: MessageType.text,
      ),
      MessageModel(
        id: '2',
        senderId: '1',
        receiverId: '2',
        content: '你好啊',
        time: DateTime.now(),
        type: MessageType.text,
      ),
    ];
    _updateUnreadCount();
  }

  void _updateUnreadCount() {
    _unreadCount.value = _messages.where((m) => !m.isRead).length;
  }

  Future<void> sendMessage(MessageModel message) async {
    // TODO: 发送消息到服务器
    _messages.add(message);
  }

  Future<void> markAsRead(String messageId) async {
    // TODO: 更新服务器消息状态
    final index = _messages.indexWhere((m) => m.id == messageId);
    if (index != -1) {
      final message = _messages[index];
      _messages[index] = MessageModel(
        id: message.id,
        senderId: message.senderId,
        receiverId: message.receiverId,
        content: message.content,
        time: message.time,
        type: message.type,
        isRead: true,
      );
      _updateUnreadCount();
    }
  }
} 