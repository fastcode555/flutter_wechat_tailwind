import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

import '../controllers/groups_controller.dart';

class GroupsView extends GetView<GroupsController> {
  const GroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('contacts_group_chats'.tr).f18.mk,
        actions: [
          Icons.group_add.icon.s24.primary.p12.mk,
        ],
      ),
      body: Obx(() {
        if (controller.groups.isEmpty) {
          return Center(child:text('contacts_no_groups'.tr).f16.grey.mk);
        }

        return listview.separated12.builder(
          controller.groups.length,
          (context, index) {
            final group = controller.groups[index];
            return row.white.p16.children([
              container.s48.circle.grey200.center.child(
                Icons.group.icon.s24.grey.mk,
              ),
              w12,
              column.crossStart.expanded.children([
                text(group.name).f16.mk,
                h4,
                text('${group.memberCount} ${'contacts_group_members'.tr}').f14.grey.mk,
              ]),
            ]).click(
              onTap: () => Get.toNamed('/chat/group/${group.id}'),
            );
          },
        );
      }),
    );
  }
}
