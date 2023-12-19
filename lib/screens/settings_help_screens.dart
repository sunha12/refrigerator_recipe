import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/questions_box_widgets.dart';

class HelpScreens extends StatefulWidget {
  const HelpScreens({super.key});

  @override
  State<HelpScreens> createState() => _HelpScreensState();
}

class _HelpScreensState extends State<HelpScreens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Column(
          children: [
            //뒤로가기
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: AppTheme.line_thin),
                ),
              ),
              child: BackButtonWidgets(appBarText: '도움말'),
            ),
            //질문
            QuestionsBoxWidgets(
              questionsText: '[회원/개인정보] 개인정보는 어떻게 수정하나요?',
              questionsbodyText:
                  '내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용내용 내용 내용 내용 내용 내용 내용 내용 내용 내용  내용 내용 내용 내용 내용 내용 내용 내용 내용내용 내용 내용',
            ),
            QuestionsBoxWidgets(
              questionsText: '[회원/개인정보] 회원탈퇴를 하고 싶어요.',
              questionsbodyText: '',
            ),
            QuestionsBoxWidgets(
              questionsText: '[레시피] 레시피 등록이 안 돼요.',
              questionsbodyText: '',
            ),
          ],
        ),
      ),
    );
  }
}
