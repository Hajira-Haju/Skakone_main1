

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/my_task_data.dart';


class TaskController extends GetxController {
  var tasks = taskList.obs;

  void updateTaskStatus(int index, String newStatus) {
    final updatedTask = tasks[index].copyWith(status: newStatus);
    tasks[index] = updatedTask;
  }
  Color getPriorityColor(String p) {
    switch (p) {
      case "High": return Colors.red;
      case "Medium": return Colors.orange;
      case "Low": return Colors.green;
      default: return Colors.grey;
    }
  }

  Color getStatusColor(String s) {
    switch (s) {
      case "Completed": return Colors.green;
      case "Pending": return Colors.orange;
      case "In Progress": return Colors.blue;
      default: return Colors.grey;
    }
  }

}
