import 'dart:async';
import 'package:get/get.dart';

class TimerUpdate extends GetxController {
  RxInt timerWidgetsTime = 180.obs;

  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerWidgetsTime > 0) {
        timerWidgetsTime.value--;
        update();
      }
    });
  }

  void reStartTimer() {
    timerWidgetsTime = 180.obs;
    update();
  }

  void stopTimer() {
    if (timerWidgetsTime > 0) {
      timerWidgetsTime = 0.obs;
      update();
    }
  }
}
