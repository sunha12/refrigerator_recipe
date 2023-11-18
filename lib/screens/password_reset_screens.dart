import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/notification_window_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/size_box_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';
import 'package:refrigerator_recipe_app/provider/time_update.dart';

class PasswordResetScreens extends StatefulWidget {
  const PasswordResetScreens({super.key});

  @override
  State<PasswordResetScreens> createState() => _PasswordResetScreensState();
}

class _PasswordResetScreensState extends State<PasswordResetScreens> {
  final TimerUpdate timerUpdate = Get.find(); // 등록된 TimerUpdate 인스턴스 가져오기

  void _onChanged(String text) {
    setState(() {
      //상태 관리 코드
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          // 뒤로가기
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
              ),
            ),
            child: BackButtonWidgets(appBarText: '비밀번호 재설정'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 35, 0, 27),
            child: Text(
              '새로운 비밀번호를 입력해주세요.',
              style: TextStyle(
                color: AppTheme.gray_deep,
                fontSize: 14,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: MediaWidth(context, 0.07), bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textAlign: TextAlign.left,
                    '비밀번호',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.gray_deep,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              LongTextInputFildWidgets(
                inText: '',
                hintText: "비밀번호",
                onChanged: _onChanged,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: LongTextInputFildWidgets(
              inText: '',
              hintText: "비밀번호 재확인",
              onChanged: _onChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 6,
                ),
                child: Text(
                  '비밀번호가 일치하지 않습니다.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.red,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 27, 0, 0),
            child: LongButtonWidgets(
              onPressed: () {},
              colorId: AppTheme.gray_D9,
              // colorId: AppTheme.orange,
              buttonText: "비밀번호 변경하기",
              iconUrl: "",
            ),
          ),
        ]),
      ),
    );
  }
}
