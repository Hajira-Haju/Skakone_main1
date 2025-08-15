
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskController extends GetxController {
  // ========== Text Controllers ==========
  final taskHeaderController = TextEditingController();
  final taskDescController = TextEditingController();
  final affectedPageController = TextEditingController();
  final reportedByController = TextEditingController();
  final startDate = ''.obs;
  final endDate = ''.obs;
  final noOfOccurrencesController = TextEditingController();

  // ========== Reactive State ==========
  final selectedDate = Rxn<DateTime>();
  final selectedFileName = ''.obs;

  final isRepeatedIncident = false.obs;
  final isSystemDown = false.obs;

  // Dropdown Selections
  final selectedRequirement = RxnString(); // Requirement-specific
  final selectedTaskType = RxnString();    // Common
  final selectedPriority = RxnString();
  final selectedDuration = RxnString();
  final selectedAssignee = RxnString();

  final selectedClient = RxnString();      // Support-specific
  final selectedProject = RxnString();
  final selectedEnv = RxnString();

  // ========== Dropdown Options ==========
  final requirementOptions = ['Feature', 'Bug', 'Improvement'];
  final taskTypeOptions = ['Bug', 'Feature', 'Improvement'];
  final priorityOptions = ['Low', 'Medium', 'High'];
  final durationOptions = ['1 hr', '2 hr', '3 hr', '4 hr', '1 day', '2 days', '1 week'];
  final assigneeOptions = ['Reshmitha', 'Sonal', 'Mrudul', 'Nabhan', 'Hajira', 'Siyana'];
  final clientOptions = ['Client A', 'Client B', 'Client C'];
  final projectOptions = ['Project X', 'Project Y'];
  final envOptions = ['Production', 'Staging', 'Dev'];

  // ========== Methods ==========


  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) selectedDate.value = picked;
  }


  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    selectedFileName.value = result?.files.first.name ?? '';
  }

  Future<void> pickStartDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      startDate.value = '${picked.year}-${picked.month}-${picked.day}';
    }
  }

  Future<void> pickEndDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      endDate.value = '${picked.year}-${picked.month}-${picked.day}';
    }
  }


  void saveTask() {
    debugPrint('==== Task Submission ====');
    debugPrint('Task Header     : ${taskHeaderController.text}');
    debugPrint('Task Description: ${taskDescController.text}');
    debugPrint('Affected Page   : ${affectedPageController.text}');
    debugPrint('Reported By     : ${reportedByController.text}');
    debugPrint('Task Date       : ${selectedDate.value}');
    debugPrint('Requirement Type: ${selectedRequirement.value}');
    debugPrint('Task Type       : ${selectedTaskType.value}');
    debugPrint('Priority        : ${selectedPriority.value}');
    debugPrint('Duration        : ${selectedDuration.value}');
    debugPrint('Assignee        : ${selectedAssignee.value}');
    debugPrint('Client          : ${selectedClient.value}');
    debugPrint('Project         : ${selectedProject.value}');
    debugPrint('Environment     : ${selectedEnv.value}');
    debugPrint('Repeated Incident: ${isRepeatedIncident.value}');
    debugPrint('System Down     : ${isSystemDown.value}');
    debugPrint('Attachment      : ${selectedFileName.value}');
    debugPrint('===========================');
  }

}
