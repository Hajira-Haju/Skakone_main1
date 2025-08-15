import 'package:get/get.dart';
import 'package:skakone/presentation/sign_in_screen/controller/signin_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
    // TODO: implement dependencies
  }
}
