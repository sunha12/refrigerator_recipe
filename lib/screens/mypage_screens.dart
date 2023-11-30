import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/mypage_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/navigation_bar_widgets.dart';
import 'package:refrigerator_recipe_app/screens/mypage_recently_viewed_recipes_screens.dart';
import 'package:refrigerator_recipe_app/screens/settings.dart';
import 'package:refrigerator_recipe_app/screens/mypage_scrap_screens.dart';

class MyPageScreens extends StatefulWidget {
  const MyPageScreens({super.key});

  @override
  State<MyPageScreens> createState() => _MyPageScreensState();
}

class _MyPageScreensState extends State<MyPageScreens> {
  final List<Map<String, String>> myRecipes = List.generate(
    16,
    (index) => {
      'image': index % 2 == 0
          ? 'assets/images/img_dessert.jpg'
          : 'assets/images/img_europe.jpg',
      'name': '레시피 ${index + 1}'
    },
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            AppBar(
              // 뒤로가기 숨김
              automaticallyImplyLeading: false,
              title: Text(
                '마이페이지',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Color(0xffffffff),
              elevation: 0, // 그림자 제거
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/ico_setting.svg'),
                    iconSize: 26,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Settings(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Center(
              child: Image.network(
                // 'https://api.gooodall.com/files/${widget.images}',
                // 'assets/images/img_dessert.jpg',
                '',
                fit: BoxFit.cover, // 이미지를 위젯 크기에 맞추기 위해 fit 설정
                width: 95,
                height: 95,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.account_circle_rounded, // 사용자 프로필 아이콘으로 변경
                    size: 95, // 아이콘 크기 조절
                    color: Color(0xffD4D4D4), // 아이콘 색상 설정
                  );
                },
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Text(
                "닉네임",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.5, color: AppTheme.gray_D9),
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_D9),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 8, horizontal: MediaWidth(context, 0.03)),
                child: Text(
                  "레시피 스크랩",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //레시피 스크랩 버튼들
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: MouseRegion(
                // 호버 상태에서의 색상 설정
                onHover: (_) {},
                child: MypageWidget(),
              ),
            ),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.5, color: AppTheme.gray_D9),
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_D9),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 8, horizontal: MediaWidth(context, 0.03)),
                child: Text(
                  "나의 레시피",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                  ),
                  itemCount: myRecipes.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 75,
                          height: 75,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(10), // 둥근 모서리 반지름 값
                            child: Image.network(
                              // 'https://api.gooodall.com/files/${widget.images}',
                              myRecipes[index]['image'].toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          myRecipes[index]['name'].toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.gray_4A,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          child: NavigationBarWidget(
            selectedIndex: 4,
            onItemTapped: _onItemTapped,
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
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
