import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  static const String _fontSizeKey = 'app_font_size';
  static const String _themeKey = 'app_theme';
  static const String _languageKey = 'app_language';

  final fontSize = 16.0.obs;
  final isDarkMode = false.obs;
  final language = 'zh_CN'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    fontSize.value = prefs.getDouble(_fontSizeKey) ?? 16.0;
    isDarkMode.value = prefs.getBool(_themeKey) ?? false;
    language.value = prefs.getString(_languageKey) ?? 'zh_CN';
  }

  Future<void> updateFontSize(double size) async {
    fontSize.value = size;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_fontSizeKey, size);
    Get.forceAppUpdate(); // 强制更新应用以应用新的字体大小
  }

  Future<void> toggleTheme() async {
    isDarkMode.value = !isDarkMode.value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> updateLanguage(String code) async {
    language.value = code;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, code);
    final locale = _getLocaleFromCode(code);
    Get.updateLocale(locale);
  }

  Locale _getLocaleFromCode(String code) {
    final parts = code.split('_');
    return Locale(parts[0], parts[1]);
  }
}
