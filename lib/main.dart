import 'package:fabrika_controll_app/app/core/theme/app_theme.dart';
import 'package:fabrika_controll_app/app/modules/auth/bindings/auth_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(DevicePreview(
      enabled: false,
      builder: (context) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.HOME,
          theme: appLightTheme,
          darkTheme: appDarkTheme,
          // themeMode: Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
          themeMode: ThemeMode.dark,
          defaultTransition: Transition.fade,
          initialBinding: AuthBinding(),
          getPages: AppPages.routes,
        );
      }));
}
