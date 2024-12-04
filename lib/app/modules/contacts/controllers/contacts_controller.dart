import 'package:get/get.dart';

class ContactsController extends GetxController {
  final contactList = <ContactModel>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    loadContacts();
  }

  Future<void> loadContacts() async {
    await Future.delayed(const Duration(seconds: 1));
    final List<ContactModel> contacts = List.generate(
      20,
      (index) => ContactModel(
        id: index,
        name: 'Contact $index',
        avatar: '',
        pinyin: 'C',
      ),
    );
    
    // 按拼音排序
    contacts.sort((a, b) => a.pinyin.compareTo(b.pinyin));
    contactList.value = contacts;
  }
}

class ContactModel {
  final int id;
  final String name;
  final String avatar;
  final String pinyin;

  ContactModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.pinyin,
  });
} 