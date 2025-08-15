import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:skakone/presentation/daily_attendance/daily_attendance.dart';
import 'package:skakone/routes/app_routes/app_routes.dart';
import 'package:skakone/routes/page_list/page_list.dart';
import 'package:skakone/tst.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SkakOne',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      initialRoute: PageList.splashScreen,
      // home: DailyAttendance(),
    );
  }
}
