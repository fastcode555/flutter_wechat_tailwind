import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:flutter_wechat_tailwind/app/common/consts.dart';
import 'package:get/get.dart';

import '../controllers/groups_controller.dart';

class GroupsView extends GetView<GroupsController> {
  const GroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('群聊').f18.mk,
        actions: [
          Icons.add.icon.s24.primary.p12.mk,
        ],
      ),
      body: SingleChildScrollView(
        child: column.children([
          // 搜索框
          container.grey100.p12.rounded8.child(
            row.children([
              Icons.search.icon.s24.grey.mk,
              w12,
              text('搜索群聊').f14.grey.expanded.mk,
            ]),
          ),

          // 群聊列表
          Obx(() => listview.separated12.shrinkWrap.neverScroll.builder(
                controller.groups.length,
                (context, index) {
                  final group = controller.groups[index];
                  return row.p16.white.children([
                    Consts.randomImage.image.circle.s40.mk,
                    w12,
                    column.crossStart.expanded.children([
                      text(group.name).f16.mk,
                      h4,
                      text('${group.memberCount}人').f14.grey.mk,
                    ]),
                  ]).click(
                    onTap: () => Get.toNamed('/chat/group/${group.id}'),
                  );
                },
              )),
        ]),
      ),
    );
  }
}
