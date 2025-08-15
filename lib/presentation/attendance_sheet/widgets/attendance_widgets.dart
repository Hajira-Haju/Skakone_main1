import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/const_data.dart';
import '../controller/attendance_controller.dart';

class AttendanceWidget {
  static Widget filterBar(
    BuildContext context,
    AttendanceController controller,
    VoidCallback onPickDate,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(child: employeeDropdown(controller)),
          const SizedBox(width: 12),
          datePickerButton(context, controller, onPickDate),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: controller.clearFilters,
            style: ElevatedButton.styleFrom(
              backgroundColor: ConstData.prmClr,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(14),
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.filter_alt_off, size: 20),
          ),
        ],
      ),
    );
  }

  static Widget employeeDropdown(AttendanceController controller) {
    return DropdownButtonFormField<String>(
      value: controller.selectedEmployee.value,
      hint: const Text("Select Employee"),
      isExpanded: true,
      items:
          controller.employeeList
              .map((name) => DropdownMenuItem(value: name, child: Text(name)))
              .toList(),
      onChanged: (value) => controller.selectedEmployee.value = value,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  static Widget datePickerButton(
    BuildContext context,
    AttendanceController controller,
    VoidCallback onPickDate,
  ) {
    return ElevatedButton(
      onPressed: onPickDate,
      style: ElevatedButton.styleFrom(
        backgroundColor: ConstData.prmClr,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(14),
        shape: const CircleBorder(), // makes it circular if needed
      ),
      child: const Icon(Icons.calendar_today, size: 20),
    );
  }

  static Widget tableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: Colors.grey.shade300,
      child: const Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              "Employee",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Date",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Status",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget attendanceRow(
      Map<String, String> item,
      AttendanceController controller,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(item['name']!)),
          Expanded(flex: 2, child: Text(item['date']!)),
          SizedBox(width: 20,),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Chip(
                label: Text(item['status']!),
                backgroundColor: controller
                    .getStatusColor(item['status']!)
                    .withOpacity(0.2),
                labelStyle: TextStyle(
                  color: controller.getStatusColor(item['status']!),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
