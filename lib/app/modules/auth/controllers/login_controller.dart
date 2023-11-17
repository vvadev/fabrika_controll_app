import 'package:get/get.dart';

class LoginController extends GetxController {
  final _email = ''.obs;
  get email => _email.value;
  set email(value) => _email.value = value;

  final _password = ''.obs;
  get password => _password.value;
  set password(value) => _password.value = value;

  final _isPasswordVisible = false.obs;
  get isPasswordVisible => _isPasswordVisible.value;
  set isPasswordVisible(value) => _isPasswordVisible.value = value;



}
