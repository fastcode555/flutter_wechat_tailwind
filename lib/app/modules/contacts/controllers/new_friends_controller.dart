import 'package:flutter_wechat_tailwind/app/modules/contacts/models/new_friend_model.dart';
import 'package:get/get.dart';

class NewFriendsController extends GetxController {
  final newFriends = <NewFriendModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNewFriends();
  }

  Future<void> loadNewFriends() async {
    await Future.delayed(const Duration(seconds: 1));
    newFriends.value = List.generate(
      5,
      (index) => NewFriendModel(
        id: index,
        name: 'New Friend $index',
        message: '我是New Friend $index',
        isAccepted: index % 2 == 0,
      ),
    );
  }

  Future<void> acceptFriend(int id) async {
    final index = newFriends.indexWhere((friend) => friend.id == id);
    if (index != -1) {
      final friend = newFriends[index];
      newFriends[index] = NewFriendModel(
        id: friend.id,
        name: friend.name,
        message: friend.message,
        isAccepted: true,
      );
    }
  }
}
