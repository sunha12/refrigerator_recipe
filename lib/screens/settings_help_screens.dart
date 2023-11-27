import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';

class HelpScreens extends StatelessWidget {
  final List<FAQItem> faqList = [
    FAQItem(
      question: '[회원/개인정보] 개인 정보는 어떻게 수정하나요?',
      answer: '내용을 추가하세요 내용을 추가하세요 내용을 추가하세요 내용을 추가하세요 내용을 추가하세요 ',
    ),
    FAQItem(
      question: '[레시피] 레시피 등록이 안돼요',
      answer: '내용을 추가하세요 내용을 추가하세요 내용을 추가하세요 내용을 추가하세요 내용을 추가하세요 ',
    ),
    // 다른 질문과 답변 항목 추가 가능
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            BackButtonWidgets(appBarText: '도움말'),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: faqList.length,
                itemBuilder: (context, index) {
                  final faqItem = faqList[index];
                  return FAQListItem(
                    question: faqItem.question,
                    answer: faqItem.answer,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({
    required this.question,
    required this.answer,
  });
}

class FAQListItem extends StatefulWidget {
  final String question;
  final String answer;

  FAQListItem({
    required this.question,
    required this.answer,
  });

  @override
  _FAQListItemState createState() => _FAQListItemState();
}

class _FAQListItemState extends State<FAQListItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.question,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            isExpanded ? Icons.expand_less : Icons.expand_more,
            size: 24.0,
          ),
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.answer,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        Divider(),
      ],
    );
  }
}
