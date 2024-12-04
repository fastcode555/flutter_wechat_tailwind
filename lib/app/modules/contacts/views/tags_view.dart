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
        title: text('contacts_tags'.tr).f18.mk,
        actions: [
          Icons.add.icon.s24.primary.p12.mk,
        ],
      ),
      body: Obx(() {
        if (controller.tags.isEmpty) {
          return Center(child:text('contacts_no_tags'.tr).f16.grey.mk);
        }

        return listview.separated12.builder(
          controller.tags.length,
          (context, index) {
            final tag = controller.tags[index];
            return row.white.p16.children([
              Icons.local_offer_outlined.icon.s24.orange.mk,
              w12,
              column.crossStart.expanded.children([
                text(tag.name).f16.mk,
                h4,
                text('${tag.memberCount} ${'contacts_tag_members'.tr}').f14.grey.mk,
              ]),
            ]).click(
              onTap: () => Get.toNamed('/contacts/tag/${tag.id}'),
            );
          },
        );
      }),
    );
  }
}
