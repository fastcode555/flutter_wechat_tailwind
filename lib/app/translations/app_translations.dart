import 'package:get/get.dart';
import 'en_US.dart';
import 'ja_JP.dart';
import 'ko_KR.dart';
import 'zh_CN.dart';
import 'zh_TW.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'ja_JP': jaJP,
    'ko_KR': koKR,
    'zh_CN': zhCN,
    'zh_TW': zhTW,
  };
} 