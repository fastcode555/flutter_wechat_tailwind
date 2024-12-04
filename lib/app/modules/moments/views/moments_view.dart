import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:flutter_wechat_tailwind/app/common/consts.dart';
import 'package:get/get.dart';

import '../controllers/moments_controller.dart';

class MomentsView extends GetView<MomentsController> {
  const MomentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 自定义AppBar
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: text('discover_moments'.tr).f18.white.mk,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Consts.randomImage.image.cover.mk,
                  container.black.opacity50.mk,
                ],
              ),
            ),
            actions: [
              Icons.camera_alt_outlined.icon.s24.white.p12.mk,
            ],
          ),

          // 朋友圈列表
          Obx(() => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final moment = controller.moments[index];
                    return column.children([
                      // 用户信息
                      row.p16.children([
                        Consts.randomImage.image.circle.s40.mk,
                        w12,
                        column.crossStart.expanded.children([
                          text(moment.userName).f16.bold.mk,
                          h4,
                          text(moment.content).f14.mk,
                        ]),
                      ]),

                      // 图片网格
                      if (moment.images.isNotEmpty)
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          children: moment.images
                              .map((url) => Image.network(
                                    url,
                                    fit: BoxFit.cover,
                                  ))
                              .toList(),
                        ),

                      // 底部操作栏
                      row.p16.spaceBetween.children([
                        text(moment.time).f12.grey.mk,
                        row.children([
                          Icons.thumb_up_outlined.icon.s20.primary.mk.click(
                            onTap: () => controller.likeMoment(moment.id),
                          ),
                          w16,
                          Icons.chat_bubble_outline.icon.s20.blue.mk.click(
                            onTap: () => controller.commentMoment(moment.id, ''),
                          ),
                        ]),
                      ]),
                      const Divider()
                    ]);
                  },
                  childCount: controller.moments.length,
                ),
              )),
        ],
      ),
    );
  }
}
