import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/screens/loing_screens.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';

class WithdrawalScreens extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _authNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            BackButtonWidgets(appBarText: '회원탈퇴'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              16.0, 8.0, 16.0, 8.0), // 좌우 간격 추가
                          child: Text('이메일',
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                            SizedBox(width: 8),
                            Container(
                              width: 100,
                              child: ShortWhiteButtonWidgets(
                                onPressed: () {},
                                buttonText: '인증하기',
                                iconUrl: '',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, left: 16.0), // 좌측 간격 추가
                          child: Text(
                            '이메일을 정확히 입력해주세요.',
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              16.0, 8.0, 16.0, 8.0), // 좌우 간격 추가
                          child: Text('이메일',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: LongTextInputFildWidgets(
                                hintText: '인증 번호를 입력하세요',
                                onChanged: (value) {},
                                inText: '',
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              width: 100,
                              child: ShortWhiteButtonWidgets(
                                onPressed: () {},
                                buttonText: '인증',
                                iconUrl: '',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, left: 16.0), // 좌측 간격 추가
                          child: Text(
                            '인증 번호가 일치하지 않습니다.',
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    LongButtonWidgets(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("회원 탈퇴"),
                              content: Text("계정을 삭제하시겠습니까?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("취소"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => LoingScreens(),
                                      ),
                                    );
                                  },
                                  child: Text("계정 삭제"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      colorId: AppTheme.orange,
                      buttonText: '계정 삭제',
                      iconUrl: '',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
