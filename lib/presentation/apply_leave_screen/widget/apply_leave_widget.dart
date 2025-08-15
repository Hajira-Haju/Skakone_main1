import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skakone/presentation/apply_leave_screen/controller/apply_leave_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class ApplyLeaveWidget {
  static Widget calendarSection(ApplyLeaveController controller) {
    return TableCalendar(
      focusedDay: controller.currentDay.value,
      firstDay: DateTime(2020),
      lastDay: DateTime(2100),
      selectedDayPredicate:
          (day) => isSameDay(day, controller.currentDay.value),
      onDaySelected: controller.onDaySelected,

      calendarFormat: CalendarFormat.month,
      availableCalendarFormats: const {CalendarFormat.month: 'Month'},
      onFormatChanged: (_) {},

      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  static Widget infoRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Text(value, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  static Widget divider() {
    return Divider(color: Colors.grey.shade300, thickness: 1, height: 20);
  }
}
