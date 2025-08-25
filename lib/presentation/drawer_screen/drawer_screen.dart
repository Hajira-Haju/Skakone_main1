import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skakone/presentation/notification_screen/notification_screen.dart';
import '../../core/constants/const_data.dart';
import 'controller/drawer_controller.dart';
import 'models/drawer_page_list.dart';
import 'widget/drawer_widgets.dart';

class DrawerScreen extends GetView<DrawersController> {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.key,
      appBar: AppBar(
        backgroundColor: ConstData.prmClr,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => controller.key.currentState!.openDrawer(),
        ),
        title: Image.asset(
          'assets/logo_no_desc.png',
          width: 100,
          color: Colors.white,
        ),
        centerTitle: true,

        // 🔹 Notification Icon
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Get.to(() => const NotificationScreen());
            },
          ),
        ],
      ),
      drawer: DrawerWidgets.drawer(controller),
      body: Obx(() =>
      DrawerPageList.pages[controller.selectedIndex.value]),
    );
  }
}
