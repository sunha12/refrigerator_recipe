import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:refrigerator_recipe_app/models/api_helper.dart';
import 'package:refrigerator_recipe_app/utils/shared_preferences.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/notification_window_widgets.dart';
import 'package:refrigerator_recipe_app/screens/loing_screens.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';

class PasswordResetScreens extends StatefulWidget {
  const PasswordResetScreens({super.key});

  @override
  State<PasswordResetScreens> createState() => _PasswordResetScreensState();
}

class _PasswordResetScreensState extends State<PasswordResetScreens> {
  String password = ''; //비밀번호
  String rePassword = ''; //비밀번호확인

  bool passwordError = false; //비밀번호 오류

  //비밀번호
  void _setPassword(String text) {
    setState(() {
      password = text;
    });
  }

  //비밀번호확인
  void _setRePassword(String text) {
    setState(() {
      rePassword = text;
    });
  }

  //에러 체크
  void _errorCheck() {
    setState(() {
      passwordError = false;

      if (password != rePassword) {
        passwordError = true;
      }
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
                color: AppTheme.gray_4A,
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
                      color: AppTheme.gray_4A,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              LongTextInputFildWidgets(
                inText: '',
                hintText: "비밀번호",
                onChanged: _setPassword,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: LongTextInputFildWidgets(
              inText: '',
              hintText: "비밀번호 재확인",
              onChanged: _setRePassword,
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
                child: passwordError
                    ? Text(
                        '비밀번호가 일치하지 않습니다.',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.red,
                        ),
                      )
                    : Text(
                        '',
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
              onPressed: () async {
                _errorCheck();

                if (!passwordError) {
                  final res = await ApiClient(
                          baseUrl:
                              'https://auth.codingduo.co.kr/login/passwd-change')
                      .post(
                    '',
                    {
                      'user_idx': await loadData('user_idx'),
                      'passwd': password,
                    },
                  );
                  print(res);
                  if (res['status'] == 200) {
                    showDialog(
                      barrierDismissible: false, // 외부를 터치해도 창이 사라지지 않도록 설정
                      context: context,
                      builder: (BuildContext context) {
                        return NotificationWindowWidgets(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoingScreens()),
                              );
                            },
                            buttonText: '확인',
                            alertText: '비밀번호가 변경되었습니다.',
                            textColor: Colors.black);
                      },
                    );
                  }
                }
              },
              colorId: password != '' && rePassword != ''
                  ? AppTheme.orange
                  : AppTheme.gray_D9,
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
