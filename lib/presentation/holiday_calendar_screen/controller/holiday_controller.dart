import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:skakone/presentation/holiday_calendar_screen/models/holiday_data.dart';

class HolidayCalendarController extends GetxController {
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime?> selectedDay = Rx<DateTime?>(DateTime.now());

  // Filtered list of holidays based on selected day
  List<Map<String, String>> get filteredHolidays {
    final selected = selectedDay.value;
    if (selected == null) return [];

    return HolidayData.holidays.where((holiday) {
      final date = DateTime.tryParse(holiday['date'] ?? '');
      return date != null &&
          date.year == selected.year &&
          date.month == selected.month &&
          date.day == selected.day;
    }).toList();
  }

  void onDaySelected(DateTime selected, DateTime focused) {
    selectedDay.value = selected;
    focusedDay.value = focused;
  }
}
