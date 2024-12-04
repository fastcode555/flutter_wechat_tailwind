import 'package:flutter_wechat_tailwind/app/data/services/auth_service.dart';
import 'package:flutter_wechat_tailwind/app/data/services/contact_service.dart';
import 'package:flutter_wechat_tailwind/app/data/services/message_service.dart';
import 'package:flutter_wechat_tailwind/app/data/services/moment_service.dart';
import 'package:flutter_wechat_tailwind/app/modules/chat/controllers/chat_controller.dart';
import 'package:flutter_wechat_tailwind/app/modules/contacts/controllers/contacts_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ContactsController>(() => ContactsController());
    Get.lazyPut<ChatController>(() => ChatController());

    Get.lazyPut<MessageService>(() => MessageService());
    Get.lazyPut<MomentService>(() => MomentService());
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<ContactService>(() => ContactService());
  }
}
