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

class RefrigeratorConsumptionScreens extends StatefulWidget {
  const RefrigeratorConsumptionScreens({super.key});

  @override
  State<RefrigeratorConsumptionScreens> createState() =>
      _RefrigeratorConsumptionScreensState();
}

class _RefrigeratorConsumptionScreensState
    extends State<RefrigeratorConsumptionScreens> {
  // List<Map<String, dynamic>> listData = [];
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
        body: //앱 상단 바
            Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                ),
              ),
              child: AppBerWidgets(
                appBarText: '냉장고 파먹기',
              ),
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
        bottomNavigationBar: Container(
          child: NavigationBarWidget(
            selectedIndex: 1,
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
