import 'package:get/get.dart';

class GroupsController extends GetxController {
  final groups = <GroupModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadGroups();
  }

  Future<void> loadGroups() async {
    await Future.delayed(const Duration(seconds: 1));
    groups.value = List.generate(
      10,
      (index) => GroupModel(
        id: index.toString(),
        name: '群聊 $index',
        memberCount: 20 + index,
      ),
    );
  }
}

class GroupModel {
  final String id;
  final String name;
  final int memberCount;

  GroupModel({
    required this.id,
    required this.name,
    required this.memberCount,
  });
} 