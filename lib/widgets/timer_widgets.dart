import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:refrigerator_recipe_app/provider/time_update.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';

class TimerWidgets extends StatefulWidget {
  const TimerWidgets({Key? key}) : super(key: key);

  @override
  State<TimerWidgets> createState() => _TimerWidgetsState();
}

class _TimerWidgetsState extends State<TimerWidgets> {
  final TimerUpdate timerUpdate = Get.find(); // 등록된 TimerUpdate 인스턴스 가져오기

  String formatSecondsToTime(int seconds) {
    // 분과 초 계산
    int minute = seconds ~/ 60;
    int second = seconds % 60;

    // 분과 초를 2자리 문자열로 변환
    String formattedMinute = minute.toString();
    String formattedSecond = second.toString().padLeft(2, '0');

    // 형식에 맞게 시간을 문자열로 반환
    return '$formattedMinute:$formattedSecond';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GetBuilder<TimerUpdate>(
              builder: (controller) {
                return Text(
                  controller.timerWidgetsTime.value > 0
                      ? formatSecondsToTime(controller.timerWidgetsTime.value)
                      : '',
                  style: TextStyle(fontSize: 14, color: AppTheme.green),
                );
              },
            ),

            // Text(

            //   formatSecondsToTime(timerUpdate.timerWidgetsTime.value),
            //   style: TextStyle(fontSize: 14, color: AppTheme.green),
            // ),
          ],
        ),
      ),
    );
  }
}
