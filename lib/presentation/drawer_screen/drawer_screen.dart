import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skakone/core/constants/const_data.dart';
import 'package:skakone/presentation/drawer_screen/models/drawer_page_list.dart';
import 'package:skakone/presentation/drawer_screen/widget/drawer_widgets.dart';
import 'package:skakone/presentation/home_screen/home_screen.dart';
import '../my_leaves/my_leaves_screen.dart';
import '../notification_screen/notification_screen.dart';
import '../task_assigned_report_screen/task_assigned_report_screen.dart';
import 'controller/drawer_controller.dart';

class DrawerScreen extends GetView<DrawersController> {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.key,
      appBar: AppBar(
        backgroundColor: ConstData.prmClr,
        leading: InkWell(
          onTap: () => controller.key.currentState!.openDrawer(),
          child: Icon(Icons.menu, color: Colors.white),
        ),
        title: Image.asset(
          'assets/logo_no_desc.png',
          width: 100,
          color: Colors.white,
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Get.to(NotificationScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.notifications, color: Colors.white),
            ),
          ),
        ],
      ),
      drawer: Obx(() => DrawerWidgets.drawer(controller)),
      body: Obx(() => DrawerPageList.pages[controller.selectedIndex.value]),
    );
  }
}
