import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skakone/core/constants/const_data.dart';
import 'package:skakone/presentation/holiday_calendar_screen/models/holiday_data.dart';
import 'package:table_calendar/table_calendar.dart';

import 'controller/holiday_controller.dart';

class HolidayCalendarScreen extends StatelessWidget {
  final HolidayCalendarController controller = Get.put(HolidayCalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstData.prmClr,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Obx(() => TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: controller.focusedDay.value,
            selectedDayPredicate: (day) =>
                isSameDay(controller.selectedDay.value, day),
            onDaySelected: controller.onDaySelected,
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.red.shade300,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: ConstData.prmClr,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
          Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Holidays on Selected Day",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          // Expanded must be outside Obx
          Expanded(
            child: Obx(() {
              final holidays = controller.filteredHolidays;

              if (holidays.isEmpty) {
                return Center(child: Text("No holidays on selected date."));
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: holidays.length,
                itemBuilder: (context, index) {
                  final holiday = holidays[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(
                        Icons.beach_access_rounded,
                        color: Colors.red,
                      ),
                      title: Text(
                        holiday['name'] ?? '',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(holiday['desc'] ?? ''),
                      trailing: Text(
                        holiday['date'] ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
