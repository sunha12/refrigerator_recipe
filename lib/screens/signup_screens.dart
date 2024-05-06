import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refrigerator_recipe_app/models/api_helper.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/notification_window_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_recipe_app/screens/loing_screens.dart';
import 'package:refrigerator_recipe_app/widgets/size_box_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';
import 'package:refrigerator_recipe_app/provider/time_update.dart';

class SignupScreens extends StatefulWidget {
  const SignupScreens({super.key});

  @override
  State<SignupScreens> createState() => _SignupScreensState();
}

class _SignupScreensState extends State<SignupScreens> {
  String _email = ''; //유저 이메일
  String _num = ''; //인증번호
  String _password = ''; //비밀번호
  String rePassword = ''; //비밀번호확인
  String nicknm = ''; //닉네임

  bool emailError = false; //이메일 오류
  bool numValid = false; //인증번호 개수 확인
  bool numError = false; //인증번호 오류
  bool passwordError = false; //비밀번호 오류
  bool _timerIsvVsible = false; //타이머 출력

  bool assentTrue = false; //정책 전체 동의
  bool service = false; //서비스 이용 약관
  bool privacy = false; //개인정보 처리 방침
  bool years = false; //만 14세 이상
  bool event = false; //이벤트 및 혜택 알림 동의

  bool complete = false; //회원가입 조건 통과

  final TimerUpdate timerUpdate = Get.find(); // 등록된 TimerUpdate 인스턴스 가져오기

  //이메일
  void _emailCheck(String text) {
    setState(() {
      _email = text;

      //오류 메시지
      if (text.isEmpty) {
        // 텍스트가 공백인 경우
        emailError = false;
      }
    });
  }

  //인증번호
  void _certificationNumberCheck(String text) {
    setState(() {
      _num = text;
      numValid = validateNumber(text);
    });
  }

  //비밀번호
  void _passwordCheck(String text) {
    setState(() {
      _password = text;
      // passwordError = _passwordConditionCheck(text);
    });
    _signupCheck();
  }

  //비밀번호 일치 여부
  void _passwordSameCheck(String text) {
    setState(() {
      rePassword = text;
      //오류 메시지
      if (rePassword.isEmpty) {
        //텍스트가 공백일때
        passwordError = false;
      } else {
        //공백이 아니면서 비밀번호가 일치하지 않을 떄
        if (_password != rePassword) {
          passwordError = true;
        } else {
          //텍스트 일치
          passwordError = false;
        }
      }
    });
    _signupCheck();
  }

  //닉네임 저장
  void _nicknmaeCheck(String text) {
    setState(() {
      nicknm = text;
    });
    _signupCheck();
  }

  //회원가입 조건 체크
  void _signupCheck() {
    if (emailError) {
      complete = false;
    } else if (numError) {
      complete = false;
    } else if (passwordError) {
      complete = false;
    } else if (nicknm == '') {
      complete = false;
    } else if (!service || !privacy || !years) {
      complete = false;
    } else {
      setState(() {
        complete = true;
      });
    }
  }

  //정책 동의
  void _assentCheck() {
    if (service && privacy && years && event) {
      setState(() {
        assentTrue = true;
      });
    } else {
      setState(() {
        assentTrue = false;
      });
    }
    _signupCheck();
  }

  //인증번호 숫자 6자리인지 체크
  bool validateNumber(String value) {
    return RegExp(r'^[0-9]{6}$').hasMatch(value);
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
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
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
                          color: AppTheme.gray_4A,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  ShortWhiteSizeBoxWidgets(
                    isvVsible: false,
                    onPressed: () async {
                      if (_timerIsvVsible) {
                        timerUpdate.reStartTimer();
                      }

                      setState(() {
                        _timerIsvVsible = true;
                      });
                      timerUpdate.startTimer();

                      final res = await ApiClient(
                              baseUrl:
                                  'https://auth.codingduo.co.kr/login/regi-email')
                          .post(
                        '',
                        {
                          'email': _email,
                          'islogin': 'N',
                        },
                      );
                      if (res['status'] == 200) {
                        //알림창 띄워줌
                        showDialog(
                          barrierDismissible: false, // 외부를 터치해도 창이 사라지지 않도록 설정
                          context: context,
                          builder: (BuildContext context) {
                            return NotificationWindowWidgets(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                buttonText: '확인',
                                alertText: '인증번호가 발송되었습니다.',
                                textColor: Colors.black);
                          },
                        );
                      }
                    },
                    hintText: '아이디 (이메일)',
                    buttonText: _timerIsvVsible ? '재전송' : '인증요청',
                    iconUrl: '',
                    onChanged: _emailCheck,
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
                child: emailError
                    ? Text(
                        '이메일을 정확히 입력해주세요.',
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
                        color: AppTheme.gray_4A,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                ShortWhiteSizeBoxWidgets(
                  isvVsible: _timerIsvVsible, //인증번호
                  onPressed: () async {
                    if (numValid) {
                      final res = await ApiClient(
                              baseUrl:
                                  'https://auth.codingduo.co.kr/login/regi-email-check')
                          .post(
                        '',
                        {
                          'email': _email,
                          'certnum': _num,
                        },
                      );
                      if (res['message'][0]['state'] == 'FAIL') {
                        setState(() {
                          numError = true;
                        });
                      } else {
                        timerUpdate.stopTimer();
                        _timerIsvVsible = false;
                        setState(() {
                          numError = false;
                        });
                        //알림창 띄워줌
                        showDialog(
                          barrierDismissible: false, // 외부를 터치해도 창이 사라지지 않도록 설정
                          context: context,
                          builder: (BuildContext context) {
                            return NotificationWindowWidgets(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                buttonText: '확인',
                                alertText: '인증번호가 확인되었습니다.',
                                textColor: Colors.black);
                          },
                        );
                      }
                    }
                  },
                  hintText: '인증번호 입력',
                  buttonText: '인증',
                  iconUrl: '',
                  onChanged: _certificationNumberCheck,
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
                  child: numError || (_num != '' && !numValid)
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
                        )),
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
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: LongTextInputFildWidgets(
                inText: '',
                hintText: "비밀번호 재확인",
                onChanged: _passwordSameCheck,
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
                        color: AppTheme.gray_4A,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                LongTextInputFildWidgets(
                  inText: '',
                  hintText: "예) 감자도리, 치즈게티",
                  onChanged: _nicknmaeCheck,
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
              // child: PolicyWidgets(),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppTheme.gray_D4),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    //전체 동의
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 14, horizontal: MediaWidth(context, 0.015)),
                      child: Align(
                        // alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton.icon(
                              onPressed: () {
                                setState(
                                  () {
                                    assentTrue = true;
                                    service = true; //서비스 이용 약관
                                    privacy = true; //개인정보 처리 방침
                                    years = true; //만 14세 이상
                                    event = true; //이벤트 및 혜택 알림 동의
                                  },
                                );
                                _signupCheck();
                              },
                              icon: assentTrue == false
                                  ? SvgPicture.asset(
                                      'assets/icons/ico_chack.svg')
                                  : SvgPicture.asset(
                                      'assets/icons/ico_chack_active.svg'),
                              label: Text(
                                '전체 동의 (선택 정보 포함)',
                                style: TextStyle(
                                    color: AppTheme.dark_charcoal,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.white), //배경색
                                foregroundColor: MaterialStateProperty.all(
                                    AppTheme.gray_4A), //글자색
                                //자동 패딩 제거
                                minimumSize:
                                    MaterialStateProperty.all(Size.zero),
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 3, left: MediaWidth(context, 0.03)),
                              child: Text(
                                '서비스 이용약관, 개인정보 수집 및 이용, 마케팅 이용에 대한 안내를 읽었으며 아래 내용에 모두 동의합니다.',
                                style: TextStyle(
                                  color: Color(0xff979797),
                                  fontSize: 10,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1, color: AppTheme.gray_D4),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            //서비스 이용 약관
                            TextButtonPolicyWidgets(
                              onPressed: () {
                                setState(
                                  () {
                                    service = !service;
                                    _assentCheck();
                                  },
                                );
                              },
                              buttonText: '[필수] 서비스 이용 약관',
                              icon: '',
                              isAgree: service,
                            ),

                            //개인정보 처리 방침
                            TextButtonPolicyWidgets(
                              onPressed: () {
                                setState(
                                  () {
                                    privacy = !privacy;
                                    _assentCheck();
                                  },
                                );
                              },
                              buttonText: '[필수] 개인정보 처리 방침',
                              icon: '',
                              isAgree: privacy,
                            ),
                            //만 14세 이상입니다
                            TextButtonPolicyWidgets(
                              onPressed: () {
                                setState(
                                  () {
                                    years = !years;
                                    _assentCheck();
                                  },
                                );
                              },
                              buttonText: '[필수] 만 14세 이상입니다',
                              icon: '14',
                              isAgree: years,
                            ),
                            //이벤트 및 혜택 알림 동의
                            TextButtonPolicyWidgets(
                              onPressed: () {
                                setState(
                                  () {
                                    event = !event;
                                    _assentCheck();
                                  },
                                );
                              },
                              buttonText: '[선택] 이벤트 및 혜택 알림 동의',
                              icon: '',
                              isAgree: event,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //가입하기 버튼
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
              child: LongButtonWidgets(
                onPressed: () async {
                  if (complete) {
                    final res = await ApiClient(
                            baseUrl:
                                'https://auth.codingduo.co.kr/login/regi-users')
                        .post(
                      '',
                      {
                        'client_id': 'refrigerator_recipe',
                        'email': _email,
                        'passwd': _password,
                        'nicknm': nicknm,
                        'event_yn': event ? 'Y' : 'N',
                      },
                    );
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
                            alertText: '가입이 완료되었습니다.',
                            textColor: Colors.black,
                          );
                        },
                      );
                    }
                  }
                },
                colorId: complete ? AppTheme.orange : AppTheme.gray_D9,
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
