import 'package:flutter/material.dart'; // 기본 위젯 테마 요소 사용
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:refrigerator_recipe_app/screens/ingredient_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart'; // style
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:refrigerator_recipe_app/widgets/ingredient_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/search_widgets.dart';

//탭이 네개인 탭바
class fourTabBarWidgets extends StatefulWidget {
  const fourTabBarWidgets({super.key});
  @override
  _fourTabBarWidgetsState createState() => _fourTabBarWidgetsState();
}

class _fourTabBarWidgetsState extends State<fourTabBarWidgets>
    with SingleTickerProviderStateMixin {
  int _selectedPageIndex = 0; // 현재 선택된 탭 인덱스
  // 탭바 선언
  TabController? _tabController;

  List<Map<String, dynamic>> listData1 = [
    {
      'title': '감자',
      'file_nm': 'assets/images/img_korean.webp',
      'r_uuid': 'uuid1',
      'dete': '2023-11-13',
      'count': '3'
    },
    {
      'title': '고구마',
      'file_nm': 'assets/images/img_cooking_book_select.png',
      'r_uuid': 'uuid2',
      'dete': '2023-10-25',
      'count': '2'
    },
    {
      'title': '요거트',
      'file_nm': 'assets/images/img_cooking_book_select.png',
      'r_uuid': 'uuid3',
      'dete': '2023-10-25',
      'count': '1'
    },
    {
      'title': '소고기',
      'file_nm': 'assets/images/img_cooking_book_select.png',
      'r_uuid': 'uuid4',
      'dete': '2023-10-25',
      'count': '1'
    },
  ];

  List<Map<String, dynamic>> listData2 = [
    {
      'title': '감자',
      'file_nm': 'assets/images/img_cooking_book_select.png',
      'r_uuid': 'uuid1',
      'dete': '2023-11-13',
      'count': '3'
    },
    {
      'title': '고구마',
      'file_nm': 'assets/images/img_cooking_book_select.png',
      'r_uuid': 'uuid2',
      'dete': '2023-10-25',
      'count': '1'
    },
  ];

  List<Map<String, dynamic>> listData3 = [
    {
      'title': '소고기',
      'file_nm': 'assets/images/img_cooking_book_select.png',
      'r_uuid': 'uuid4',
      'dete': '2023-10-25',
      'count': '1'
    },
  ];

  List<Map<String, dynamic>> listData4 = [
    {
      'title': '요거트',
      'file_nm': 'assets/images/img_cooking_book_select.png',
      'r_uuid': 'uuid3',
      'dete': '2023-10-25',
      'count': '1'
    }
  ];

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
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
    int etcCount = 0;

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
            labelStyle: TextStyle(fontSize: 15), // 폰트 크기 조정
            isScrollable: true,
            overlayColor: MaterialStatePropertyAll(
              Colors.transparent,
            ),
            tabs: [
              Tab(text: '전체 $allCount'),
              Tab(text: '채소 $vegetableCount'),
              Tab(text: '육류/어류 $meatCount'),
              Tab(text: '빵/유제품 $processCount'),
              Tab(text: '기타 $etcCount'),
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
                    ListView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: listData1.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data = listData1[index];
                        return IngredientWidgets(
                          ingredientName: data['title'],
                          images: data['file_nm'],
                          dete: data['dete'],
                          count: data['count'],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IngredientScreens(
                                  title: data['title'],
                                  img: data['file_nm'],
                                  dete: data['dete'],
                                  count: true,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      // // 스크롤 제어
                      controller: _scrollController,
                    ),
                  ],
                ),

                // 두 번째 탭뷰
                PageView(
                  // controller: _pageController,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: listData2.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data = listData2[index];
                        return IngredientWidgets(
                          ingredientName: data['title'],
                          images: data['file_nm'],
                          dete: data['dete'],
                          count: data['count'],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IngredientScreens(
                                  title: data['title'],
                                  img: data['file_nm'],
                                  dete: data['dete'],
                                  count: true,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      // // 스크롤 제어
                      controller: _scrollController,
                    ),
                  ],
                ),
                // 세 번째 탭뷰
                PageView(
                  // controller: _pageController,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: listData3.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data = listData3[index];
                        return IngredientWidgets(
                          ingredientName: data['title'],
                          images: data['file_nm'],
                          dete: data['dete'],
                          count: data['count'],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IngredientScreens(
                                  title: data['title'],
                                  img: data['file_nm'],
                                  dete: data['dete'],
                                  count: true,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      // // 스크롤 제어
                      controller: _scrollController,
                    ),
                  ],
                ),

                // 네 번째 탭뷰
                PageView(
                  // controller: _pageController,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: listData4.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data = listData4[index];
                        return IngredientWidgets(
                          ingredientName: data['title'],
                          images: data['file_nm'],
                          dete: data['dete'],
                          count: data['count'],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IngredientScreens(
                                  title: data['title'],
                                  img: data['file_nm'],
                                  dete: data['dete'],
                                  count: true,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      // // 스크롤 제어
                      controller: _scrollController,
                    ),
                  ],
                ),

                //다섯번째 탭뷰
                PageView(
                  // controller: _pageController,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: listData1.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data = listData1[index];
                        return IngredientWidgets(
                          ingredientName: data['title'],
                          images: data['file_nm'],
                          dete: data['dete'],
                          count: data['count'],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IngredientScreens(
                                  title: data['title'],
                                  img: data['file_nm'],
                                  dete: data['dete'],
                                  count: true,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      // // 스크롤 제어
                      controller: _scrollController,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//식재료 탭바
class IngredientsTabBarWidgets extends StatefulWidget {
  const IngredientsTabBarWidgets({super.key});
  @override
  _IngredientsTabBarWidgetsState createState() =>
      _IngredientsTabBarWidgetsState();
}

class _IngredientsTabBarWidgetsState extends State<IngredientsTabBarWidgets>
    with SingleTickerProviderStateMixin {
  int _selectedPageIndex = 0; // 현재 선택된 탭 인덱스
  // 탭바 선언
  TabController? _tabController;

  TextEditingController _searchController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              Tab(text: '채소'),
              Tab(text: '육류'),
              Tab(text: '어류'),
              Tab(text: '가공'),
              Tab(text: '유제품'),
              Tab(text: '기타'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // 첫 번째 탭뷰
                PageView(
                  children: [
                    SearchWidgets(
                      controller: _searchController,
                      onPressed: () {},
                    ),
                  ],
                ),
                // 두 번째 탭뷰
                PageView(
                  children: [
                    SearchWidgets(
                      controller: _searchController,
                      onPressed: () {},
                    ),
                  ],
                ),
                // 세 번째 탭뷰
                PageView(
                  children: [
                    SearchWidgets(
                      controller: _searchController,
                      onPressed: () {},
                    ),
                  ],
                ),
                // 네 번째 탭뷰
                PageView(
                  children: [
                    SearchWidgets(
                      controller: _searchController,
                      onPressed: () {},
                    ),
                  ],
                ),
                // 다섯 번째 탭뷰
                PageView(
                  children: [
                    SearchWidgets(
                      controller: _searchController,
                      onPressed: () {},
                    ),
                  ],
                ),
                // 여섯 번째 탭뷰
                PageView(
                  children: [
                    SearchWidgets(
                      controller: _searchController,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
