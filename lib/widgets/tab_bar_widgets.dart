import 'dart:convert';

import 'package:flutter/material.dart'; // 기본 위젯 테마 요소 사용
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:refrigerator_recipe_app/provider/ingredient.dart';
import 'package:refrigerator_recipe_app/screens/ingredient_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart'; // style
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:refrigerator_recipe_app/utils/shared_preferences.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
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
      'file_nm': 'assets/images/img_potato.png',
      'r_uuid': 'uuid1',
      'dete': '2023-11-13',
      'count': '3'
    },
    {
      'title': '고구마',
      'file_nm': 'assets/images/img_sweet_potato.png',
      'r_uuid': 'uuid2',
      'dete': '2023-10-25',
      'count': '2'
    },
    {
      'title': '요거트',
      'file_nm': 'assets/images/img_icecream_sundae.png',
      'r_uuid': 'uuid3',
      'dete': '2023-10-25',
      'count': '1'
    },
    {
      'title': '소고기',
      'file_nm': 'assets/images/img_kawaii_steak.png',
      'r_uuid': 'uuid4',
      'dete': '2023-10-25',
      'count': '1'
    },
  ];

  List<Map<String, dynamic>> listData2 = [
    {
      'title': '감자',
      'file_nm': 'assets/images/img_potato.png',
      'r_uuid': 'uuid1',
      'dete': '2023-11-13',
      'count': '3'
    },
    {
      'title': '고구마',
      'file_nm': 'assets/images/img_sweet_potato.png',
      'r_uuid': 'uuid2',
      'dete': '2023-10-25',
      'count': '1'
    },
  ];

  List<Map<String, dynamic>> listData3 = [
    {
      'title': '소고기',
      'file_nm': 'assets/images/img_kawaii_steak.png',
      'r_uuid': 'uuid4',
      'dete': '2023-10-25',
      'count': '1'
    },
  ];

  List<Map<String, dynamic>> listData4 = [
    {
      'title': '요거트',
      'file_nm': 'assets/images/img_icecream_sundae.png',
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
  final bool remember;

  const IngredientsTabBarWidgets({
    super.key,
    required this.remember,
  });
  @override
  _IngredientsTabBarWidgetsState createState() =>
      _IngredientsTabBarWidgetsState();
}

class _IngredientsTabBarWidgetsState extends State<IngredientsTabBarWidgets>
    with SingleTickerProviderStateMixin {
  final Ingredient ingredientDate = Get.put(Ingredient());

  int _selectedPageIndex = 0; // 현재 선택된 탭 인덱스
  // 탭바 선언
  TabController? _tabController;

  TextEditingController _searchController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this, initialIndex: 0);
    init();
  }

  final List<Map<String, dynamic>> listData1 = [
    {
      'title': '당근',
      'file_nm': 'assets/images/img_carrot.png',
    },
    {
      'title': '마늘',
      'file_nm': 'assets/images/img_garlic.png',
    },
    {
      'title': '아스파라거스',
      'file_nm': 'assets/images/img_asparagus.png',
    },
    {
      'title': '토마토',
      'file_nm': 'assets/images/img_tomato.png',
    },
    {
      'title': '토마토',
      'file_nm': 'assets/images/img_tomato.png',
    },
    {
      'title': '당근',
      'file_nm': 'assets/images/img_carrot.png',
    },
    {
      'title': '마늘',
      'file_nm': 'assets/images/img_garlic.png',
    },
    {
      'title': '아스파라거스',
      'file_nm': 'assets/images/img_asparagus.png',
    },
    {
      'title': '토마토',
      'file_nm': 'assets/images/img_tomato.png',
    },
    {
      'title': '토마토',
      'file_nm': 'assets/images/img_tomato.png',
    },
    {
      'title': '당근',
      'file_nm': 'assets/images/img_carrot.png',
    },
    {
      'title': '마늘',
      'file_nm': 'assets/images/img_garlic.png',
    },
    {
      'title': '아스파라거스',
      'file_nm': 'assets/images/img_asparagus.png',
    },
    {
      'title': '토마토',
      'file_nm': 'assets/images/img_tomato.png',
    },
    {
      'title': '토마토',
      'file_nm': 'assets/images/img_tomato.png',
    },
    {
      'title': '당근',
      'file_nm': 'assets/images/img_carrot.png',
    },
    {
      'title': '마늘',
      'file_nm': 'assets/images/img_garlic.png',
    },
    {
      'title': '아스파라거스',
      'file_nm': 'assets/images/img_asparagus.png',
    },
  ];

  List<Map<String, dynamic>> selectData = [];

  void init() {
    if (widget.remember == true) {
      setState(() {
        selectData = ingredientDate.ingredientsDate.value;
      });
      String stringData = json.encode(ingredientDate.ingredientsDate.value);
      saveData('saveIngredients', stringData);
    }
  }

  //선택한 재료 저장
  void saveIngredients(Map<String, dynamic> newData) async {
    // 이전 데이터 불러오기
    String savedData = await loadData('saveIngredients');

    try {
      List<Map<String, dynamic>> existingData = [];

      if (savedData != null && savedData.isNotEmpty) {
        existingData = jsonDecode(savedData).cast<Map<String, dynamic>>();
      }

      // 기존 데이터와 새로운 데이터 합치기
      existingData.add(newData);

      // 합쳐진 데이터를 저장
      String mergedDataString = json.encode(existingData);
      saveData('saveIngredients', mergedDataString);

      loadIngredients();
    } catch (e) {
      // 오류 처리
    }
  }

// 선택한 재료 삭제
  void delIngredients(Map<String, dynamic> dataToRemove) async {
    String savedData = await loadData('saveIngredients');

    try {
      List<Map<String, dynamic>> existingData = [];

      if (savedData != null && savedData.isNotEmpty) {
        existingData = jsonDecode(savedData).cast<Map<String, dynamic>>();

        // 데이터에서 삭제할 아이템 찾기
        existingData.removeWhere((item) =>
            item['title'] == dataToRemove['title'] &&
            item['file_nm'] == dataToRemove['file_nm']);

        // 수정된 데이터 저장
        String updatedDataString = json.encode(existingData);
        saveData('saveIngredients', updatedDataString);

        loadIngredients(); // 수정된 데이터 로드
      }
    } catch (e) {
      // 오류 처리
    }
  }

  //선택한 재료 로드
  void loadIngredients() async {
    String date = await loadData('saveIngredients');

    try {
      if (date != null && date.isNotEmpty) {
        // JSON 문자열을 List<Map<String, dynamic>>으로 변환
        List<dynamic> decodedData = jsonDecode(date);
        List<Map<String, dynamic>> searchList =
            decodedData.cast<Map<String, dynamic>>();

        setState(() {
          selectData = searchList;
          // print(':::::::::::2222222222${selectData}');
        });
      }
    } catch (e) {
      print(':::::${e}');
    }
  }

  //재료 임시저장
  void save() async {
    // 이전 데이터 불러오기
    String savedData = await loadData('saveIngredients');

    try {
      List<Map<String, dynamic>> existingData = [];

      if (savedData != null &&
          savedData.isNotEmpty &&
          widget.remember == true) {
        existingData = jsonDecode(savedData).cast<Map<String, dynamic>>();
        ingredientDate.loadIngredient(existingData);
      }
    } catch (e) {
      // 오류 처리
    }
  }

  @override
  void dispose() {
    //종료되면 데이터 리셋
    saveData('saveIngredients', '');
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //선택된 재료 필드
                        selectData.isNotEmpty
                            ? Container(
                                height: MediaHeight(context, 0.09),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: MediaWidth(context, 0.04)),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    // physics: NeverScrollableScrollPhysics(),
                                    itemCount: selectData.length,
                                    itemBuilder: (context, index) {
                                      Map<String, dynamic> data =
                                          selectData[index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                100)),
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color(0xffEBEBEB),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50), // 둥근 모서리 반지름 값
                                                      //child: Image.network(
                                                      child: Image.asset(
                                                        // 'https://api.gooodall.com/files/${widget.images}',
                                                        data['file_nm'],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      delIngredients(
                                                          selectData[index]);
                                                    },
                                                    child: Opacity(
                                                      opacity: 0.4,
                                                      child: Icon(
                                                        Icons.cancel_rounded,
                                                        color: Colors.black87,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              data['title'],
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppTheme.gray_4A),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    // // 스크롤 제어
                                    controller: _scrollController,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        //검색
                        SearchWidgets(
                          controller: _searchController,
                          onPressed: () {},
                        ),
                        //재료 필드
                        Container(
                          height: selectData.isEmpty
                              ? MediaHeight(context, 0.56)
                              : MediaHeight(context, 0.47),
                          child: GridView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 0.9,
                            ),
                            itemCount: listData1.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> data = listData1[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      saveIngredients(listData1[index]);
                                      // loadIngredients();
                                    },
                                    child: Container(
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xffEBEBEB),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              50), // 둥근 모서리 반지름 값
                                          //child: Image.network(
                                          child: Image.asset(
                                            // 'https://api.gooodall.com/files/${widget.images}',
                                            data['file_nm'],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data['title'],
                                    style: TextStyle(
                                        fontSize: 15, color: AppTheme.gray_4A),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),

                        //추가 버튼
                        LongButtonWidgets(
                          onPressed: () {
                            Navigator.pop(context);
                            save();
                          },
                          colorId: AppTheme.orange,
                          buttonText: "추가하기",
                          iconUrl: "",
                        ),
                      ],
                    )
                  ],
                ),
                // 두 번째 탭뷰
                PageView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //선택된 재료 필드
                        selectData.isNotEmpty
                            ? Container(
                                height: MediaHeight(context, 0.09),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: MediaWidth(context, 0.04)),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    // physics: NeverScrollableScrollPhysics(),
                                    itemCount: selectData.length,
                                    itemBuilder: (context, index) {
                                      Map<String, dynamic> data =
                                          selectData[index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                100)),
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color(0xffEBEBEB),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50), // 둥근 모서리 반지름 값
                                                      //child: Image.network(
                                                      child: Image.asset(
                                                        // 'https://api.gooodall.com/files/${widget.images}',
                                                        data['file_nm'],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      delIngredients(
                                                          selectData[index]);
                                                    },
                                                    child: Opacity(
                                                      opacity: 0.4,
                                                      child: Icon(
                                                        Icons.cancel_rounded,
                                                        color: Colors.black87,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              data['title'],
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppTheme.gray_4A),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    // // 스크롤 제어
                                    controller: _scrollController,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        //검색
                        SearchWidgets(
                          controller: _searchController,
                          onPressed: () {},
                        ),
                        //재료 필드
                        Container(
                          height: selectData.isEmpty
                              ? MediaHeight(context, 0.56)
                              : MediaHeight(context, 0.47),
                          child: GridView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 0.9,
                            ),
                            itemCount: listData1.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> data = listData1[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      saveIngredients(listData1[index]);
                                      // loadIngredients();
                                    },
                                    child: Container(
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xffEBEBEB),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              50), // 둥근 모서리 반지름 값
                                          //child: Image.network(
                                          child: Image.asset(
                                            // 'https://api.gooodall.com/files/${widget.images}',
                                            data['file_nm'],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data['title'],
                                    style: TextStyle(
                                        fontSize: 15, color: AppTheme.gray_4A),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),

                        //추가 버튼
                        LongButtonWidgets(
                          onPressed: () {
                            Navigator.pop(context);
                            save();
                          },
                          colorId: AppTheme.orange,
                          buttonText: "추가하기",
                          iconUrl: "",
                        ),
                      ],
                    )
                  ],
                ),
                // 세 번째 탭뷰
                PageView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //선택된 재료 필드
                        selectData.isNotEmpty
                            ? Container(
                                height: MediaHeight(context, 0.09),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: MediaWidth(context, 0.04)),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    // physics: NeverScrollableScrollPhysics(),
                                    itemCount: selectData.length,
                                    itemBuilder: (context, index) {
                                      Map<String, dynamic> data =
                                          selectData[index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                100)),
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color(0xffEBEBEB),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50), // 둥근 모서리 반지름 값
                                                      child: Image.asset(
                                                        // 'https://api.gooodall.com/files/${widget.images}',
                                                        data['file_nm'],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      delIngredients(
                                                          selectData[index]);
                                                    },
                                                    child: Opacity(
                                                      opacity: 0.4,
                                                      child: Icon(
                                                        Icons.cancel_rounded,
                                                        color: Colors.black87,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              data['title'],
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppTheme.gray_4A),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    // // 스크롤 제어
                                    controller: _scrollController,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        //검색
                        SearchWidgets(
                          controller: _searchController,
                          onPressed: () {},
                        ),
                        //재료 필드
                        Container(
                          height: selectData.isEmpty
                              ? MediaHeight(context, 0.56)
                              : MediaHeight(context, 0.47),
                          child: GridView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 0.9,
                            ),
                            itemCount: listData1.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> data = listData1[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      saveIngredients(listData1[index]);
                                      // loadIngredients();
                                    },
                                    child: Container(
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xffEBEBEB),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              50), // 둥근 모서리 반지름 값
                                          //child: Image.network(
                                          child: Image.asset(
                                            // 'https://api.gooodall.com/files/${widget.images}',
                                            data['file_nm'],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data['title'],
                                    style: TextStyle(
                                        fontSize: 15, color: AppTheme.gray_4A),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),

                        //추가 버튼
                        LongButtonWidgets(
                          onPressed: () {
                            Navigator.pop(context);
                            save();
                          },
                          colorId: AppTheme.orange,
                          buttonText: "추가하기",
                          iconUrl: "",
                        ),
                      ],
                    )
                  ],
                ),
                // 네 번째 탭뷰
                PageView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //선택된 재료 필드
                        selectData.isNotEmpty
                            ? Container(
                                height: MediaHeight(context, 0.09),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: MediaWidth(context, 0.04)),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    // physics: NeverScrollableScrollPhysics(),
                                    itemCount: selectData.length,
                                    itemBuilder: (context, index) {
                                      Map<String, dynamic> data =
                                          selectData[index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                100)),
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color(0xffEBEBEB),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50), // 둥근 모서리 반지름 값
                                                      //child: Image.network(
                                                      child: Image.asset(
                                                        // 'https://api.gooodall.com/files/${widget.images}',
                                                        data['file_nm'],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      delIngredients(
                                                          selectData[index]);
                                                    },
                                                    child: Opacity(
                                                      opacity: 0.4,
                                                      child: Icon(
                                                        Icons.cancel_rounded,
                                                        color: Colors.black87,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              data['title'],
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppTheme.gray_4A),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    // // 스크롤 제어
                                    controller: _scrollController,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        //검색
                        SearchWidgets(
                          controller: _searchController,
                          onPressed: () {},
                        ),
                        //재료 필드
                        Container(
                          height: selectData.isEmpty
                              ? MediaHeight(context, 0.56)
                              : MediaHeight(context, 0.47),
                          child: GridView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 0.9,
                            ),
                            itemCount: listData1.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> data = listData1[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      saveIngredients(listData1[index]);
                                      // loadIngredients();
                                    },
                                    child: Container(
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xffEBEBEB),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              50), // 둥근 모서리 반지름 값
                                          //child: Image.network(
                                          child: Image.asset(
                                            // 'https://api.gooodall.com/files/${widget.images}',
                                            data['file_nm'],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data['title'],
                                    style: TextStyle(
                                        fontSize: 15, color: AppTheme.gray_4A),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),

                        //추가 버튼
                        LongButtonWidgets(
                          onPressed: () {
                            Navigator.pop(context);
                            save();
                          },
                          colorId: AppTheme.orange,
                          buttonText: "추가하기",
                          iconUrl: "",
                        ),
                      ],
                    )
                  ],
                ),
                // 다섯 번째 탭뷰
                PageView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //선택된 재료 필드
                        selectData.isNotEmpty
                            ? Container(
                                height: MediaHeight(context, 0.09),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: MediaWidth(context, 0.04)),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    // physics: NeverScrollableScrollPhysics(),
                                    itemCount: selectData.length,
                                    itemBuilder: (context, index) {
                                      Map<String, dynamic> data =
                                          selectData[index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                100)),
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color(0xffEBEBEB),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50), // 둥근 모서리 반지름 값
                                                      //child: Image.network(
                                                      child: Image.asset(
                                                        // 'https://api.gooodall.com/files/${widget.images}',
                                                        data['file_nm'],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      delIngredients(
                                                          selectData[index]);
                                                    },
                                                    child: Opacity(
                                                      opacity: 0.4,
                                                      child: Icon(
                                                        Icons.cancel_rounded,
                                                        color: Colors.black87,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              data['title'],
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppTheme.gray_4A),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    // // 스크롤 제어
                                    controller: _scrollController,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        //검색
                        SearchWidgets(
                          controller: _searchController,
                          onPressed: () {},
                        ),
                        //재료 필드
                        Container(
                          height: selectData.isEmpty
                              ? MediaHeight(context, 0.56)
                              : MediaHeight(context, 0.47),
                          child: GridView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 0.9,
                            ),
                            itemCount: listData1.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> data = listData1[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      saveIngredients(listData1[index]);
                                      // loadIngredients();
                                    },
                                    child: Container(
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xffEBEBEB),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              50), // 둥근 모서리 반지름 값
                                          //child: Image.network(
                                          child: Image.asset(
                                            // 'https://api.gooodall.com/files/${widget.images}',
                                            data['file_nm'],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data['title'],
                                    style: TextStyle(
                                        fontSize: 15, color: AppTheme.gray_4A),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),

                        //추가 버튼
                        LongButtonWidgets(
                          onPressed: () {
                            Navigator.pop(context);
                            save();
                          },
                          colorId: AppTheme.orange,
                          buttonText: "추가하기",
                          iconUrl: "",
                        ),
                      ],
                    )
                  ],
                ),
                // 여섯 번째 탭뷰
                PageView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //선택된 재료 필드
                        selectData.isNotEmpty
                            ? Container(
                                height: MediaHeight(context, 0.09),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: MediaWidth(context, 0.04)),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    // physics: NeverScrollableScrollPhysics(),
                                    itemCount: selectData.length,
                                    itemBuilder: (context, index) {
                                      Map<String, dynamic> data =
                                          selectData[index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                100)),
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color(0xffEBEBEB),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50), // 둥근 모서리 반지름 값
                                                      //child: Image.network(
                                                      child: Image.asset(
                                                        // 'https://api.gooodall.com/files/${widget.images}',
                                                        data['file_nm'],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      delIngredients(
                                                          selectData[index]);
                                                    },
                                                    child: Opacity(
                                                      opacity: 0.4,
                                                      child: Icon(
                                                        Icons.cancel_rounded,
                                                        color: Colors.black87,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              data['title'],
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppTheme.gray_4A),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    // // 스크롤 제어
                                    controller: _scrollController,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        //검색
                        SearchWidgets(
                          controller: _searchController,
                          onPressed: () {},
                        ),
                        //재료 필드
                        Container(
                          height: selectData.isEmpty
                              ? MediaHeight(context, 0.56)
                              : MediaHeight(context, 0.47),
                          child: GridView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 0.9,
                            ),
                            itemCount: listData1.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> data = listData1[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      saveIngredients(listData1[index]);
                                      // loadIngredients();
                                    },
                                    child: Container(
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xffEBEBEB),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              50), // 둥근 모서리 반지름 값
                                          //child: Image.network(
                                          child: Image.asset(
                                            // 'https://api.gooodall.com/files/${widget.images}',
                                            data['file_nm'],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data['title'],
                                    style: TextStyle(
                                        fontSize: 15, color: AppTheme.gray_4A),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),

                        //추가 버튼
                        LongButtonWidgets(
                          onPressed: () {
                            Navigator.pop(context);
                            save();
                          },
                          colorId: AppTheme.orange,
                          buttonText: "추가하기",
                          iconUrl: "",
                        ),
                      ],
                    )
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
