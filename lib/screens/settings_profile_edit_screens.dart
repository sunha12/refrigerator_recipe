import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';

class ProfileEditScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nicknameController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            BackButtonWidgets(appBarText: '프로필 수정'),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                // 사진 첨부 로직 (예: 이미지 피커 사용)
              },
              child: CircleAvatar(
                radius: 50,
                // 이미지 경로 설정
                backgroundImage: AssetImage('assets/default_profile_image.png'),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.camera_alt, size: 24.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: nicknameController,
                decoration: InputDecoration(labelText: '닉네임'),
                onChanged: (value) {
                  // 닉네임 변경 로직 추가
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 변경된 정보 저장 로직 추가
                Navigator.pop(context);
              },
              child: Text('저장'),
            ),
          ],
        ),
      ),
    );
  }
}
