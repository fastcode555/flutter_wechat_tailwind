import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:flutter_wechat_tailwind/app/common/consts.dart';
import 'package:get/get.dart';

import '../controllers/contact_detail_controller.dart';

class ContactDetailView extends GetView<ContactDetailController> {
  const ContactDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('contacts_detail'.tr).f18.mk,
        actions: [
          Icons.more_horiz.icon.s24.grey.p12.mk,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 头像和基本信息
            row.p16.children([
              Consts.randomImage.image.circle.s60.mk,
              w16,
              column.crossStart.expanded.children([
                text(controller.contact.value.name).f18.bold.mk,
                h8,
                text('contacts_wechat_id'.tr.trParams({
                  'id': controller.contact.value.id,
                })).f14.grey.mk,
              ]),
              Icons.qr_code.icon.s24.primary.mk,
            ]),
            h12,

            // 操作按钮
            row.p16.children([
              Expanded(
                child: column.center.children([
                  Icons.message.icon.s24.primary.mk,
                  h8,
                  text('contacts_send_message'.tr).f14.mk,
                ]).click(onTap: () => controller.sendMessage()),
              ),
              Expanded(
                child: column.center.children([
                  Icons.videocam.icon.s24.primary.mk,
                  h8,
                  text('contacts_video_call'.tr).f14.mk,
                ]).click(onTap: () => controller.videoCall()),
              ),
            ]),
            h12,

            // 个人信息
            _buildSection([
              _buildInfoItem(
                title: 'contacts_remark'.tr,
                value: controller.contact.value.remark,
                onTap: () => controller.editRemark(),
              ),
              _buildInfoItem(
                title: 'contacts_region'.tr,
                value: controller.contact.value.region,
              ),
              _buildInfoItem(
                title: 'contacts_tags'.tr,
                value: controller.contact.value.tags.join(', '),
                onTap: () => controller.manageTags(),
              ),
            ]),

            // 社交信息
            _buildSection([
              _buildInfoItem(
                title: 'contacts_moments'.tr,
                showArrow: true,
                onTap: () => controller.viewMoments(),
              ),
            ]),

            // 更多操作
            _buildSection([
              _buildInfoItem(
                title: 'contacts_set_star'.tr,
                trailing: Obx(
                  () => Switch(
                    value: controller.isStarred.value,
                    onChanged: (value) => controller.toggleStar(),
                  ),
                ),
              ),
              _buildInfoItem(
                title: 'contacts_block'.tr,
                trailing: Obx(
                  () => Switch(
                    value: controller.isBlocked.value,
                    onChanged: (value) => controller.toggleBlock(),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(List<Widget> children) {
    return column.children([
      h12,
      ...children,
    ]);
  }

  Widget _buildInfoItem({
    required String title,
    String? value,
    bool showArrow = false,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return row.white.p16.children([
      text(title).f16.expanded.mk,
      if (value != null) text(value).f14.grey.mk,
      if (trailing != null) trailing,
      if (showArrow) Icons.chevron_right.icon.s24.grey.mk,
    ]).click(onTap: onTap);
  }
}
