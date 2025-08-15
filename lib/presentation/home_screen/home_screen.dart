import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skakone/core/constants/const_data.dart';
import 'package:skakone/presentation/home_screen/controller/home_controller.dart';
import 'package:skakone/presentation/home_screen/models/home_data.dart';
import 'package:skakone/presentation/home_screen/widgets/home_widget.dart';
import 'package:skakone/presentation/profile_screen/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(width: double.infinity, height: 80),
            HomeWidgets.imageSlider(controller),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Welcome, Abraham',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Text(
                  //   'Welcome, Abraham',
                  //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  // ),
                  GestureDetector(
                    onTap: () {
                      Get.to(ProfileScreen());
                    },
                    child: CircleAvatar(child: Icon(Icons.person)),
                  ),
                ],
              ),
            ),
            HomeWidgets.thoughtOfTheDay(),
            SizedBox(height: 20),
            HomeWidgets.recentTabs(),
          ],
        ),
      ),
    );
  }
}
