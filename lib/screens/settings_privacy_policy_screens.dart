import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';

class PrivacyPolicyScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            BackButtonWidgets(appBarText: '개인정보 처리방침'),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20), // 여백을 추가
              child: Text("개인정보 처리방침 개인정보 처리방침 개인정보 처리방침 개인정보 처리방침 ",
                  style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
