import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:skakone/routes/page_list/page_list.dart';

import '../../sign_in_screen/sign_in_screen.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  final LocalAuthentication auth = LocalAuthentication();
  RxString status = "Not Authenticated".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    navigate();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);

    controller.forward(); // Start the animation
    super.onInit();
  }

  Future<void> authenticate() async {
    try {
      bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to continue',
        options: const AuthenticationOptions(
          biometricOnly: false, // Allow PIN/Password too
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );

      status.value =
      didAuthenticate ? "Authenticated" : "Authentication Failed";
      if (didAuthenticate) {
        Get.offAllNamed(PageList.signInScreen);
      } else {
        Get.snackbar(
          'Error',
          'Authentication Failed',
          backgroundColor: Colors.orange,
        );
      }
    } on PlatformException catch (e) {
      status.value = "Error: $e";
      if (e.code == auth_error.notAvailable) {
        status.value = "No credentials, skipping authentication";
        Get.offAllNamed(PageList.signInScreen);
        return; // Stop execution here
      }
    }
  }

  void navigate() {
    Future.delayed(Duration(seconds: 3), () => authenticate());
  }

  @override
  void onClose() {
    controller.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
