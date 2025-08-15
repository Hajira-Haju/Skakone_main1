import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skakone/presentation/apply_leave_screen/controller/apply_leave_controller.dart';
import 'package:skakone/presentation/apply_leave_screen/widget/apply_leave_widget.dart';

class ApplyLeaveScreen extends StatelessWidget {
  ApplyLeaveScreen({super.key});
  final controller = Get.put(ApplyLeaveController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'New Leave',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Type',
                        prefixIcon: const Icon(Icons.apps),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      value:
                          controller.selectedLeaveType.value.isEmpty
                              ? null
                              : controller.selectedLeaveType.value,
                      hint: const Text('Select Type'),
                      items:
                          controller.leaveTypes
                              .map(
                                (type) => DropdownMenuItem(
                                  value: type,
                                  child: Text(type),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        controller.selectedLeaveType.value = value ?? '';
                      },
                    ),
                    const SizedBox(height: 12),

                    TextFormField(
                      controller: TextEditingController(
                          text: controller.selectedCause.value,
                        )
                        ..selection = TextSelection.fromPosition(
                          TextPosition(
                            offset: controller.selectedCause.value.length,
                          ),
                        ),
                      onChanged: (value) {
                        controller.selectedCause.value = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Reason',
                        prefixIcon: const Icon(Icons.edit),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    InkWell(
                      onTap: () => controller.setTarget('from'),
                      child: ApplyLeaveWidget.infoRow(
                        icon: Icons.arrow_forward,
                        title: 'From',
                        value: controller.formatDate(controller.fromDate.value),
                      ),
                    ),
                    const SizedBox(height: 10),

                    if (controller.showCalendar.value)
                      ApplyLeaveWidget.calendarSection(controller),

                    const SizedBox(height: 10),

                    InkWell(
                      onTap: () => controller.setTarget('to'),
                      child: ApplyLeaveWidget.infoRow(
                        icon: Icons.arrow_forward,
                        title: 'To',
                        value: controller.formatDate(controller.toDate.value),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Submit logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEE3B37),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Apply for ${controller.leaveDays} Days Leave',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
