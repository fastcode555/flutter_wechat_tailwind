import 'package:flutter_wechat_tailwind/app/controllers/app_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontSizeController extends GetxController {
  static const String _fontSizeKey = 'font_size';
  static const double _defaultSize = 16.0;

  final currentSize = _defaultSize.obs;

  @override
  void onInit() {
    super.onInit();
    _loadFontSize();
  }

  Future<void> _loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    currentSize.value = prefs.getDouble(_fontSizeKey) ?? _defaultSize;
  }

  Future<void> changeSize(double size) async {
    currentSize.value = size;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_fontSizeKey, size);

    // 通知应用更新字体大小
    Get.find<AppController>().updateFontSize(size);
  }

  String get sizeLabel {
    if (currentSize.value <= 14) return '小';
    if (currentSize.value >= 18) return '大';
    return '标准';
  }
}
