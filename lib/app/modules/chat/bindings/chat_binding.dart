import 'package:flutter_wechat_tailwind/app/modules/contacts/controllers/groups_controller.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';
import '../controllers/chat_detail_controller.dart';
import '../controllers/chat_group_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<ChatDetailController>(() => ChatDetailController());
    Get.lazyPut<ChatGroupController>(() => ChatGroupController());
    Get.lazyPut<GroupsController>(() => GroupsController());
  }
}
