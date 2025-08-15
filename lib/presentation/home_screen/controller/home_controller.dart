import 'dart:async';

import 'package:get/get.dart';
import 'package:skakone/presentation/home_screen/models/home_data.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  late Timer timer;

  @override
  void onInit() {
    // TODO: implement onInit
    refreshImageTimer();
    super.onInit();
  }

  void refreshImageTimer() {
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      currentIndex.value = (currentIndex.value + 1) % HomeData.images.length;
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    timer.cancel();
    super.onClose();
  }
}
