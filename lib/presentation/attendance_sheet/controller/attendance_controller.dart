import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/sales_lead_data.dart';

class AttendanceController extends GetxController {
  var selectedEmployee = RxnString();
  var selectedDate = Rxn<DateTime>();

  final attendanceData = attendanceDataList.obs;

  List<String> get employeeList =>
      attendanceData.map((e) => e['name']!).toSet().toList();

  List<Map<String, String>> get filteredData {
    return attendanceData.where((record) {
      final matchesEmployee = selectedEmployee.value == null ||
          record['name'] == selectedEmployee.value;
      final matchesDate = selectedDate.value == null ||
          record['date'] ==
              DateFormat('yyyy-MM-dd').format(selectedDate.value!);
      return matchesEmployee && matchesDate;
    }).toList();
  }

  void clearFilters() {
    selectedEmployee.value = null;
    selectedDate.value = null;
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Present":
        return Colors.green;
      case "Absent":
        return Colors.red;
      case "Leave":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
