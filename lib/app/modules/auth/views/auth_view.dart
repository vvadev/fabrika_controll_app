import 'package:fabrika_controll_app/app/modules/auth/views/login_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  final authController = Get.put(AuthController());

  AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (authController.isLoading) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      } else if (authController.status == AuthStatus.authenticated) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offNamed(Routes.HOME);
        });
        return const Scaffold();
      } else {
        return LoginView();
      }
    });
  }
}
