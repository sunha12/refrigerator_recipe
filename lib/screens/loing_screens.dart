import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/screens/home_screens.dart';
import 'package:refrigerator_recipe_app/screens/password_find_srceens.dart';
import 'package:refrigerator_recipe_app/screens/signup_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';

class LoingScreens extends StatefulWidget {
  const LoingScreens({super.key});

  @override
  State<LoingScreens> createState() => _LoingScreensState();
}

class _LoingScreensState extends State<LoingScreens> {
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
        body: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 38),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: mediaHeight * 0.16,
                  // width: MediaWidth(context, 0.4),
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
                      '이메일',
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
                  hintText: "아이디 (이메일)",
                  onChanged: _onChanged,
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
                  onChanged: _onChanged,
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
                  '비밀번호가 올바르지 않습니다.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.red,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: LongButtonWidgets(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreens()),
                  );
                },
                colorId: AppTheme.orange,
                buttonText: "로그인",
                iconUrl: "",
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScreens()),
                      );
                    },
                    child: Text(
                      '회원가입',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.darkText1,
                      ),
                    ),
                  ),
                  Text('|'),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PasswordFindScreens()),
                      );
                    },
                    child: Text(
                      "비밀번호 찾기",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.darkText1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
