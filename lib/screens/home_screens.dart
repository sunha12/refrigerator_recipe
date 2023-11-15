import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/navigation_bar_widgets.dart';

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
        body: //앱 상단 바
            Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaWidth(context, 0.01)),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xffffffff),
            elevation: 0, // 그림자 제거
            leadingWidth: MediaWidth(context, 0.22), // 왼쪽 영역의 너비 설정
            leading: Container(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(),
              // Image.asset(
              //   'assets/icons/ico_fridge_with_open_freezer_select.svg',
              //   alignment: Alignment.centerLeft,
              //   fit: BoxFit.contain,
              // ),
            ),
            actions: [
              // // 알림 아이콘
              // IconButton(
              //   icon: SvgPicture.asset("assets/icons/ico_notice.svg"),
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => AlertScreens(
              //                 patImage: '',
              //               )),
              //     );
              //   },
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: ModeChangeButtonWidgets(
              //       onPressed: () {
              //         saveData('ownerhome', 'false');
              //         saveData('userhome', 'true');
              //         Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => HomeScreens()),
              //         );
              //       },
              //       buttonText: '입양 모드',
              //       iconUrl: 'assets/icons/ico_mode_change.svg'),
              // )
            ],
          ),
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
