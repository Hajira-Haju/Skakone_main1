import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../core/constants/const_data.dart';

import '../controller/add_task_controller.dart';
import '../widgets/add_task_widget.dart';

class RequirementTask extends StatelessWidget {
  RequirementTask({super.key});
  final AddTaskController controller = Get.put(AddTaskController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
      backgroundColor: ConstData.prmClr,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Requirement Task',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.save),
          onPressed: () {},
        )
      ],
    ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            AddTaskWidgets.buildLabel('Task Header'),
            AddTaskWidgets.buildInputField(controller.taskHeaderController, 'Enter task header'),
            AddTaskWidgets.buildLabel('Task Description'),
            AddTaskWidgets.buildInputField(controller.taskDescController, 'Enter task description', maxLines: 3),
            AddTaskWidgets.buildLabel('Requirement'),
            Obx(() => AddTaskWidgets.buildDropdown(
              controller.requirementOptions,
              controller.selectedRequirement.value,
              'Select requirement',
                  (val) => controller.selectedRequirement.value = val,
            )),
            const SizedBox(height: 20),
            AddTaskWidgets.buildLabel('Task Type'),
            Obx(() => AddTaskWidgets.buildDropdown(
              controller.taskTypeOptions,
              controller.selectedTaskType.value,
              'Select task type',
                  (val) => controller.selectedTaskType.value = val!,
            )),
            const SizedBox(height: 20),
            AddTaskWidgets.buildLabel('Priority'),
            Obx(() => AddTaskWidgets.buildDropdown(
              controller.priorityOptions,
              controller.selectedPriority.value,
              'Select priority',
                  (val) => controller.selectedPriority.value = val,
            )),
            const SizedBox(height: 20),
            AddTaskWidgets.buildLabel('Affected Page'),
            AddTaskWidgets.buildInputField(controller.affectedPageController, 'Specify Affected page'),
            AddTaskWidgets.buildLabel('Task Date'),
            Obx(() => GestureDetector(
              onTap: () => controller.pickDate(context),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.selectedDate.value == null
                          ? 'Select date'
                          : '${controller.selectedDate.value!.day}/${controller.selectedDate.value!.month}/${controller.selectedDate.value!.year}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Icon(Icons.calendar_month_outlined, size: 20, color: Colors.grey),
                  ],
                ),
              ),
            )),
            AddTaskWidgets.buildLabel('Task Duration'),
            Obx(() => AddTaskWidgets.buildDropdown(
              controller.durationOptions,
              controller.selectedDuration.value,
              'Select duration',
                  (val) => controller.selectedDuration.value = val,
            )),
            AddTaskWidgets.buildLabel('Assigned To'),
            Obx(() => AddTaskWidgets.buildDropdown(
              controller.assigneeOptions,
              controller.selectedAssignee.value,
              'Select assignee',
                  (val) => controller.selectedAssignee.value = val,
            )),
            Obx(() => AddTaskWidgets.buildAttachmentPicker(
              onPick: controller.pickFile,
              fileName: controller.selectedFileName.value.isEmpty
                  ? null
                  : controller.selectedFileName.value,
            )),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffEC3B37),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          onPressed: () {
          },
          child: const Text('Add New Task', style: TextStyle(fontSize: 16)),
        ),

      ),
    );
  }
}
