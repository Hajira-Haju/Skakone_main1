import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skakone/core/constants/const_data.dart';
import 'package:skakone/presentation/attendance_sheet/widgets/attendance_widgets.dart';
import 'controller/attendance_controller.dart';

class AttendanceSheet extends StatelessWidget {
  final AttendanceController controller = Get.put(AttendanceController());

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      controller.selectedDate.value = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Column(
        children: [
          AttendanceWidget.filterBar(context, controller, () => pickDate(context)),
          AttendanceWidget.tableHeader(),
          Expanded(
            child: controller.filteredData.isNotEmpty
                ? ListView.builder(
              itemCount: controller.filteredData.length,
              itemBuilder: (context, index) =>
                  AttendanceWidget.attendanceRow(
                      controller.filteredData[index], controller),
            )
                : const Center(child: Text("No data found")),
          ),
        ],
      )),
    );
  }
}
