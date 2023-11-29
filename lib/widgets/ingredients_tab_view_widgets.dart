import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/utils/shared_preferences.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/ingredient_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/search_widgets.dart';

class IngredientsTabViewWidgets extends StatefulWidget {
  final selectDate;
  const IngredientsTabViewWidgets({required this.selectDate, super.key});

  @override
  State<IngredientsTabViewWidgets> createState() =>
      _IngredientsTabViewWidgetsState();
}

class _IngredientsTabViewWidgetsState extends State<IngredientsTabViewWidgets> {
  @override
  Widget build(BuildContext context) {
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
    // List<Map<String, dynamic>> selectData = [];

    TextEditingController _searchController = TextEditingController();
    ScrollController _scrollController = ScrollController();

    print(':::::::::::::ddddddd:::::Ddddd::::${widget.selectDate}');

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
      } catch (e) {
        // 오류 처리
      }
    }

    // //선택한 재료 로드
    // void loadIngredients() async {
    //   String date = await loadData('saveIngredients');

    //   try {
    //     if (date != null && date.isNotEmpty) {
    //       // JSON 문자열을 List<Map<String, dynamic>>으로 변환
    //       List<dynamic> decodedData = jsonDecode(date);
    //       List<Map<String, dynamic>> searchList =
    //           decodedData.cast<Map<String, dynamic>>();

    //       setState(() {
    //         selectData = searchList;
    //         print(':::::::::::2222222222${selectData}');
    //       });
    //     }
    //   } catch (e) {
    //     print(':::::${e}');
    //   }
    // }

    @override
    void dispose() {
      _searchController.dispose();
      super.dispose();
    }

    return Column(
      children: [
        //선택된 재료 필드
        widget.selectDate.isNotEmpty
            ? Container(
                height: MediaHeight(context, 0.09),
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.selectDate.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data = widget.selectDate[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            border: Border.all(
                              width: 1,
                              color: Color(0xffEBEBEB),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(50), // 둥근 모서리 반지름 값
                              child: Image.network(
                                // 'https://api.gooodall.com/files/${widget.images}',
                                data['file_nm'],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          data['title'],
                          style:
                              TextStyle(fontSize: 13, color: AppTheme.gray_4A),
                        ),
                      ],
                    );
                  },
                  // // 스크롤 제어
                  controller: _scrollController,
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
          height: widget.selectDate.isEmpty
              ? MediaHeight(context, 0.57)
              : MediaHeight(context, 0.48),
          // height: widget.selectDate.isNotEmpty
          //     ? MediaHeight(context, 0.57)
          //     : MediaHeight(context, 0.48),
          child: GridView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        border: Border.all(
                          width: 1,
                          color: Color(0xffEBEBEB),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(50), // 둥근 모서리 반지름 값
                          child: Image.network(
                            // 'https://api.gooodall.com/files/${widget.images}',
                            data['file_nm'],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    data['title'],
                    style: TextStyle(fontSize: 15, color: AppTheme.gray_4A),
                  ),
                ],
              );
            },
          ),
        ),

        //추가 버튼
        LongButtonWidgets(
          onPressed: () {},
          colorId: AppTheme.orange,
          buttonText: "추가하기",
          iconUrl: "",
        ),
      ],
    );
  }
}
