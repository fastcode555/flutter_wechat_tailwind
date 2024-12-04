import 'package:get/get.dart';

class DiscoverController extends GetxController {
  final hasNewMoments = false.obs;
  final hasNewMiniPrograms = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkUpdates();
  }

  Future<void> _checkUpdates() async {
    // TODO: 检查朋友圈和小程序更新
    await Future.delayed(const Duration(seconds: 1));
    hasNewMoments.value = true;
    hasNewMiniPrograms.value = false;
  }

  void clearMomentsUpdate() {
    hasNewMoments.value = false;
  }

  void clearMiniProgramsUpdate() {
    hasNewMiniPrograms.value = false;
  }
} 