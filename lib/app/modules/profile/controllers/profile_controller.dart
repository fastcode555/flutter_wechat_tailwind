import 'package:flutter_wechat_tailwind/app/data/models/user_model.dart';
import 'package:get/get.dart';

import '../../../data/services/auth_service.dart';

class ProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final user = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    user.value = _authService.user;
  }

  Future<void> updateAvatar(String path) async {
    // TODO: 实现更新头像
  }

  Future<void> updateNickname(String nickname) async {
    // TODO: 实现更新昵称
  }

  Future<void> updateSignature(String signature) async {
    // TODO: 实现更新个性签名
  }

  Future<void> logout() async {
    await _authService.logout();
    Get.offAllNamed('/auth');
  }
}
