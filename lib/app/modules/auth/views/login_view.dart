import 'package:email_validator/email_validator.dart';
import 'package:fabrika_controll_app/app/modules/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class LoginView extends GetView {
  final authController = Get.put(AuthController());
  final loginController = Get.put(LoginController());

  Future<void> _login() async {
    final loginStatus = await authController.createEmailSession(
        email: loginController.email, password: loginController.password);

    if (!loginStatus && authController.status == AuthStatus.unauthenticated) {
      Get.snackbar("Ошибка", authController.error.value,
          backgroundColor: Colors.redAccent);
    }
  }

  bool _validateData() {
    if (loginController.password.length < 8) {
      Get.snackbar(
          'Ошибка авторизации', 'Пароль должен быть не менее 8 символов');
      return false;
    }
    if (!EmailValidator.validate(loginController.email)) {
      Get.snackbar('Ошибка формы', 'Не правильный формат почты');
      return false;
    }
    return true;
  }

  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Авторизация',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 32),
          TextField(
            decoration: const InputDecoration(hintText: 'Email'),
            onChanged: (value) => loginController.email = value,
          ),
          const SizedBox(height: 16),
          Obx(
            () => TextField(
              decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                      onPressed: () => loginController.isPasswordVisible =
                          !loginController.isPasswordVisible,
                      icon: Icon(!loginController.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off))),
              obscureText: !loginController.isPasswordVisible,
              enableSuggestions: false,
              autocorrect: false,
              onChanged: (value) => loginController.password = value,
            ),
          ),
          const SizedBox(height: 32),
          FilledButton(
            onPressed: () {
              if (_validateData()) _login();
            },
            child: const Text('Войти'),
          ),
        ],
      ),
    ));
  }
}
