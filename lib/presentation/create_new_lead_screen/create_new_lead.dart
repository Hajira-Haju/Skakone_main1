import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skakone/core/constants/const_data.dart';

import 'controller/create_new_lead_controller.dart';
import 'widgets/create_new_lead_widgets.dart';

class CreateLeadScreen extends StatelessWidget {
  final controller = Get.put(CreateLeadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstData.prmClr,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              CreateNewLeadWidgets.buildLabel('Company Name'),
              CreateNewLeadWidgets.buildInputField(
                controller.companyName,
                'Enter Company Name',
              ),
          
              CreateNewLeadWidgets.buildLabel('Business Type'),
              CreateNewLeadWidgets.buildInputField(
                controller.businessType,
                'Enter Business Type',
              ),
          
              CreateNewLeadWidgets.buildLabel('Product/Service'),
              CreateNewLeadWidgets.buildInputField(
                controller.productOrService,
                'Enter Product or Service',
              ),
          
              CreateNewLeadWidgets.buildLabel('GPS Location'),
              CreateNewLeadWidgets.buildInputField(
                controller.gpsLocation,
                'Enter GPS Location',
              ),
          
              CreateNewLeadWidgets.buildLabel('Address'),
              CreateNewLeadWidgets.buildInputField(
                controller.address,
                'Enter Address',
                maxLines: 2,
              ),
          
              CreateNewLeadWidgets.buildLabel('Contact Person Name'),
              CreateNewLeadWidgets.buildInputField(
                controller.contactPersonName,
                'Enter Contact Name',
              ),
          
              CreateNewLeadWidgets.buildLabel('Contact Person Mobile'),
              CreateNewLeadWidgets.buildInputField(
                controller.contactPersonMobile,
                'Enter Mobile Number',
              ),
          
              CreateNewLeadWidgets.buildLabel('Contact Person Email'),
              CreateNewLeadWidgets.buildInputField(
                controller.contactPersonEmail,
                'Enter Email',
              ),
          
              CreateNewLeadWidgets.buildLabel('Source Of Contact'),
              CreateNewLeadWidgets.buildInputField(
                controller.sourceOfContact,
                'Enter Source',
              ),
          
              CreateNewLeadWidgets.buildLabel('Comment'),
              CreateNewLeadWidgets.buildInputField(
                controller.comment,
                'Enter Comment',
                maxLines: 3,
              ),
          
              CreateNewLeadWidgets.buildLabel('Status'),
              CreateNewLeadWidgets.buildInputField(
                controller.status,
                'Enter Status',
              ),
          
              CreateNewLeadWidgets.buildDateField(
                'Followup Date',
                controller.followupDate,
                () => controller.pickDate(context, controller.followupDate),
              ),
              CreateNewLeadWidgets.buildDateField(
                'Comment Date',
                controller.commentDate,
                () => controller.pickDate(context, controller.commentDate),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffEC3B37),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                },
                child: const Text('Sumbit', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
