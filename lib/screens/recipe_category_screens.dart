import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/screens/recipe_select_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/navigation_bar_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/recipe_category_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/recipe_fild_widgets.dart';

class RecipeCategoryScreens extends StatefulWidget {
  const RecipeCategoryScreens({super.key});

  @override
  State<RecipeCategoryScreens> createState() => _RecipeCategoryScreensState();
}

class _RecipeCategoryScreensState extends State<RecipeCategoryScreens> {
  List<Map<String, dynamic>> listData = [
    {
      'title': '감자튀김',
      'file_nm': 'assets/images/img_french_fries.jpeg',
      'r_uuid': 'uuid1',
    },
    {
      'title': '요리이름',
      'file_nm': 'assets/images/img_dakbokkeumtang.jpeg',
      'r_uuid': 'uuid2',
    },
  ];

  //스크롤 감지
  bool _isLoading = false;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '레시피 카테고리',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              // fontWeight: FontWeight.bold,
            ),
          ),
          shape: Border(
            bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: RecipeCategoryWidgets(
                  text1: '한식',
                  text2: '일식',
                  img1: 'assets/images/img_korean.webp',
                  img2: 'assets/images/img_japanese.jpg',
                ),
              ),
              RecipeCategoryWidgets(
                text1: '중식',
                text2: '양식',
                img1: 'assets/images/img_chinese.jpg',
                img2: 'assets/images/img_europe.jpg',
              ),
              RecipeCategoryWidgets(
                text1: '퓨전 음식',
                text2: '디저트',
                img1: 'assets/images/img_fusion.webp',
                img2: 'assets/images/img_dessert.jpg',
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 15, left: MediaWidth(context, 0.04)),
                child: Text(
                  '지금 사람들이 많이 찾는 음식',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
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
            ],
          ),
        ),
        bottomNavigationBar: Container(
          child: NavigationBarWidget(
            selectedIndex: 3,
            onItemTapped: _onItemTapped,
          ),
        ),
      ),
    );
  }

//네비게이션 함수
  void _onItemTapped(int index) {
    // 선택한 아이템의 인덱스에 따라 화면 전환 처리
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, 'home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, 'refrigeratorConsumption');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, 'refrigeratorRecipe');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, 'recipeCategory');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, 'MyPage');
        break;
    }
  }
}
