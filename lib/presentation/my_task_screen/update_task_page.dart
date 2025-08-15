import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skakone/core/constants/const_data.dart';
import 'models/my_task_models.dart';
import 'controller/my_task_controller.dart';

class UpdateTaskPage extends StatelessWidget {
  final int index;
  final TaskModel task;

  UpdateTaskPage({required this.index, required this.task});

  final statusList = ["Pending", "In Progress", "Completed"];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskController>();
    final RxString selectedStatus = task.status.obs;

    return Scaffold(
      appBar: AppBar(
        title: Text("Update Task"),
        backgroundColor: ConstData.prmClr,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TASK: ${task.header}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Obx(
              () => DropdownButtonFormField<String>(
                value: selectedStatus.value,
                decoration: InputDecoration(
                  labelText: "Update Status",
                  border: OutlineInputBorder(),
                ),
                items:
                    statusList
                        .map(
                          (status) => DropdownMenuItem(
                            value: status,
                            child: Text(status),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  if (value != null) selectedStatus.value = value;
                },
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Save", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  controller.updateTaskStatus(index, selectedStatus.value);
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ConstData.prmClr,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
