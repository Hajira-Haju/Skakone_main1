import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ApplyLeaveController extends GetxController {
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;

  RxBool isToggled = true.obs;
  RxBool showCalendar = false.obs;

  Rx<DateTime> currentDay = DateTime.now().obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;

  RxString selectedTarget = 'from'.obs;

  RxString selectedLeaveType = ''.obs;
  RxString selectedCause = ''.obs;

  final leaveTypes = ['Sick', 'Casual'].obs;

  int get leaveDays => toDate.value.difference(fromDate.value).inDays + 1;

  String formatDate(DateTime date) => DateFormat('dd MMM yyyy').format(date);

  void toggleAmPm() {
    isToggled.value = !isToggled.value;
  }

  void setTarget(String target) {
    selectedTarget.value = target;
    showCalendar.value = true;
  }

  void onDaySelected(DateTime selected, DateTime focused) {
    currentDay.value = selected;
    focusedDay.value = focused;

    if (selectedTarget.value == 'from') {
      fromDate.value = selected;
      if (fromDate.value.isAfter(toDate.value)) {
        toDate.value = fromDate.value;
      }
    } else {
      toDate.value = selected;
      if (toDate.value.isBefore(fromDate.value)) {
        fromDate.value = toDate.value;
      }
    }

    showCalendar.value = false;
  }
}
