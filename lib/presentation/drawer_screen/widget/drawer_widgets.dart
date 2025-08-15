import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../add_task/view/general_task.dart';
import '../../add_task/view/requirement_task.dart';
import '../../add_task/view/scheduled_task.dart';
import '../../add_task/view/support_task.dart';
import '../controller/drawer_controller.dart';

class DrawerWidgets {
  static Widget drawer(DrawersController controller) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 12,
                ),
                child: Image.asset('assets/logo_no_desc.png', width: 80),
              ),
            ),
            customDivider(),
            customListTile(
              title: 'Home',
              icon: Icons.home_outlined,
              isSelected: controller.selectedIndex.value == 0 ? true : false,
              onTap: () {
                controller.selectedIndex.value = 0;
                controller.key.currentState!.closeDrawer();
              },
            ),
            subHead('Management Report'),
            customListTile(
              title: 'Task Assigned report',
              icon: Icons.subject,
              isSelected: controller.selectedIndex.value == 1 ? true : false,
              onTap: () {
                controller.selectedIndex.value = 1;
                controller.key.currentState!.closeDrawer();
              },
            ),
            customListTile(
              title: 'Attendance sheet',
              icon: Icons.task_alt,
              isSelected: controller.selectedIndex.value == 2 ? true : false,
              onTap: () {
                controller.selectedIndex.value = 2;
                controller.key.currentState!.closeDrawer();
              },
            ),
            subHead('Leave'),
            customListTile(
              title: 'Apply Leave',
              icon: CupertinoIcons.add_circled,
              isSelected: controller.selectedIndex.value == 3 ? true : false,
              onTap: () {
                controller.selectedIndex.value = 3;
                controller.key.currentState!.closeDrawer();
              },
            ),
            customListTile(
              title: 'My leaves',
              icon: CupertinoIcons.list_number,
              isSelected: controller.selectedIndex.value == 4 ? true : false,
              onTap: () {
                controller.selectedIndex.value = 4;
                controller.key.currentState!.closeDrawer();
              },
            ),
            customListTile(
              title: 'Holiday calendar',
              icon: CupertinoIcons.calendar,
              isSelected: controller.selectedIndex.value == 5 ? true : false,
              onTap: () {
                controller.selectedIndex.value = 5;
                controller.key.currentState!.closeDrawer();
              },
            ),
            customListTile(
              title: 'Daily Attendance',
              icon: Icons.check_circle_outline,
              isSelected: controller.selectedIndex.value == 6,
              onTap: () {
                controller.selectedIndex.value = 6;
                controller.key.currentState!.closeDrawer();
              },
            ),

            subHead('Task Management'),
            customExpansionTile(
              title: 'Add Task',
              icon: Icons.add_task_outlined,
              children: [
                customListTile(
                  title: 'Requirement Task',
                  icon: Icons.assignment,
                  isSelected: false,
                  onTap: () {
                    Get.to(RequirementTask());
                    controller.key.currentState!.closeDrawer();
                  },
                ),
                customListTile(
                  title: 'Support Task',
                  icon: Icons.support_agent,
                  isSelected: false,
                  onTap: () {
                    Get.to(SupportTaskScreen());
                    // Implement navigation if screen exists
                    // Get.to(() => SupportTaskScreen());
                    controller.key.currentState!.closeDrawer();
                  },
                ),
                customListTile(
                  title: 'Scheduled Task',
                  icon: Icons.schedule,
                  isSelected: false,
                  onTap: () {
                    Get.to(ScheduledTaskScreen());
                    controller.key.currentState!.closeDrawer();
                  },
                ),
                customListTile(
                  title: 'General Task',
                  icon: Icons.work_outline,
                  isSelected: false,
                  onTap: () {
                    Get.to(GeneralTaskScreen());
                    // Implement navigation if screen exists
                    controller.key.currentState!.closeDrawer();
                  },
                ),
              ],
            ),
            customListTile(
              title: 'My Task',
              icon: Icons.task_outlined,
              isSelected: controller.selectedIndex.value == 7,
              onTap: () {
                controller.selectedIndex.value = 7;
                controller.key.currentState!.closeDrawer();
              },
            ),

            subHead('Sales Lead'),
            customListTile(
              title: 'Create New Lead',
              icon: CupertinoIcons.person_add,
              isSelected: controller.selectedIndex.value == 8 ? true : false,
              onTap: () {
                controller.selectedIndex.value = 8;
                controller.key.currentState!.closeDrawer();
              },
            ),
            customListTile(
              title: 'My Leads',
              icon: CupertinoIcons.person_2_square_stack,
              isSelected: controller.selectedIndex.value == 9 ? true : false,
              onTap: () {
                controller.selectedIndex.value = 9;
                controller.key.currentState!.closeDrawer();
              },
            ),
            customDivider(),
            customListTile(
              title: 'Locations',
              icon: CupertinoIcons.location_solid,
              isSelected: controller.selectedIndex.value == 10 ? true : false,
              onTap: () {
                controller.selectedIndex.value = 10;
                controller.key.currentState!.closeDrawer();
              },
            ),

          ],
        ),
      ),
    );
  }

  static Widget customListTile({
    required String title,
    required IconData icon,
    void Function()? onTap,
    bool isSelected = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        tileColor: isSelected ? Colors.grey.shade700 : Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        leading: Icon(icon, color: isSelected ? Colors.white : null),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: isSelected ? Colors.white : null,
          ),
        ),
        // splashColor: Colors.redAccent,
        // trailing: Icon(Icons.arrow_right),
        onTap: onTap,
      ),
    );
  }

  static Widget subHead(String head) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 10, bottom: 4),
      child: Text(
        head,
        style: TextStyle(
          color: Colors.grey.shade800,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static Widget customExpansionTile({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ExpansionTile(
        backgroundColor: Colors.black.withOpacity(0.1),
        title: Text(title),
        leading: Icon(icon),
        children: children,
      ),
    );
  }

  static Widget customDivider() {
    return Divider(thickness: .5);
  }
}
