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
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.menuList.isEmpty) {
          return const Center(child: Text("No menu items"));
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
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

              // 🔹 Flat list: parent then its submenus (indented)
              ...controller.menuList.expand((menu) {
                final List<Widget> items = [];

                // Parent item
                items.add(
                  customListTile(
                    title: menu.menuTitle ?? "",
                    icon: MenuIcons.parent(menu.menuTitle),
                    isSelected: false,
                    onTap: () {
                      controller.key.currentState?.closeDrawer();
                      controller.onParentTap(menu.menuId, menu.menuTitle);
                    },
                  ),
                );

                // Submenus
                if (menu.mobileSubMenu != null &&
                    menu.mobileSubMenu!.isNotEmpty) {
                  items.addAll(
                    menu.mobileSubMenu!.map((sub) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: customListTile(
                          title: sub.subMenuName ?? "",
                          icon: MenuIcons.sub(
                            sub.pageCode,
                            fallbackTitle: sub.subMenuName,
                          ),
                          isSelected: false,
                          onTap: () {
                            controller.key.currentState?.closeDrawer();
                            controller.onSubTap(
                              parentId: menu.menuId,
                              subId: sub.subMenuId,
                              subTitle: sub.subMenuName,
                              pageCode:
                                  sub.pageCode, // may be null; safe to pass
                            );
                          },
                        ),
                      );
                    }).toList(),
                  );
                }

                return items;
              }).toList(),

              customDivider(),
            ],
          ),
        );
      }),
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

class MenuIcons {
  // Top-level menu icons (by menuTitle)
  static final Map<String, IconData> _parent = {
    'management report': Icons.assessment, // was subject/analytics
    'leave': Icons.beach_access,
    'task management': Icons.task_alt,
    'sales lead': Icons.trending_up,
    // add more if API returns other sections
  };

  // Submenu icons (by subMenuName)
  static final Map<String, IconData> _sub = {
    'task assigned report': Icons.subject,
    'attendance sheet': Icons.task_alt,
    'apply leave': Icons.add_circle_outline,
    'my leaves': Icons.list_alt,
    'holiday calendar': Icons.calendar_month,
    'daily attendance': Icons.check_circle_outline,
    'add task': Icons.add_task,
    'my task': Icons.task_outlined,
    'create new lead': Icons.person_add_alt,
    'my leads': Icons.people_alt_outlined,
  };

  static IconData parent(String? title) =>
      _parent[title?.toLowerCase().trim() ?? ''] ?? Icons.menu;

  static IconData sub(String? titleOrCode, {String? fallbackTitle}) {
    final key = (titleOrCode ?? fallbackTitle ?? '').toLowerCase().trim();
    return _sub[key] ?? Icons.circle;
  }
}
