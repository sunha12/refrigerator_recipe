import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              '프로필 수정',
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.grey),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '저장',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(height: 40.0),
              Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 160,
                        color: Color(0xffD4D4D4),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: MediaQuery.of(context).size.width / 2 - 80,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 201, 201, 201), // 그림자 색상
                            blurRadius: 2, // 그림자의 흐림 정도
                            spreadRadius: 1, // 그림자의 확산 정도
                            offset: Offset(1, 2), // 그림자 위치
                          ),
                        ],
                      ),
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 23,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[400],
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.0),
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
