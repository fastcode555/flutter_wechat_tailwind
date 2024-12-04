import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:flutter_wechat_tailwind/app/modules/settings/controllers/blacklist_controller.dart';
import 'package:get/get.dart';

class BlacklistView extends GetView<BlacklistController> {
  const BlacklistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('黑名单').f18.mk,
      ),
      body: Obx(() => controller.blacklist.isEmpty
          ? Center(
              child: column.center.children([
                icon(Icons.block).s48.grey.mk,
                h16,
                text('暂无黑名单').f16.grey.mk,
              ]),
            )
          : SingleChildScrollView(
              child: column.children(
                controller.blacklist
                    .map((user) => column.children([
                          row.white.p16.children([
                            text(user.substring(0, 1)).f16.mk,
                            w12,
                            text(user).f16.expanded.mk,
                            text('移出黑名单').f14.red.click(
                                  onTap: () => controller.removeFromBlacklist(user),
                                ),
                          ]),
                          h12,
                        ]))
                    .toList(),
              ),
            )),
    );
  }
}
