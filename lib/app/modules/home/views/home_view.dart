import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

import '../../chat/views/chat_view.dart';
import '../../contacts/views/contacts_view.dart';
import '../../discover/views/discover_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: controller.currentIndex.value,
        children: const [
          ChatView(),
          ContactsView(),
          DiscoverView(),
          ProfileView(),
        ],
      )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        type: BottomNavigationBarType.fixed,
        onTap: controller.changePage,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_outlined),
            activeIcon: const Icon(Icons.chat),
            label: 'nav_wechat'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.contacts_outlined),
            activeIcon: const Icon(Icons.contacts),
            label: 'nav_contacts'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.explore_outlined),
            activeIcon: const Icon(Icons.explore),
            label: 'nav_discover'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person),
            label: 'nav_me'.tr,
          ),
        ],
      )),
    );
  }
}
