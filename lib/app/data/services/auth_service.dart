import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AuthService extends GetxService {
  final _user = Rxn<UserModel>();

  UserModel? get user => _user.value;

  final _isLoggedIn = false.obs;

  bool get isLoggedIn => _isLoggedIn.value;

  @override
  void onInit() {
    super.onInit();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson != null) {
      _user.value = UserModel.fromJson(jsonDecode(userJson));
      _isLoggedIn.value = true;
    }
  }

  Future<void> login(String phone, String code) async {
    // TODO: 实现登录逻辑
    final user = UserModel(
      id: '1',
      name: '用户名',
      avatar: '',
      phone: phone,
      wxId: 'wxid_123456',
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(user.toJson()));

    _user.value = user;
    _isLoggedIn.value = true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    _user.value = null;
    _isLoggedIn.value = false;
  }
}
