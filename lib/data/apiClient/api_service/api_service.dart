import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../presentation/drawer_screen/models/drawer_model.dart';
import '../../../presentation/sign_in_screen/models/SignIn_Model.dart';
import '../api_list/api_list.dart';

class ApiService {
  /// ✅ Login API
  static Future<SignInModel?> login({
    required String username,
    required String password,
    required String deviceName,
    required String deviceOs,
    required String model,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiList.login),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode({
          "username": username,
          "password": password,
          "deviceName": deviceName,
          "deviceOs": deviceOs,
          "model": model,
        }),
      );

      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return SignInModel.fromJson(responseData);
    } catch (e) {
      return SignInModel(
        isSuccess: false,
        message: "Error: $e",
      );
    }
  }

  static Future<List<DrawerModel>> fetchDrawerMenu() async {
    try {
      final storage = GetStorage();
      final token = storage.read("token");

      final response = await http.get(
        Uri.parse(ApiList.menuList),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      print("Drawer API Status: ${response.statusCode}");
      print("Drawer API Body: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData.map((json) => DrawerModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load drawer menu: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching drawer menu: $e");
      return [];
    }
  }
}
