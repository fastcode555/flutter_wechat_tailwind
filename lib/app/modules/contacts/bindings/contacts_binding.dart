import 'package:flutter_wechat_tailwind/app/modules/contacts/controllers/contact_detail_controller.dart';
import 'package:flutter_wechat_tailwind/app/modules/contacts/controllers/groups_controller.dart';
import 'package:flutter_wechat_tailwind/app/modules/contacts/controllers/new_friends_controller.dart';
import 'package:get/get.dart';

import '../controllers/contacts_controller.dart';

class ContactsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactsController>(() => ContactsController());
    Get.lazyPut<NewFriendsController>(() => NewFriendsController());
    Get.lazyPut<GroupsController>(() => GroupsController());
    Get.lazyPut<ContactDetailController>(() => ContactDetailController());
  }
}
