import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/screens/condiment_screens.dart';
import 'package:refrigerator_recipe_app/screens/receipt_add_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/navigation_bar_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/registration_mod_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/tab_bar_widgets.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                //앱 상단 바
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CancellationBackButtonWidgets(
                    appBarText: '냉장고  ',
                    onPressed1: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CondimentScreens(),
                        ),
                      );
                    },
                    onPressed2: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReceiptAddScreens(),
                        ),
                      );
                    },
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaWidth(context, 0.05)),
                    child: Container(
                      child: fourTabBarWidgets(),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    //보더 둥글게
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    //자동 패딩 제거
                    minimumSize: MaterialStateProperty.all(Size.zero),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      isDismissible: false,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: MediaHeight(context, 0.88),
                          child: AddIngredientsModalWidgets(remember: false),
                        );
                      },
                    );
                  },
                  child: SvgPicture.string('''
                  <svg width="55" height="55" viewBox="0 0 55 55" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <circle cx="27.5" cy="27.5" r="27.5" fill="#FF9100"/>
                  <line x1="14" y1="28.4636" x2="40.8095" y2="28.4636" stroke="white" stroke-width="2" stroke-linecap="round"/>
                  <line x1="27.4624" y1="40.8096" x2="27.4624" y2="14" stroke="white" stroke-width="2" stroke-linecap="round"/>
                  </svg>
                  ''')),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          child: NavigationBarWidget(
            selectedIndex: 0,
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
