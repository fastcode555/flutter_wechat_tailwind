import 'package:get/get.dart';
import '../controllers/new_friends_controller.dart';

class NewFriendsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewFriendsController>(
      () => NewFriendsController(),
    );
  }
} 