import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skakone/presentation/task_assigned_report_screen/controller/task_assigned_report_controller.dart';

class TaskAssignedReportWidget {
  static Widget customField(TaskAssignedReportController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        controller: controller.selectedDateController,
        readOnly: true,
        onTap: () {
          controller.pickDate();
        },
        decoration: customDecoration(
          hint: 'Select Date',
          suffixIcon: Icon(CupertinoIcons.calendar),
        ),
      ),
    );
  }

  static Widget dropDown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DropdownButtonFormField(
        decoration: customDecoration(hint: 'Select Department'),
        items: [
          DropdownMenuItem(value: 'development', child: Text('Development')),
          DropdownMenuItem(value: 'hr', child: Text('HR')),
          DropdownMenuItem(value: 'it', child: Text('IT')),
          DropdownMenuItem(value: 'ai/ml', child: Text('AI/ML')),
        ],
        onChanged: (value) {},
      ),
    );
  }

  static InputDecoration customDecoration({
    required String hint,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      border: OutlineInputBorder(borderSide: BorderSide.none),
      fillColor: Colors.grey.shade200,
      filled: true,
      hintText: hint,
      suffixIcon: suffixIcon,
    );
  }

  static Widget customExpansionList() {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Card(color: Colors.white,
          child: ExpansionTile(
            leading: CircleAvatar(radius: 25, child: Text('N')),
            title: Text('Nabhan'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total: 0 task(s)/ 0 hr(s)',
                  style: subStyle(clr: Colors.grey),
                ),
                Text(
                  'Overdue: 0 task(s) / 0 hr(s)',
                  style: subStyle(clr: Colors.redAccent),
                ),
                Text(
                  'Assigned: 0 task(s) / 0 hr(s)',
                  style: subStyle(clr: Colors.blue),
                ),
              ],
            ),
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4,
                ),
                child: ListTile(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  tileColor: Colors.grey.shade300,
                  title: Text(
                    'RE-25071',
                    style: TextStyle(
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  leading: Text('New'),
                  trailing: Text('24 Jul 2025'),
                  subtitle: Text('2 hr'),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static TextStyle subStyle({required Color clr}) {
    return TextStyle(color: clr, fontSize: 12);
  }
}
