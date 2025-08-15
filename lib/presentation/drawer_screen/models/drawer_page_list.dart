import 'package:flutter/cupertino.dart';
import 'package:skakone/presentation/apply_leave_screen/apply_leave_screen.dart';
import 'package:skakone/presentation/attendance_sheet/attendance_sheet.dart';
import 'package:skakone/presentation/create_new_lead_screen/create_new_lead.dart';
import 'package:skakone/presentation/holiday_calendar_screen/holiday_calendar_screen.dart';
import 'package:skakone/presentation/home_screen/home_screen.dart';
import 'package:skakone/presentation/locations_screen/locations_screen.dart';
import 'package:skakone/presentation/my_leaves/my_leaves_screen.dart';
import 'package:skakone/presentation/my_task_screen/my_task_screen.dart';
import 'package:skakone/presentation/sales_lead/sales_lead_screen.dart';
import 'package:skakone/presentation/task_assigned_report_screen/task_assigned_report_screen.dart';

import '../../daily_attendance/daily_attendance.dart';

class DrawerPageList {
  static List<Widget> pages = [
    HomeScreen(),
    TaskAssignedReportScreen(),
    AttendanceSheet(),
    ApplyLeaveScreen(),
    MyLeaves(),
    HolidayCalendarScreen(),
    DailyAttendance(),
    MyTaskScreen(),
    CreateLeadScreen(),
    SalesLeadScreen(),
    LocationsScreen(),
  ];
}