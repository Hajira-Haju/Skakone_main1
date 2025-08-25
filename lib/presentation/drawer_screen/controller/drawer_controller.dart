import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/apiClient/api_service/api_service.dart';
import '../../apply_leave_screen/apply_leave_screen.dart';
import '../../attendance_sheet/attendance_sheet.dart';
import '../../create_new_lead_screen/create_new_lead.dart';
import '../../daily_attendance/daily_attendance.dart';
import '../../holiday_calendar_screen/holiday_calendar_screen.dart';
import '../../my_leaves/my_leaves_screen.dart';
import '../../my_task_screen/my_task_screen.dart';
import '../../sales_lead/sales_lead_screen.dart';
import '../../task_assigned_report_screen/task_assigned_report_screen.dart';
import '../models/drawer_model.dart';

class DrawersController extends GetxController {
  final key = GlobalKey<ScaffoldState>();
  RxInt selectedIndex = 0.obs;
  RxList<DrawerModel> menuList = <DrawerModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMenu();
  }

  Future<void> fetchMenu() async {
    try {
      isLoading.value = true;

      // ✅ use the correct ApiService method
      final menus = await ApiService.fetchDrawerMenu();

      menuList.value = menus; // assign result
    } catch (e) {
      print("Drawer error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void onMenuTap(int index) {
    selectedIndex.value = index;
    key.currentState?.closeDrawer();
  }

  void onParentTap(int? menuId, String? title) {
    final t = (title ?? '').toLowerCase().trim();

    switch (t) {
      case 'management report':
      // optional: go to a landing page, or do nothing so users pick a submenu
        break;

      case 'leave':
      // maybe open a leave home page, or no-op
        break;

      case 'task management':
      // same idea
        break;

      case 'sales lead':
      // same idea
        break;

      default:
        Get.snackbar('Navigation', 'No screen wired for "$title"');
    }
  }

  void onSubTap({
    int? parentId,
    int? subId,
    String? subTitle,
    String? pageCode,
  }) {
    final s = (subTitle ?? '').toLowerCase().trim();

    switch (s) {
      case 'task assigned report':
        Get.to(() => TaskAssignedReportScreen());
        break;

      case 'attendance sheet':
        Get.to(() => AttendanceSheet());
        break;

      case 'apply leave':
        Get.to(() => ApplyLeaveScreen());
        break;

      case 'my leaves':
        Get.to(() => const MyLeaves());
        break;

      case 'holiday calendar':
        Get.to(() => HolidayCalendarScreen());

        break;

      case 'daily attendance':
        Get.to(() => const DailyAttendance());

        break;

    // case 'add task':
    // Get.to(() => const AddTaskLandingScreen());
    //
    //   break;

      case 'my task':
        Get.to(() => MyTaskScreen());

        break;

      case 'create new lead':
        Get.to(() => CreateLeadScreen());
        break;

      case 'my leads':
        Get.to(() => SalesLeadScreen());

        break;

      default:
        Get.snackbar('Navigation', 'No screen wired for "$subTitle"');
    }
  }
}

