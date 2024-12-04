import 'package:get/get.dart';

class AccountSecurityController extends GetxController {
  final account = AccountModel(
    wxId: 'wxid_123456',
    phone: '+86 138****8888',
  ).obs;

  void changePhone() {
    // TODO: 实现修改手机号
  }

  void manageProtection() {
    // TODO: 实现账号保护管理
  }

  void manageDevices() {
    // TODO: 实现设备管理
  }

  void changePassword() {
    // TODO: 实现修改密码
  }

  void voiceLock() {
    // TODO: 实现声音锁
  }
}

class AccountModel {
  final String wxId;
  final String phone;

  AccountModel({
    required this.wxId,
    required this.phone,
  });
} 