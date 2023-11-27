import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';

class OpenSourceLicensesScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            BackButtonWidgets(appBarText: '오픈소스 라이선스 '),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20), // 여백을 추가
              child: Text("오픈소스 라이선스 오픈소스 라이선스 오픈소스 라이선스 오픈소스 라이선스 오픈소스 라이선스 ",
                  style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
