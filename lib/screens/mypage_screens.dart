import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/mypage_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/navigation_bar_widgets.dart';
import 'package:refrigerator_recipe_app/screens/settings.dart';

class MyPageScreens extends StatefulWidget {
  const MyPageScreens({super.key});

  @override
  State<MyPageScreens> createState() => _MyPageScreensState();
}

class _MyPageScreensState extends State<MyPageScreens> {
  List<Map<String, dynamic>> myRecipes = [];

  @override
  void initState() {
    super.initState();
    fetchMyRecipes();
  }

  Future<void> fetchMyRecipes() async {
    var response = await http.get(
      Uri.parse('http://localhost:4513/my-recipes?userIdx=1'),
      headers: {
        "Content-Type": "application/json",
        // 필요하다면 인증 헤더 추가
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        myRecipes = List<Map<String, dynamic>>.from(
          data.map((item) => {
            'image': item['rcp_image'],
            'name': item['rcp_nm'],
          })
        );
      });
    } else {
      // 에러 처리 또는 에러 메시지 표시
      print('레시피를 가져오는 데 실패했습니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text('마이페이지', style: TextStyle(color: Colors.black, fontSize: 20)),
              backgroundColor: Color(0xffffffff),
              elevation: 0,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/ico_setting.svg'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Settings()),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Center(child: Image.asset('assets/images/img_dessert.jpg', width: 95, height: 95)),
            SizedBox(height: 8.0),
            Center(child: Text("닉네임", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))),
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
              child: GridView.builder(
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
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(myRecipes[index]['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        myRecipes[index]['name'],
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
          ],
        ),
        bottomNavigationBar: NavigationBarWidget(selectedIndex: 4, onItemTapped: _onItemTapped),
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
