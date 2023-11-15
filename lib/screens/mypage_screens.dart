import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/navigation_bar_widgets.dart';

class MyPageScreens extends StatefulWidget {
  const MyPageScreens({super.key});

  @override
  State<MyPageScreens> createState() => _MyPageScreensState();
}

class _MyPageScreensState extends State<MyPageScreens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  fontWeight: FontWeight.bold,
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
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          AssetImage("assets/profile_image.jpg"), // 프로필 사진
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Center(
                    child: Text(
                      "사용자 닉네임",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotoSansKR',
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text("레시피 스크랩",
                      style: TextStyle(
                          fontSize: 18.0, fontFamily: 'NotoSansKR')), // 변경된 부분
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // 최근 본 레시피 화면으로 이동
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => RecentlyViewedRecipes(),
                                ),
                              );
                            },
                            child: Icon(Icons.history), // 최근 본 레시피
                          ),
                          Text("최근 본 레시피",
                              style: TextStyle(fontFamily: 'NotoSansKR')),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.star),
                          Text("스크랩",
                              style: TextStyle(fontFamily: 'NotoSansKR')),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.edit),
                          Text("레시피 등록",
                              style: TextStyle(fontFamily: 'NotoSansKR')),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text("나의 레시피",
                      style:
                          TextStyle(fontSize: 18.0, fontFamily: 'NotoSansKR')),
                  SizedBox(height: 10.0),

                  // GridView.builder(
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 4, // 4개씩 한 줄에 표시
                  //     crossAxisSpacing: 10.0,
                  //     mainAxisSpacing: 10.0,
                  //   ),
                  //   itemCount: myRecipes.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return InkWell(
                  //       onTap: () {
                  //         // 레시피 세부 정보 화면으로 이동
                  //       },
                  //       child: Column(
                  //         children: [
                  //           Image.asset(
                  //             "assets/recipe_image.jpg", // 레시피 사진
                  //             width: 100.0,
                  //             height: 100.0,
                  //             fit: BoxFit.cover,
                  //           ),
                  //           SizedBox(height: 5.0),
                  //           Text(
                  //             myRecipes[index].title,
                  //             style: TextStyle(
                  //                 fontSize: 16.0, fontFamily: 'NotoSansKR'),
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
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

class Recipe {
  final String title;

  Recipe({required this.title});
}

// 가상 레시피 데이터
List<Recipe> myRecipes = [
  Recipe(title: "스파게티"),
  Recipe(title: "피자"),
  Recipe(title: "샐러드"),
  //더미 데이터 추가
];

class RecentlyViewedRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 최근 본 레시피 목록

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: AppTheme.gray_D4),
                ),
              ),
              child: BackButtonWidgets(appBarText: '최근 본 레시피'),
            ),
          ],
        ),
      ),
    );
  }
}
