import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

import '../controllers/new_friends_controller.dart';

class NewFriendsView extends GetView<NewFriendsController> {
  const NewFriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('contacts_new_friends'.tr).f18.mk,
        actions: [
          Icons.person_add_outlined.icon.s24.primary.p12.mk,
        ],
      ),
      body: Obx(() {
        if (controller.newFriends.isEmpty) {
          return Center(child: text('contacts_no_new_friends'.tr).f16.grey.mk);
        }

        return listview.separated12.builder(
          controller.newFriends.length,
          (context, index) {
            final friend = controller.newFriends[index];
            return row.white.p16.children([
              friend.avatar.isEmpty
                  ? container.s48.circle.grey200.center.child(
                      Icons.person.icon.s24.grey.mk,
                    )
                  : friend.avatar.image.circle.s48.mk,
              w12,
              column.crossStart.expanded.children([
                text(friend.name).f16.mk,
                h4,
                text(friend.message).f14.grey.mk,
              ]),
              if (!friend.isAccepted)
                'contacts_accept'.tr.elevatedButton.white.click(
                      onTap: () => controller.acceptFriend(friend.id),
                    )
              else
                text('contacts_accepted'.tr).f14.grey.mk,
            ]);
          },
        );
      }),
    );
  }
}
