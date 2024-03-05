import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:refrigerator_recipe_app/provider/ingredient.dart';
import 'package:refrigerator_recipe_app/provider/time_update.dart';
import 'package:refrigerator_recipe_app/screens/home_screens.dart';
import 'package:refrigerator_recipe_app/screens/mypage_screens.dart';
import 'package:refrigerator_recipe_app/screens/recipe_category_screens.dart';
import 'package:refrigerator_recipe_app/screens/refrigerator_consumption_screens.dart';
import 'package:refrigerator_recipe_app/screens/refrigerator_recipe_screens.dart';
import 'package:refrigerator_recipe_app/screens/splash_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';

void main() {
  runApp(const MyApp());

  // runApp(
  //   DevicePreview(
  //       enabled: !kReleaseMode,
  //       builder: (context) => const MyApp()), //디바이스 패키지 관련 추가
  // );
  Get.put(TimerUpdate()); // TimerUpdate 클래스 등록
  Get.put(Ingredient()); // IngredientS 클래스 등록
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
        primaryColor: AppTheme.darkText1, // font color
        // textTheme: AppTheme.textTheme,

        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),

      useInheritedMediaQuery: true, //디바이스 패키지 관련 추가

      routes: {
        'Splash': (context) => SplashScreens(), // 스플래시
        'home': (context) => HomeScreens(), // 홈
        'refrigeratorConsumption': (context) =>
            RefrigeratorConsumptionScreens(), // 냉장고 파먹기
        'refrigeratorRecipe': (context) =>
            RefrigeratorRecipeScreens(), // 냉장고 속 레시피
        'recipeCategory': (context) => RecipeCategoryScreens(), // 레시피 카테고리
        'MyPage': (context) => MyPageScreens(), // 마이페이지
      },

      // 제일 처음 보일 화면
      initialRoute: 'Splash',
    );
  }
}
