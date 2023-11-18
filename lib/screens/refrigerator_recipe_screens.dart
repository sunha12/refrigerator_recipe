import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/screens/refrigerator_recipe_search_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/navigation_bar_widgets.dart';

class RefrigeratorRecipeScreens extends StatefulWidget {
  const RefrigeratorRecipeScreens({super.key});

  @override
  State<RefrigeratorRecipeScreens> createState() =>
      _RefrigeratorRecipeScreensState();
}

class _RefrigeratorRecipeScreensState extends State<RefrigeratorRecipeScreens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: //앱 상단 바
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                ),
              ),
              child: AppBerWidgets(
                appBarText: '냉장고 속 레시피',
              ),
            ),
            //설명
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaWidth(context, 0.045), vertical: 13),
              child: Container(
                width: MediaWidth(context, 1),
                decoration: BoxDecoration(
                  color: Color(0xffF9F9F9),
                  border: Border.all(width: 1, color: AppTheme.gray_D4),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 18, bottom: 4, left: MediaWidth(context, 0.04)),
                      child: Text(
                        '냉장고 속 레시피가 뭔가요?',
                        style: TextStyle(
                          color: Color(0xff272727),
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaWidth(context, 0.045), bottom: 18),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                                'assets/icons/ico_polygon.svg'),
                          ),
                          RichText(
                            softWrap: true,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '냉장고 속 레시피',
                                  style: TextStyle(
                                    color: AppTheme.orange,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '는\n선택한 재료만으로 만들 수 있는\n최적의 레시피를 추천해 드립니다.',
                                  style: TextStyle(
                                    color: AppTheme.gray_deep,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            //재료 추가
            IngredientAddButtonWidgets(
              text: '재료 추가',
              onPressed: () {},
            ),
            //조미료 추가
            IngredientAddButtonWidgets(
              text: '조미료 추가',
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: LongButtonWidgets(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RefrigeratorRecipeSearchScreens(),
                      ),
                    );
                  },
                  colorId: AppTheme.orange,
                  buttonText: '레시피 찾아보기',
                  iconUrl: ''),
            )
          ],
        ),
        bottomNavigationBar: Container(
          child: NavigationBarWidget(
            selectedIndex: 2,
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
