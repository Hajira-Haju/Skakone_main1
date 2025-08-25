import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/apiClient/api_service/api_service.dart';
import '../../../routes/page_list/page_list.dart';
import '../models/SignIn_Model.dart';

class SignInController extends GetxController {
  var obscureValue = true.obs;
  var isLoading = false.obs;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var signInResponse = SignInModel().obs;
  final storage = GetStorage();

  void toggleObscure() {
    obscureValue.value = !obscureValue.value;
  }

  Future<void> login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      _showSnackbar("Error", "Username & Password required");
      return;
    }

    isLoading.value = true;

    final response = await ApiService.login(
      username: usernameController.text.trim(),
      password: passwordController.text.trim(),
      deviceName: "John's Laptop",
      deviceOs: "Windows 11",
      model: "Dell XPS 15",
    );

    if (response != null) {
      signInResponse.value = response;

      if (response.isSuccess == true) {
        if (response.token != null && response.token!.isNotEmpty) {
          storage.write("token", response.token);
          print(" Token saved: ${response.token}");
        }

        Get.offAllNamed(PageList.drawerScreen);
      } else {
        _showSnackbar("Login Failed", response.message ?? "Login Failed");
      }
    } else {
      _showSnackbar("Error", "No response from server");
    }

    isLoading.value = false;
  }

  void _showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }
}
