import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

import '../controllers/tags_controller.dart';

class TagsView extends GetView<TagsController> {
  const TagsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('标签').f18.mk,
        actions: [
          Icons.add.icon.s24.primary.p12.mk,
        ],
      ),
      body: Obx(() => listview.separated(const Divider()).builder(
            controller.tags.length,
            (context, index) {
              final tag = controller.tags[index];
              return row.p16.white.children([
                Icons.local_offer_outlined.icon.s24.orange.mk,
                w12,
                column.crossStart.expanded.children([
                  text(tag.name).f16.mk,
                  h4,
                  text('${tag.memberCount}个联系人').f14.grey.mk,
                ]),
              ]).click(
                onTap: () => Get.toNamed('/contacts/tag/${tag.id}'),
              );
            },
          )),
    );
  }
}
