import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/models/api_helper.dart';
import 'package:refrigerator_recipe_app/utils/shared_preferences.dart';
import 'package:refrigerator_recipe_app/screens/password_auth_srceens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';

class PasswordFindScreens extends StatefulWidget {
  const PasswordFindScreens({super.key});

  @override
  State<PasswordFindScreens> createState() => _PasswordFindScreensState();
}

class _PasswordFindScreensState extends State<PasswordFindScreens> {
  String _email = ''; //유저 이메일

  //컨트롤러
  TextEditingController _controller = TextEditingController();

  //이메일
  void _emailCheck(String text) {
    setState(() {
      _email = text;
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
              '가입한 이메일로 인증번호를 발송하였습니다.',
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
              LongTextInputFildWidgets(
                inText: '',
                hintText: "아이디 (이메일)",
                onChanged: _emailCheck,
              ),
            ],
          ),
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(
          //       horizontal: 22,
          //       vertical: 6,
          //     ),
          //     child: Text(
          //       '이메일을 정확히 입력해주세요.',
          //       style: TextStyle(
          //         fontSize: 12,
          //         color: AppTheme.red,
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 27, 0, 0),
            child: LongButtonWidgets(
              onPressed: () async {
                final res = await ApiClient(
                        baseUrl:
                            'https://auth.codingduo.co.kr/login/changepw-email')
                    .post(
                  '',
                  {
                    'email': _email,
                  },
                );
                print(res);
                if (res['status'] == 200) {
                  saveData('email', _email);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PasswordAuthScreens()),
                  );
                }
              },
              colorId: _email != '' ? AppTheme.orange : AppTheme.gray_D9,
              // colorId: AppTheme.orange,
              buttonText: "인증하기",
              iconUrl: "",
            ),
          ),
        ]),
      ),
    );
  }
}
