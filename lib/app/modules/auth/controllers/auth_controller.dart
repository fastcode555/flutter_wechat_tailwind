import 'package:flutter_wechat_tailwind/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../data/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  
  final phoneNumber = ''.obs;
  final verificationCode = ''.obs;
  final isLoading = false.obs;
  final countdown = 0.obs;

  bool get canSendCode => 
    phoneNumber.value.length == 11 && countdown.value == 0 && !isLoading.value;

  bool get canLogin =>
    phoneNumber.value.length == 11 && 
    verificationCode.value.length == 6 && 
    !isLoading.value;

  void setPhoneNumber(String value) {
    phoneNumber.value = value;
  }

  void setVerificationCode(String value) {
    verificationCode.value = value;
  }

  Future<void> sendVerificationCode() async {
    if (!canSendCode) return;

    isLoading.value = true;
    try {
      // TODO: 实现发送验证码逻辑
      await Future.delayed(const Duration(seconds: 1)); // 模拟网络请求
      Get.snackbar('提示', '验证码已发送');
      
      // 开始倒计时
      countdown.value = 60;
      _startCountdown();
    } catch (e) {
      Get.snackbar('错误', '发送验证码失败');
    } finally {
      isLoading.value = false;
    }
  }

  void _startCountdown() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      countdown.value--;
      return countdown.value > 0;
    });
  }

  Future<void> login() async {
    if (!canLogin) return;

    isLoading.value = true;
    try {
      await _authService.login(phoneNumber.value, verificationCode.value);
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar('错误', '登录失败');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    countdown.value = 0;
    super.onClose();
  }
}
