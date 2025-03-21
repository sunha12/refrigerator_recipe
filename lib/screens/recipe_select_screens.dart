import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/models/api_helper.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/navigation_bar_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/recipe_fild_widgets.dart';
import 'receipt_view_screens.dart';

class RecipeSelectScreens extends StatefulWidget {
  final title;

  const RecipeSelectScreens({
    super.key,
    required this.title,
  });

  @override
  State<RecipeSelectScreens> createState() => _RecipeSelectScreensState();
}

class _RecipeSelectScreensState extends State<RecipeSelectScreens> {
  // List<Map<String, dynamic>> listData = [];
  List<Map<String, dynamic>> listData = [
    {
      'title': '감자튀김',
      'file_nm': 'assets/images/img_french_fries.jpeg',
      'r_uuid': 'uuid1',
      'info': '레시피 등록 시 입력한 짧은 요리 소개를 출력합니다. 최대 2줄까지 출력할 수 있습니다.',
    },
    {
      'title': '요리이름',
      'file_nm': 'assets/images/img_dakbokkeumtang.jpeg',
      'r_uuid': 'uuid2',
      'info': '레시피 등록 시 입력한 짧은 요리 소개를 출력합니다. 최대 2줄까지 출력할 수 있습니다.',
    },
  ];

  //스크롤 감지
  bool _isLoading = false;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // 뒤로가기
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                ),
              ),
              child: BackButtonWidgets(appBarText: widget.title),
            ),
            // 레시피 리스트
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = listData[index];
                  return RecipeWidgets(
                    recipeName: data['title'],
                    images: data['file_nm'],
                    info: data['info'],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReceiptViewScreens(),
                        ),
                      );
                    },
                  );
                },
                // // 스크롤 제어
                controller: _scrollController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
