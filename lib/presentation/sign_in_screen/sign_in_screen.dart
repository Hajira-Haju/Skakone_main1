import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skakone/presentation/sign_in_screen/controller/signin_controller.dart';
import 'package:skakone/presentation/sign_in_screen/widgets/sign_in_widget.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login_bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: double.infinity, height: 120),
              SignInWidget.head(),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SignInWidget.customField(
                  hintText: 'Username',
                  preIcon: Icons.person,
                ),
              ),
              SizedBox(height: 30),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SignInWidget.customField(
                    hintText: 'Password',
                    preIcon: Icons.fingerprint,
                    suffixIcon: InkWell(
                      onTap: controller.toggleObscure,
                      child: Icon(
                        controller.obscureValue.value
                            ? CupertinoIcons.eye_fill
                            : CupertinoIcons.eye_slash_fill,
                      ),
                    ),
                    obscureText: controller.obscureValue.value,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: SignInWidget.customButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
