import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/models/api_helper.dart';
import 'package:refrigerator_recipe_app/screens/recipe_select_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/navigation_bar_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/recipe_fild_widgets.dart';

class RefrigeratorRecipeSearchScreens extends StatefulWidget {
  const RefrigeratorRecipeSearchScreens({super.key});

  @override
  State<RefrigeratorRecipeSearchScreens> createState() =>
      _RefrigeratorRecipeSearchScreensState();
}

class _RefrigeratorRecipeSearchScreensState
    extends State<RefrigeratorRecipeSearchScreens> {
  // List<Map<String, dynamic>> listData = [];
  List<Map<String, dynamic>> listData = [
    {
      'title': '감자튀김',
      'file_nm': 'assets/images/img_cooking_book_select.png',
      'r_uuid': 'uuid1',
    },
    {
      'title': '요리이름',
      'file_nm': 'assets/images/img_cooking_book_select.png',
      'r_uuid': 'uuid2',
    },
  ];

  String gbn = '';
  String cate = '';
  String gender = '';
  String srchText = '';
  String FilterOptions = '';
  int pageNo = 1;

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
              child: BackButtonWidgets(appBarText: '냉장고 속 레시피'),
            ),
            // 레시피 리스트
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = listData[index];
                  return RecipeFildWidgets(
                    recipeName: data['title'],
                    images: data['file_nm'],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeSelectScreens(
                            title: data['title'],
                          ),
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
