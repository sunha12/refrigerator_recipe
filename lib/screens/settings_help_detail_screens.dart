import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';

class HelpScreenssDetailScreens extends StatefulWidget {
  final String questionsTitle;
  final String questionsmainText;

  const HelpScreenssDetailScreens(
      {required this.questionsTitle,
      required this.questionsmainText,
      super.key});

  @override
  State<HelpScreenssDetailScreens> createState() =>
      _HelpScreenssDetailScreensState();
}

class _HelpScreenssDetailScreensState extends State<HelpScreenssDetailScreens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            //뒤로가기
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: AppTheme.gray_D4),
                ),
              ),
              child: AppBar(
                title: Text(
                  widget.questionsTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Color(0xffffffff),
                leading: IconButton(
                  icon: SvgPicture.asset('assets/icons/ico_back.svg'),
                  iconSize: 26,
                  onPressed: () {
                    // 뒤로가기 버튼을 누르면 이전 화면으로 돌아가기
                    Navigator.pop(context);
                  },
                ),
                elevation: 0,
                centerTitle: true,
              ),
            ),
            //내용 부분
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaWidth(context, 0.04), vertical: 20),
              child: Container(
                width: MediaWidth(context, 1),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          widget.questionsTitle,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Text(
                        widget.questionsmainText,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
