import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skakone/core/constants/const_data.dart';
import '../controller/add_task_controller.dart';
import '../widgets/add_task_widget.dart';

class GeneralTaskScreen extends StatelessWidget {
  final AddTaskController controller = Get.put(AddTaskController());
  GeneralTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: ConstData.prmClr,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'General Task',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AddTaskWidgets.buildLabel('Task Header'),
              AddTaskWidgets.buildInputField(
                controller.taskHeaderController,
                'Enter task header',
              ),

              AddTaskWidgets.buildLabel('Task Description'),
              AddTaskWidgets.buildInputField(
                controller.taskDescController,
                'Enter task description',
                maxLines: 3,
              ),

              ...buildDropdowns(controller),
              AddTaskWidgets.buildLabel('Affected Page'),
              AddTaskWidgets.buildInputField(
                controller.affectedPageController,
                'Specify affected page',
              ),

              AddTaskWidgets.buildLabel('Task Date'),
              Obx(
                    () => AddTaskWidgets.buildDatePicker(
                  controller.selectedDate.value,
                      () => controller.pickDate(context),
                ),
              ),

              AddTaskWidgets.buildLabel('Duration'),
              Obx(
                    () => AddTaskWidgets.buildDropdown(
                  controller.durationOptions,
                  controller.selectedDuration.value,
                  'Select duration',
                      (val) => controller.selectedDuration.value = val!,
                ),
              ),

              AddTaskWidgets.buildLabel('Assigned To'),
              Obx(
                    () => AddTaskWidgets.buildDropdown(
                  controller.assigneeOptions,
                  controller.selectedAssignee.value,
                  'Select assignee',
                      (val) => controller.selectedAssignee.value = val!,
                ),
              ),

              Obx(
                    () => AddTaskWidgets.buildAttachmentPicker(
                  onPick: controller.pickFile,
                  fileName:
                  controller.selectedFileName.value.isEmpty
                      ? null
                      : controller.selectedFileName.value,
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffEC3B37),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: () => controller.saveTask(),
          child: const Text('Add New Task', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }

  List<Widget> buildDropdowns(AddTaskController controller) {
    return [
      AddTaskWidgets.buildLabel('Client'),
      Obx(
            () => AddTaskWidgets.buildDropdown(
          controller.clientOptions,
          controller.selectedClient.value,
          'Select client',
              (val) => controller.selectedClient.value = val!,
        ),
      ),
      AddTaskWidgets.buildLabel('Project'),
      Obx(
            () => AddTaskWidgets.buildDropdown(
          controller.projectOptions,
          controller.selectedProject.value,
          'Select project',
              (val) => controller.selectedProject.value = val!,
        ),
      ),
      AddTaskWidgets.buildLabel('Environment'),
      Obx(
            () => AddTaskWidgets.buildDropdown(
          controller.envOptions,
          controller.selectedEnv.value,
          'Select environment',
              (val) => controller.selectedEnv.value = val!,
        ),
      ),
      AddTaskWidgets.buildLabel('Task Type'),
      Obx(
            () => AddTaskWidgets.buildDropdown(
          controller.taskTypeOptions,
          controller.selectedTaskType.value,
          'Select task type',
              (val) => controller.selectedTaskType.value = val!,
        ),
      ),
      AddTaskWidgets.buildLabel('Priority'),
      Obx(
            () => AddTaskWidgets.buildDropdown(
          controller.priorityOptions,
          controller.selectedPriority.value,
          'Select priority',
              (val) => controller.selectedPriority.value = val!,
        ),
      ),
    ];
  }
}
