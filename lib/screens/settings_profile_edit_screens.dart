import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';

class ProfileEditScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nicknameController = TextEditingController();

    final theme = Theme.of(context).copyWith(
      primaryColor: Colors.orange, // 포커스 색상 설정
    );

    return SafeArea(
      child: Theme(
        data: theme,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              // 뒤로가기
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                  ),
                ),
                child: SettingBackButtonWidgets(
                  appBarText: '프로필 수정',
                  onPressed: () {},
                ),
              ),
              Container(
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaWidth(context, 0.02), vertical: 10),
                    child: Container(
                      child: ClipOval(
                        child: Container(
                          child: Image.network(
                            '',
                            width: 180,
                            height: 180,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.account_circle_rounded,
                                size: 180,
                                color: Color(0xffD4D4D4),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 아이콘 버튼 위젯
                  Positioned(
                    right: 15,
                    bottom: 15,
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Color.fromARGB(255, 201, 201, 201), // 그림자 색상
                              blurRadius: 2, // 그림자의 흐림 정도
                              spreadRadius: 1, // 그림자의 확산 정도
                              offset: Offset(1, 2), // 그림자 위치
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 25,
                            color: AppTheme.gray_4A,
                          ),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ]),
              ),
              // Stack(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(top: 40, bottom: 30),
              //       child: CircleAvatar(
              //         radius: 80,
              //         backgroundColor: Colors.transparent,
              //         child: Icon(
              //           Icons.account_circle_rounded,
              //           size: 180,
              //           color: Color(0xffD4D4D4),
              //         ),
              //       ),
              //     ),
              //     Positioned(
              //       bottom: -5,
              //       right: MediaQuery.of(context).size.width / 2 - 80,
              //       child: Container(
              //         width: 43,
              //         height: 43,
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: Colors.white,
              //           boxShadow: [
              //             BoxShadow(
              //               color: Color.fromARGB(255, 201, 201, 201), // 그림자 색상
              //               blurRadius: 2, // 그림자의 흐림 정도
              //               spreadRadius: 1, // 그림자의 확산 정도
              //               offset: Offset(1, 2), // 그림자 위치
              //             ),
              //           ],
              //         ),
              //         child: Center(
              //           child: CircleAvatar(
              //             backgroundColor: Colors.transparent,
              //             radius: 23,
              //             child: Icon(
              //               Icons.camera_alt_outlined,
              //               color: AppTheme.gray_4A,
              //               size: 27,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                      child: Text(
                        '닉네임',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    LongTextInputFildWidgets(
                      hintText: '닉네임을 입력하세요.',
                      onChanged: (value) {},
                      inText: '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
