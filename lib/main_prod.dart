import 'package:fabrika_controll_app/app/core/theme/app_theme.dart';
import 'package:fabrika_controll_app/app/modules/home/bindings/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.HOME,
    theme: appLightTheme,
    darkTheme: appDarkTheme,
    themeMode: Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
    defaultTransition: Transition.fade,
    initialBinding: HomeBinding(),
    getPages: AppPages.routes,
  ));
}
