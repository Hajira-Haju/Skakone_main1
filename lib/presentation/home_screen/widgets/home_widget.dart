import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:skakone/presentation/home_screen/controller/home_controller.dart';

import '../models/home_data.dart';

class HomeWidgets {
  static Widget imageSlider(HomeController controller) {
    return Obx(
      () => AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        transitionBuilder:
            (child, animation) =>
                FadeTransition(opacity: animation, child: child),
        child: SvgPicture.asset(
          key: ValueKey(controller.currentIndex.value),
          HomeData.images[controller.currentIndex.value],
          width: 300,
          height: 200,
        ),
      ),
    );
  }

  static Widget thoughtOfTheDay() {
    return  Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: double.infinity),
            Text(
              'Thought For The Day',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: 18,
              ),
            ),
            Text(
              "Don't watch the clock; do what it does. Keep going.",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Sam Levenson',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  static Widget recentTabs() {
    return Column(children: [ Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Recent Opens',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    ),
      GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 60,
        ),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Icon(Icons.check),
                ),
                Text('My Task'),
              ],
            ),
          );
        },
      ),],);
  }
}
