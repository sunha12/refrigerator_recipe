import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:refrigerator_recipe_app/models/api_helper.dart';
import 'package:refrigerator_recipe_app/utils/shared_preferences.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/screens/password_reset_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/notification_window_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/size_box_widgets.dart';
import 'package:refrigerator_recipe_app/provider/time_update.dart';

class PasswordAuthScreens extends StatefulWidget {
  const PasswordAuthScreens({super.key});

  @override
  State<PasswordAuthScreens> createState() => _PasswordAuthScreensState();
}

class _PasswordAuthScreensState extends State<PasswordAuthScreens> {
  final TimerUpdate timerUpdate = Get.find(); // 등록된 TimerUpdate 인스턴스 가져오기

  String _num = ''; //인증번호
  bool numError = false; //인증번호 오류

  TextEditingController _controller = TextEditingController();

  void _setNumber(String text) {
    setState(() {
      _num = text;
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
            child: BackButtonWidgets(appBarText: '비밀번호 찾기'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 35, 0, 27),
            child: Text(
              '가입한 이메일을 통해 비밀번호를 찾을 수 있습니다.',
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
                    '인증 번호',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.gray_4A,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              ShortWhiteSizeBoxWidgets(
                isvVsible: false, //인증번호
                onPressed: () async {
                  final res = await ApiClient(
                          baseUrl:
                              'https://auth.codingduo.co.kr/login/changepw-email')
                      .post(
                    '',
                    {
                      'email': await loadData('email'),
                    },
                  );
                },
                hintText: '인증번호 입력',
                buttonText: '재전송',
                iconUrl: '',
                onChanged: _setNumber,
                inText: '',
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaWidth(context, 0.04),
                vertical: 6,
              ),
              child: numError
                  ? Text(
                      '인증 번호가 일치하지 않습니다.',
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 27, 0, 0),
            child: LongButtonWidgets(
              onPressed: () async {
                final res = await ApiClient(
                        baseUrl:
                            'https://auth.codingduo.co.kr/login/regi-passwd-cod-check')
                    .get(
                  '?email=${await loadData('email')}&certnum=${_num}',
                );

                print(res);

                if (res['status'] == 200) {
                  final idx = res['message'];
                  saveData('user_idx', idx['user_idx'].toString());

                  showDialog(
                    barrierDismissible: false, // 외부를 터치해도 창이 사라지지 않도록 설정
                    context: context,
                    builder: (BuildContext context) {
                      return NotificationWindowWidgets(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PasswordResetScreens()),
                            );
                          },
                          buttonText: '확인',
                          alertText: '인증되었습니다.',
                          textColor: Colors.black);
                    },
                  );
                } else {
                  setState(() {
                    numError = true;
                  });
                }
              },
              colorId: _num != '' ? AppTheme.orange : AppTheme.gray_D9,
              // colorId: AppTheme.orange,
              buttonText: "인증 완료",
              iconUrl: "",
            ),
          ),
        ]),
      ),
    );
  }
}
