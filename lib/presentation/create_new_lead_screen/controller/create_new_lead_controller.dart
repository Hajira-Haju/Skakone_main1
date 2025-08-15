import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateLeadController extends GetxController {
  final companyName = TextEditingController();
  final businessType = TextEditingController();
  final productOrService = TextEditingController();
  final gpsLocation = TextEditingController();
  final address = TextEditingController();
  final contactPersonName = TextEditingController();
  final contactPersonMobile = TextEditingController();
  final contactPersonEmail = TextEditingController();
  final sourceOfContact = TextEditingController();
  final comment = TextEditingController();
  final status = TextEditingController();

  final followupDate = Rxn<DateTime>();
  final commentDate = Rxn<DateTime>();

  void pickDate(BuildContext context, Rxn<DateTime> targetDate) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: targetDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      targetDate.value = picked;
    }
  }
}
