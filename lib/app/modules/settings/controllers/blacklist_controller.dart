import 'package:get/get.dart';
import '../../../data/services/contact_service.dart';

class BlacklistController extends GetxController {
  final ContactService _contactService = Get.find<ContactService>();
  
  final blacklist = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadBlacklist();
  }

  Future<void> _loadBlacklist() async {
    // 从联系人服务获取黑名单列表
    final blockedContacts = _contactService.blockedContacts;
    blacklist.value = blockedContacts.map((contact) => contact.name).toList();
  }

  Future<void> removeFromBlacklist(String name) async {
    // 找到对应的联系人并从黑名单移除
    final contact = _contactService.contacts.firstWhere((c) => c.name == name);
    await _contactService.toggleBlock(contact.id);
    blacklist.remove(name);
  }
} 