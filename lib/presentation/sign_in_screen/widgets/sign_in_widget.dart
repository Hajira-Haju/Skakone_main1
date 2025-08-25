import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skakone/routes/page_list/page_list.dart';

class SignInWidget {
  static Widget head() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Hero(
            tag: 'logo',
            child: Image.asset('assets/logo_no_bg.png', width: 350),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back,',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              Text(
                'Make it work,make it right,make it fast.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget customField({
    required String hintText,
    required IconData preIcon,
    Widget? suffixIcon,
    bool obscureText = false,
    TextEditingController? controller,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20),
        prefixIcon: Icon(preIcon),
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      obscureText: obscureText,
      controller: controller,
    );
  }

  static Widget customButton({
    required VoidCallback onPressed,
    required String title,
    bool isLoading = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.black,
                disabledForegroundColor: Colors.white,
              ),
              onPressed: isLoading ? null : onPressed,
              child: isLoading
                  ? const SizedBox(
                height: 28,
                width: 28,
                child: SpinKitRipple(
                  color: Colors.white,
                  size: 40.0,
                )
              )
                  : Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
