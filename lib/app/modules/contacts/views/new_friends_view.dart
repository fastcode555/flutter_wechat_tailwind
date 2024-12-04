import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:flutter_wechat_tailwind/app/common/consts.dart';
import 'package:get/get.dart';

import '../controllers/new_friends_controller.dart';

class NewFriendsView extends GetView<NewFriendsController> {
  const NewFriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('新的朋友').f18.mk,
        actions: [
          Icons.person_add.icon.s24.primary.p12.mk,
        ],
      ),
      body: column.children([
        // 搜索框
        container.white.p12.child(
          row.grey100.p12.children([
            Icons.search.icon.s24.grey.mk,
            w12,
            text('微信号/手机号').f14.grey.expanded.mk,
          ]),
        ),

        // 新朋友列表
        Obx(() => listview.separated12.neverScroll.shrinkWrap.builder(
              controller.newFriends.length,
              (context, index) {
                final friend = controller.newFriends[index];
                return row.p16.white.children([
                  Consts.randomImage.image.circle.s40.mk,
                  w12,
                  column.crossStart.expanded.children([
                    text(friend.name).f16.mk,
                    h4,
                    text(friend.message).f14.grey.mk,
                  ]),
                  text(friend.isAccepted ? '已添加' : '接受')
                      .f14
                      .color(friend.isAccepted ? Colors.grey : Colors.green)
                      .click(
                        onTap: friend.isAccepted ? null : () => controller.acceptFriend(friend.id),
                      ),
                ]);
              },
            )),
      ]),
    );
  }
}
