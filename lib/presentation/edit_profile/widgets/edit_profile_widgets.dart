import 'package:flutter/material.dart';

class EditProfileWidgets {
  static Widget buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    IconData? suffixIcon,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        obscureText: obscureText,

        style: const TextStyle(color: Colors.black),

        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),

          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black54),


          prefixIcon: Icon(icon, color: const Color(0xFFCA4842)),
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: Colors.grey)
              : null,


          filled: true,
          fillColor: Colors.white,

          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
