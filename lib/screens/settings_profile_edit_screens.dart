import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';

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
              GestureDetector(
                onTap: () {
                  // 사진 첨부 로직
                },
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.account_circle, // 사용자 프로필 아이콘으로 변경
                        size: 100, // 아이콘 크기 조절
                        color: Colors.grey, // 아이콘 색상 설정
                      ),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.camera_alt,
                        size: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: nicknameController,
                  decoration: InputDecoration(
                    labelText: '닉네임',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
