import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/screens/settings_help_detail_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';

class QuestionsBoxWidgets extends StatefulWidget {
  final String questionsText;
  final String questionsbodyText;
  const QuestionsBoxWidgets({
    required this.questionsText,
    required this.questionsbodyText,
    super.key,
  });

  @override
  State<QuestionsBoxWidgets> createState() => _QuestionsBoxWidgetstState();
}

class _QuestionsBoxWidgetstState extends State<QuestionsBoxWidgets> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: AppTheme.line_thin),
              ),
            ),
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HelpScreenssDetailScreens(
                            questionsTitle: widget.questionsText,
                            questionsmainText: widget.questionsbodyText,
                          )),
                );
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: MediaWidth(context, 0.04)),
                  child: Row(
                    children: [
                      Text(
                        widget.questionsText,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
