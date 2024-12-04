import 'package:get/get.dart';
import '../controllers/groups_controller.dart';

class GroupsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupsController>(
      () => GroupsController(),
    );
  }
} 