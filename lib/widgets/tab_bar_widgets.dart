import 'package:flutter/material.dart'; // 기본 위젯 테마 요소 사용
import 'package:get/get.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart'; // style
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

//탭이 네개인 탭바
class fourTabBarWidgets extends StatefulWidget {
  const fourTabBarWidgets({super.key});
  @override
  _fourTabBarWidgetsState createState() => _fourTabBarWidgetsState();
}

class _fourTabBarWidgetsState extends State<fourTabBarWidgets>
    with SingleTickerProviderStateMixin {
  // 탭바 선언
  TabController? _tabController;
  // PageController _pageController = PageController(initialPage: 0);

  int _selectedPageIndex = 0; // 현재 선택된 탭 인덱스

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    // _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int allCount = 3;
    int vegetableCount = 0;
    int meatCount = 0;
    int processCount = 0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: AppTheme.orange,
            labelColor: Colors.black,
            unselectedLabelColor: AppTheme.gray_4A,
            labelPadding: EdgeInsets.symmetric(horizontal: 15),

            labelStyle: TextStyle(fontSize: 15), // 폰트 크기 조정
            isScrollable: true,
            overlayColor: MaterialStatePropertyAll(
              Colors.transparent,
            ),
            tabs: [
              Tab(text: '전체 $allCount'),
              Tab(text: '채소 $vegetableCount'),
              Tab(text: '육류 $meatCount'),
              Tab(text: '가공/유제품 $processCount'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              // physics: ScrollPhysics(), // 스크롤 가능하도록 추가
              children: [
                // 첫 번째 탭뷰
                PageView(
                  // controller: _pageController,
                  children: [
                    // SingleChildScrollView(
                    //   child: reservationfildOneScreens(),
                    // ),
                  ],
                ),

                // 두 번째 탭뷰
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('두 번째 탭뷰'),
                    ],
                  ),
                ),
                // 세 번째 탭뷰
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('세 번째 탭뷰'),
                    ],
                  ),
                ),

                // 네 번째 탭뷰
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('네 번째 탭뷰'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
