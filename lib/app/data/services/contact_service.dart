import 'package:get/get.dart';
import '../models/contact_model.dart';

class ContactService extends GetxService {
  final _contacts = <ContactModel>[].obs;
  List<ContactModel> get contacts => _contacts;

  final _starredContacts = <ContactModel>[].obs;
  List<ContactModel> get starredContacts => _starredContacts;

  final _blockedContacts = <ContactModel>[].obs;
  List<ContactModel> get blockedContacts => _blockedContacts;

  @override
  void onInit() {
    super.onInit();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    // TODO: 从服务器加载联系人
    _contacts.value = [
      ContactModel(
        id: '1',
        name: '张三',
        avatar: '',
        wxId: 'zhangsan',
        pinyin: 'zhangsan',
      ),
      ContactModel(
        id: '2',
        name: '李四',
        avatar: '',
        wxId: 'lisi',
        pinyin: 'lisi',
      ),
    ];
    _updateLists();
  }

  void _updateLists() {
    _starredContacts.value = _contacts.where((c) => c.isStarred).toList();
    _blockedContacts.value = _contacts.where((c) => c.isBlocked).toList();
  }

  Future<void> addContact(ContactModel contact) async {
    // TODO: 添加联系人到服务器
    _contacts.add(contact);
    _updateLists();
  }

  Future<void> updateContact(ContactModel contact) async {
    // TODO: 更新服务器联系人信息
    final index = _contacts.indexWhere((c) => c.id == contact.id);
    if (index != -1) {
      _contacts[index] = contact;
      _updateLists();
    }
  }

  Future<void> toggleStar(String contactId) async {
    final index = _contacts.indexWhere((c) => c.id == contactId);
    if (index != -1) {
      final contact = _contacts[index];
      _contacts[index] = ContactModel(
        id: contact.id,
        name: contact.name,
        avatar: contact.avatar,
        wxId: contact.wxId,
        phone: contact.phone,
        pinyin: contact.pinyin,
        remark: contact.remark,
        isStarred: !contact.isStarred,
        isBlocked: contact.isBlocked,
      );
      _updateLists();
    }
  }

  Future<void> toggleBlock(String contactId) async {
    final index = _contacts.indexWhere((c) => c.id == contactId);
    if (index != -1) {
      final contact = _contacts[index];
      _contacts[index] = ContactModel(
        id: contact.id,
        name: contact.name,
        avatar: contact.avatar,
        wxId: contact.wxId,
        phone: contact.phone,
        pinyin: contact.pinyin,
        remark: contact.remark,
        isStarred: contact.isStarred,
        isBlocked: !contact.isBlocked,
      );
      _updateLists();
    }
  }
} 