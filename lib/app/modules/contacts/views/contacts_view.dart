import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:flutter_wechat_tailwind/app/common/consts.dart';
import 'package:flutter_wechat_tailwind/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/contacts_controller.dart';

class ContactsView extends GetView<ContactsController> {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('通讯录').f18.mk,
        actions: [
          Icons.person_add_outlined.icon.s24.primary.p12.mk,
        ],
      ),
      body: Obx(() => listview.separated12.builder(
            controller.contactList.length + 4, // 添加4个固定选项
            (context, index) {
              if (index == 0) {
                return _buildMenuItem(
                  icon: Icons.person_add,
                  title: '新的朋友',
                  iconColor: Colors.blue, // 新朋友用蓝色，表示社交
                  onTap: () => Get.toNamed(Routes.CONTACTS_NEW_FRIENDS),
                );
              } else if (index == 1) {
                return _buildMenuItem(
                  icon: Icons.group_add,
                  title: '群聊',
                  iconColor: Colors.green, // 群聊用绿色，表示群组
                  onTap: () => Get.toNamed(Routes.CONTACTS_GROUPS),
                );
              } else if (index == 2) {
                return _buildMenuItem(
                  icon: Icons.local_offer,
                  title: '标签',
                  iconColor: Colors.orange, // 标签用橙色，表示分类
                  onTap: () => Get.toNamed(Routes.CONTACTS_TAGS),
                );
              } else if (index == 3) {
                return _buildMenuItem(
                  icon: Icons.verified_user,
                  title: '公众号',
                  iconColor: Colors.purple, // 公众号用紫色，表示官方
                  onTap: () => Get.toNamed(Routes.CONTACTS_OFFICIAL_ACCOUNTS),
                );
              }

              final contact = controller.contactList[index - 4];
              final showHeader = index == 4 || contact.pinyin != controller.contactList[index - 5].pinyin;

              return column.children([
                if (showHeader) container.grey100.p8.wFull.child(text(contact.pinyin).f12.grey.mk),
                row.p16.white.children([
                  Consts.randomImage.image.circle.s40.mk,
                  w12,
                  text(contact.name).f16.expanded.mk,
                ]).click(
                  onTap: () => Get.toNamed('/contacts/detail/${contact.id}'),
                ),
              ]);
            },
          )),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = Colors.blue,
  }) {
    return row.white.p16.children([
      icon.icon.s24.color(iconColor).mk,
      w12,
      text(title).f16.expanded.mk,
    ]).click(onTap: onTap);
  }
}
