import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/models/api_helper.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/screens/home_screens.dart';
import 'package:refrigerator_recipe_app/screens/password_find_srceens.dart';
import 'package:refrigerator_recipe_app/screens/signup_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/utils/device_id_util.dart';
import 'package:refrigerator_recipe_app/utils/shared_preferences.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';

class LoingScreens extends StatefulWidget {
  const LoingScreens({super.key});

  @override
  State<LoingScreens> createState() => _LoingScreensState();
}

class _LoingScreensState extends State<LoingScreens> {
  String _email = ''; //유저 이메일
  String _password = ''; //비밀번호
  String acthcod = ''; //액세스 토큰 발급용 어스코드

  bool emailError = false; //이메일 오류
  bool passwordError = false; //비밀번호 오류

  //컨트롤러
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    final deviceID = getDeviceUniqueId();
    saveData('deviceID', deviceID.toString());
  }

  //이메일
  void _emailCheck(String text) {
    setState(() {
      _email = text;
    });
  }

  //비밀번호
  void _passwordCheck(String text) {
    setState(() {
      _password = text;
    });
  }

  //에러 체크
  void _errorCheck(String text) {
    setState(() {
      emailError = false;
      passwordError = false;

      if (text == 'No users') {
        emailError = true;
      } else if (text == 'No passwd') {
        passwordError = true;
      } else if (text == 'No Email') {
        emailError = true;
      }
    });
  }

  //어스 코드를 받아서 액세스 토큰 요청
  void _acth(String text) {
    //값 체크
    setState(() {
      acthcod = text;
      _acthAccessToken();
      loing();
    });
  }

  void _acthAccessToken() async {
    final registrationCompleted =
        await ApiClient(baseUrl: 'https://auth.gooodall.com/oauth/token').post(
      '',
      {
        'code': acthcod,
        'client_secret': '7f2a2dc7cc0e3b82606af07e1ffd96a7',
        'client_id': 'refrigerator_recipe',
        'grant_type': 'access_token',
      },
    );
    print(registrationCompleted);
    saveData('accessToken', registrationCompleted['access_token']);
    saveData('refreshToken', registrationCompleted['refresh_token']);
  }

  //홈 화면 이동
  void loing() {
    if (emailError == false && passwordError == false) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreens()),
      );
    }
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
                  onChanged: _emailCheck,
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
                child: emailError == true
                    ? Text(
                        '이메일을 정확히 입력해주세요.',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.red,
                        ),
                      )
                    : Text(
                        '',
                        style: TextStyle(fontSize: 10),
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
                  onChanged: _passwordCheck,
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
                child: passwordError == true
                    ? Text(
                        '비밀번호가 올바르지 않습니다.',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.red,
                        ),
                      )
                    : Text(
                        '',
                        style: TextStyle(fontSize: 10),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: LongButtonWidgets(
                onPressed: () async {
                  //로그인 요청
                  final login = await ApiClient(
                          baseUrl: 'https://auth.codingduo.co.kr/login/')
                      .post(
                    '',
                    {
                      // 'client_id': 'refrigerator_recipe',
                      'email': _email,
                      'passwd': _password,
                      // 'device_uid': await loadData('deviceID'),
                      // 'device_name': '',
                    },
                  );
                  print(login);
                  final auth = login['message'];
                  if (login['status'] == 400) {
                    _errorCheck(auth);
                  } else {
                    _errorCheck(auth['code']);
                    _acth(auth['code']);
                  }
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
