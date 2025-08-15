import 'package:get/get.dart';

class SignInController extends GetxController {

  RxBool obscureValue = true.obs;

  void toggleObscure() {
    obscureValue.value = !obscureValue.value;
  }
}