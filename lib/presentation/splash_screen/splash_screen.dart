import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: controller.animation,
          child: Hero (tag: 'logo', child: Image.asset('assets/logo_no_bg.png')),
        ),
      ),
    );
  }
}
