import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/provider/ingredient.dart';
import 'package:refrigerator_recipe_app/screens/recipe_select_screens.dart';
import 'package:refrigerator_recipe_app/screens/refrigerator_recipe_search_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/utils/shared_preferences.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/navigation_bar_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/registration_mod_widgets.dart';

class RefrigeratorRecipeScreens extends StatefulWidget {
  const RefrigeratorRecipeScreens({super.key});

  @override
  State<RefrigeratorRecipeScreens> createState() =>
      _RefrigeratorRecipeScreensState();
}

class _RefrigeratorRecipeScreensState extends State<RefrigeratorRecipeScreens> {
  final Ingredient ingredientDate = Get.put(Ingredient());

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //데이터 리셋
    ingredientDate.loadIngredient(<Map<String, dynamic>>[]);
    ingredientDate.loadCondiment(<Map<String, dynamic>>[]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: //앱 상단 바
            Obx(
          () => Column(
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
                            top: 18,
                            bottom: 4,
                            left: MediaWidth(context, 0.04)),
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
                                      color: AppTheme.gray_4A,
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
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IngredientAddButtonWidgets(
                      text: '식재료 추가',
                      essential: false,
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: false,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: MediaHeight(context, 0.88),
                              child: AddIngredientsModalWidgets(remember: true),
                            );
                          },
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        width: MediaWidth(context, 0.70),
                        height: 70,
                        child: GridView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            childAspectRatio: 1.5,
                          ),
                          itemCount:
                              ingredientDate.ingredientsDate.value.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> data =
                                ingredientDate.ingredientsDate.value[index];
                            return Container(
                              width: 30,
                              height: 30,
                              // child: Image.network(
                              child: Image.asset(
                                // 'https://api.gooodall.com/files/${widget.images}',
                                data['file_nm'],
                                fit: BoxFit.fitHeight,
                                width: 30,
                                height: 30,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //조미료 추가
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IngredientAddButtonWidgets(
                    text: '조미료 추가',
                    essential: false,
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        isDismissible: false,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: MediaHeight(context, 0.88),
                            child: AddCondimentModalWidgets(remember: true),
                          );
                        },
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      width: MediaWidth(context, 0.70),
                      height: 70,
                      child: GridView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: ingredientDate.condimentDate.value.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 30,
                            height: 30,
                            // child: Image.network(
                            child: Image.asset(
                              // 'https://api.gooodall.com/files/${widget.images}',
                              ingredientDate.condimentDate.value[index]
                                  ['file_nm'],
                              fit: BoxFit.fitHeight,
                              width: 30,
                              height: 30,
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: LongButtonWidgets(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeSelectScreens(
                            title: '냉장고 속 레시피',
                          ),
                        ),
                      );
                    },
                    colorId: AppTheme.orange,
                    buttonText: '레시피 찾아보기',
                    iconUrl: ''),
              )
            ],
          ),
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
