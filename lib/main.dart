import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/themes/app_theme.dart';
import 'app/translations/app_translations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Tailwind.instance.init(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'WeChat',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          locale: const Locale('zh', 'CN'),
          fallbackLocale: const Locale('en', 'US'),
          translations: AppTranslation(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
