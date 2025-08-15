import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskAssignedReportController extends GetxController {
  final selectedDateController = TextEditingController();
  var selectedDate = DateTime.now().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    loadInitialDate();
    super.onInit();
  }

  void loadInitialDate() {
    selectedDateController.text =
        "${selectedDate.value.day}-${selectedDate.value.month}-${selectedDate.value.year}";
  }

  void pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value = picked;
      selectedDateController.text =
          "${picked.day}-${picked.month}-${picked.year}";
    }
  }
}
