import 'dart:async';
import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/screens/loing_screens.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/notification_window_widgets.dart';

class WithdrawalScreens extends StatefulWidget {
  @override
  _WithdrawalScreensState createState() => _WithdrawalScreensState();
}

class _WithdrawalScreensState extends State<WithdrawalScreens> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _authNumberController = TextEditingController();
  Timer? _timer;
  int _start = 180; // 3분을 초 단위로

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black.withOpacity(0.1),
                    width: 2.0,
                  ),
                ),
              ),
              child: BackButtonWidgets(appBarText: '회원탈퇴'),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 16),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    child: Text(
                      '  이메일',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: LongTextInputFildWidgets(
                          hintText: '아이디 (이메일)를 입력하세요',
                          onChanged: (value) {},
                          inText: '',
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: ShortWhiteButtonWidgets(
                          onPressed: () {
                            startTimer();
                          },
                          buttonText: '인증하기',
                          iconUrl: '',
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, left: 16.0),
                    child: Text(
                      '  이메일을 정확히 입력해주세요.',
                      style: TextStyle(fontSize: 12, color: Colors.red),
                    ),
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        child: Text(
                          '  인증 번호',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                LongTextInputFildWidgets(
                                  hintText: '인증 번호를 입력하세요',
                                  onChanged: (value) {},
                                  inText: '',
                                ),
                                Positioned(
                                  right: 30, // 타이머 텍스트 위치
                                  child: (_timer != null && _timer!.isActive)
                                      ? Text(
                                          '${(_start ~/ 60).toString().padLeft(2, '0')}:${(_start % 60).toString().padLeft(2, '0')}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Container(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: ShortWhiteButtonWidgets(
                              onPressed: () {
                                startTimer();
                              },
                              buttonText: '인증',
                              iconUrl: '',
                            ),
                          ),
                          SizedBox(width: 16),
                        ],
                      ),
                      SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 16.0),
                        child: Text(
                          '  인증 번호가 일치하지 않습니다.',
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: '계정을 삭제하기 전에 확인해주세요.\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' · 계정 정보가 삭제되면 계정을 복구할 수 없습니다\n' +
                                ' · 개인정보는 개인정보처리방침에 따라 관리됩니다.\n' +
                                ' · 작성하신 콘텐츠는 자동으로 삭제되지 않습니다.\n' +
                                '   탈퇴 후 복구 및 수정, 삭제가 어렵습니다.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: 400,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return NotificationMultiWindowWidgets(
                            buttonText1: '아니요',
                            buttonText2: '계정 삭제',
                            onPressed1: () => Navigator.pop(context),
                            onPressed2: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoingScreens(),
                                ),
                              );
                            },
                            titleText: '',
                            alertText: '계정을 삭제하시겠습니까?',
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF9100),
                    ),
                    child: Text('계정 삭제'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
