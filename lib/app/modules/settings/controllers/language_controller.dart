import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  static const String _languageKey = 'language';

  final currentLanguage = 'zh_CN'.obs;

  final languages = [
    LanguageModel(code: 'zh_CN', name: '简体中文'),
    LanguageModel(code: 'zh_TW', name: '繁體中文'),
    LanguageModel(code: 'en_US', name: 'English'),
    LanguageModel(code: 'ja_JP', name: '日本語'),
    LanguageModel(code: 'ko_KR', name: '한국어'),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    currentLanguage.value = prefs.getString(_languageKey) ?? 'zh_CN';
  }

  Future<void> changeLanguage(String code) async {
    currentLanguage.value = code;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, code);

    // 更新应用语言
    final locale = _getLocaleFromCode(code);
    Get.updateLocale(locale);
  }

  Locale _getLocaleFromCode(String code) {
    final parts = code.split('_');
    return Locale(parts[0], parts[1]);
  }
}

class LanguageModel {
  final String code;
  final String name;

  LanguageModel({
    required this.code,
    required this.name,
  });
}
