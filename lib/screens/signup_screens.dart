import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/notification_window_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/policy_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/size_box_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';
import 'package:refrigerator_recipe_app/provider/time_update.dart';

class SignupScreens extends StatefulWidget {
  const SignupScreens({super.key});

  @override
  State<SignupScreens> createState() => _SignupScreensState();
}

class _SignupScreensState extends State<SignupScreens> {
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
        body: SingleChildScrollView(
          child: Column(children: [
            // 뒤로가기
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: AppTheme.gray_97),
                ),
              ),
              child: BackButtonWidgets(appBarText: '회원가입'),
            ),
            //이메일 인증
            Padding(
              padding: const EdgeInsets.only(
                top: 35,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaWidth(context, 0.07), bottom: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        textAlign: TextAlign.left,
                        '이메일',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.gray_deep,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  ShortWhiteSizeBoxWidgets(
                    isvVsible: false, //인증번호
                    onPressed: () {
                      //내용을 입력하세요
                    },
                    hintText: '아이디 (이메일)',
                    buttonText: '인증하기',
                    iconUrl: '',
                    onChanged: _onChanged,
                    inText: '',
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaWidth(context, 0.04),
                  vertical: 6,
                ),
                child: Text(
                  '이메일을 정확히 입력해주세요.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.red,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaWidth(context, 0.07), bottom: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      '인증 번호',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.gray_deep,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                ShortWhiteSizeBoxWidgets(
                  isvVsible: true, //인증번호
                  onPressed: () {
                    //내용을 입력하세요
                  },
                  hintText: '인증번호 입력',
                  buttonText: '인증',
                  // buttonText: '재전송',
                  iconUrl: '',
                  onChanged: _onChanged,
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
                child: Text(
                  '인증 번호가 일치하지 않습니다.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.red,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 8, color: AppTheme.line_thin),
                  ),
                ),
              ),
            ),
            //비밀번호 설정
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaWidth(context, 0.07), bottom: 5),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaWidth(context, 0.04),
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
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 8, color: AppTheme.line_thin),
                  ),
                ),
              ),
            ),
            //닉네임
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaWidth(context, 0.07), bottom: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      '닉네임',
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
                  hintText: "예) 감자도리, 치즈게티",
                  onChanged: _onChanged,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 8, color: AppTheme.line_thin),
                  ),
                ),
              ),
            ),
            //약관 동의
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: MediaWidth(context, 0.04)),
              child: PolicyWidgets(),
            ),
            //가입하기 버튼
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
              child: LongButtonWidgets(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false, // 외부를 터치해도 창이 사라지지 않도록 설정
                    context: context,
                    builder: (BuildContext context) {
                      return NotificationWindowWidgets(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => PasswordResetScreens()),
                            // );
                          },
                          buttonText: '확인',
                          alertText: '가입이 완료되었습니다.');
                    },
                  );
                },
                colorId: AppTheme.gray_D9,
                // colorId: AppTheme.orange,
                buttonText: "가입하기",
                iconUrl: "",
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
