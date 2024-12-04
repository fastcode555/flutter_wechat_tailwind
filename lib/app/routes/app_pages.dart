import 'package:flutter_wechat_tailwind/app/modules/chat/views/chat_group_view.dart';
import 'package:flutter_wechat_tailwind/app/modules/settings/bindings/about_binding.dart';
import 'package:flutter_wechat_tailwind/app/modules/settings/bindings/help_binding.dart';
import 'package:flutter_wechat_tailwind/app/modules/settings/bindings/storage_binding.dart';
import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_detail_view.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/contacts/bindings/contacts_binding.dart';
import '../modules/contacts/views/contact_detail_view.dart';
import '../modules/contacts/views/contacts_view.dart';
import '../modules/contacts/views/groups_view.dart';
import '../modules/contacts/views/new_friends_view.dart';
import '../modules/contacts/views/tags_view.dart';
import '../modules/discover/bindings/discover_binding.dart';
import '../modules/discover/views/discover_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/moments/bindings/moments_binding.dart';
import '../modules/moments/views/moments_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/settings/bindings/settings_bindings.dart';
import '../modules/settings/views/about_view.dart';
import '../modules/settings/views/account_security_view.dart';
import '../modules/settings/views/blacklist_view.dart';
import '../modules/settings/views/font_size_view.dart';
import '../modules/settings/views/help_view.dart';
import '../modules/settings/views/language_view.dart';
import '../modules/settings/views/notifications_view.dart';
import '../modules/settings/views/privacy_moments_view.dart';
import '../modules/settings/views/privacy_view.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/settings/views/storage_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    // 聊天相关
    GetPage(
      name: Routes.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.CHAT_DETAIL,
      page: () => const ChatDetailView(),
      binding: ChatBinding(),
    ),
    // 联系人相关
    GetPage(
      name: Routes.CONTACTS,
      page: () => const ContactsView(),
      binding: ContactsBinding(),
    ),
    GetPage(
      name: Routes.CONTACTS_DETAIL,
      page: () => const ContactDetailView(),
      binding: ContactsBinding(),
    ),
    GetPage(
      name: Routes.CONTACTS_NEW_FRIENDS,
      page: () => const NewFriendsView(),
      binding: ContactsBinding(),
    ),
    GetPage(
      name: Routes.CONTACTS_GROUPS,
      page: () => const GroupsView(),
      binding: ContactsBinding(),
    ),
    GetPage(
      name: Routes.CONTACTS_TAGS,
      page: () => const TagsView(),
      binding: ContactsBinding(),
    ),
    // 发现相关
    GetPage(
      name: Routes.DISCOVER,
      page: () => const DiscoverView(),
      binding: DiscoverBinding(),
    ),
    GetPage(
      name: Routes.MOMENTS,
      page: () => const MomentsView(),
      binding: MomentsBinding(),
    ),
    // 我的相关
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    // 设置相关
    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT_SECURITY,
      page: () => const AccountSecurityView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.PRIVACY,
      page: () => const PrivacyView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.PRIVACY_MOMENTS,
      page: () => const PrivacyMomentsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.PRIVACY_BLACKLIST,
      page: () => const BlacklistView(),
      binding: BlacklistBinding(),
    ),
    GetPage(
      name: Routes.GENERAL_LANGUAGE,
      page: () => const LanguageView(),
      binding: LanguageBinding(),
    ),
    GetPage(
      name: Routes.GENERAL_FONT_SIZE,
      page: () => const FontSizeView(),
      binding: FontSizeBinding(),
    ),

    GetPage(
      name: Routes.HELP,
      page: () => const HelpView(),
      binding: HelpBinding(),
    ),
    GetPage(
      name: Routes.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: Routes.GENERAL_STORAGE,
      page: () => const StorageView(),
      binding: StorageBinding(),
    ),
    GetPage(
      name: Routes.CHAT_GROUP,
      page: () => const ChatGroupView(),
      binding: ChatBinding(),
    ),
  ];
}
