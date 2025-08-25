import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skakone/presentation/task_assigned_report_screen/widget/task_assigned_report_widget.dart';
import '../../core/constants/const_data.dart';
import 'controller/task_assigned_report_controller.dart';

class TaskAssignedReportScreen extends StatelessWidget {
  TaskAssignedReportScreen({super.key});
  final controller = Get.put(TaskAssignedReportController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstData.prmClr,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: double.infinity, height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Task Analysis',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TaskAssignedReportWidget.customField(controller),
                ),
                Expanded(child: TaskAssignedReportWidget.dropDown()),
              ],
            ),
            SizedBox(height: 20),
            TaskAssignedReportWidget.customExpansionList(),
          ],
        ),
      ),
    );
  }
}
