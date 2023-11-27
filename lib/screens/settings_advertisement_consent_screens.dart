import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';

class AdvertisementConsentScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            BackButtonWidgets(appBarText: '광고 수신 동의'),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20), // 여백을 추가
              child: Text(
                  "광고 수신 동의 광고 수신 동의 광고 수신 동의 광고 수신 동의 광고 수신 동의 광고 수신 동의 ",
                  style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
