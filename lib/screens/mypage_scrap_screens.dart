import 'package:flutter/material.dart';
import '../styles/theme.dart';
import '../widgets/back_button_widgets.dart';

class ScrapRecipesPage extends StatefulWidget {
  @override
  _ScrapRecipesPageState createState() => _ScrapRecipesPageState();
}

class _ScrapRecipesPageState extends State<ScrapRecipesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            BackButtonWidgets(appBarText: '스크랩'),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                ),
              ),
            ),
            // 화면 구성 요소
          ],
        ),
      ),
    );
  }
}
