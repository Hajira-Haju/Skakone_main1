import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skakone/presentation/my_task_screen/update_task_page.dart';

import '../../core/constants/const_data.dart';
import 'controller/my_task_controller.dart';

class MyTaskScreen extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstData.prmClr,
        foregroundColor: Colors.white,
      ),
      body: Obx(
            () => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('My Tasks', style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold)),
                ),
              ),
              ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 12),
                itemCount: controller.tasks.length,
                itemBuilder: (context, index) {
                  final task = controller.tasks[index];

                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    margin: EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Task #${task.taskNo}", style: TextStyle(fontWeight: FontWeight.bold)),
                              Spacer(),
                              Chip(
                                label: Text(task.priority),
                                backgroundColor: controller.getPriorityColor(task.priority).withOpacity(0.2),
                                labelStyle: TextStyle(color: controller.getPriorityColor(task.priority)),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Text(task.header, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          SizedBox(height: 4),
                          Row(children: [Icon(Icons.person, size: 16), SizedBox(width: 4), Text("Assigned to: ${task.assignedTo}")]),
                          Row(children: [Icon(Icons.calendar_today, size: 16), SizedBox(width: 4), Text("Date: ${task.taskDate}")]),
                          Row(children: [Icon(Icons.business, size: 16), SizedBox(width: 4), Text("Client: ${task.client}")]),
                          Row(
                            children: [
                              Icon(Icons.flag, size: 16),
                              SizedBox(width: 4),
                              Text("Status: "),
                              Chip(
                                label: Text(task.status),
                                backgroundColor: controller.getStatusColor(task.status).withOpacity(0.2),
                                labelStyle: TextStyle(color: controller.getStatusColor(task.status)),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton.icon(
                              onPressed: () => Get.to(() => UpdateTaskPage(index: index, task: task)),
                              icon: Icon(Icons.edit, size: 18),
                              label: Text("Update"),
                              style: TextButton.styleFrom(foregroundColor: Colors.teal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
