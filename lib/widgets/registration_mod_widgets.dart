import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/models/api_helper.dart';
import 'package:refrigerator_recipe_app/provider/ingredient.dart';
import 'package:refrigerator_recipe_app/screens/add_ingredient_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/utils/shared_preferences.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/search_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/tab_bar_widgets.dart';

//식재료 추가
class AddIngredientsModalWidgets extends StatefulWidget {
  final bool remember;

  const AddIngredientsModalWidgets({super.key, required this.remember});
  @override
  _AddIngredientsModalWidgetsState createState() =>
      _AddIngredientsModalWidgetsState();
}

class _AddIngredientsModalWidgetsState
    extends State<AddIngredientsModalWidgets> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Ingredient ingredientDate = Get.put(Ingredient());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaHeight(context, 0.88),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.only(top: 15, left: 20),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: AppTheme.gray_4A,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 20),
                    child: Text(
                      '식재료 추가',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.gray_4A,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  widget.remember != true
                      ? Padding(
                          padding: EdgeInsets.only(top: 15, right: 20),
                          child: InkResponse(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddIngredientScreens(
                                      remember: widget.remember),
                                ),
                              );
                            },
                            child: Text(
                              '직접 입력',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppTheme.gray_4A,
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 15, right: 20),
                          child: Text(
                            '직접입력',
                            style: TextStyle(
                              color: Colors.transparent,
                              fontSize: 14,
                            ),
                          ),
                        ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: IngredientsTabBarWidgets(
                  remember: widget.remember,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//조미료 추가
class AddCondimentModalWidgets extends StatefulWidget {
  final bool remember;

  const AddCondimentModalWidgets({super.key, required this.remember});

  @override
  _AddCondimentModalWidgetsState createState() =>
      _AddCondimentModalWidgetsState();
}

class _AddCondimentModalWidgetsState extends State<AddCondimentModalWidgets> {
  final Ingredient ingredientDate = Get.put(Ingredient());

  @override
  void initState() {
    super.initState();
    init();
  }

  TextEditingController _searchController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> listData1 = [
    {
      'title': '소금',
      'file_nm': 'assets/images/img_salt.png',
    },
    {
      'title': '설탕',
      'file_nm': 'assets/images/img_sugar.png',
    },
    {
      'title': '간장',
      'file_nm': 'assets/images/img_soysauce.png',
    },
    {
      'title': '다시다',
      'file_nm': 'assets/images/img_dasida.png',
    },
  ];

  List<Map<String, dynamic>> selectData = [];

  void init() {
    if (widget.remember == true) {
      setState(() {
        selectData = ingredientDate.condimentDate.value;
      });
      String stringData = json.encode(ingredientDate.condimentDate.value);
      saveData('saveCondiment', stringData);
    }
  }

  //선택한 재료 저장
  void saveCondiment(Map<String, dynamic> newData) async {
    // 이전 데이터 불러오기
    String savedData = await loadData('saveCondiment');

    try {
      List<Map<String, dynamic>> existingData = [];

      if (savedData != null && savedData.isNotEmpty) {
        setState(() {
          selectData = ingredientDate.condimentDate.value;
        });
        existingData = jsonDecode(savedData).cast<Map<String, dynamic>>();
      }

      // 기존 데이터와 새로운 데이터 합치기
      existingData.add(newData);

      // 합쳐진 데이터를 저장
      String mergedDataString = json.encode(existingData);
      saveData('saveCondiment', mergedDataString);

      loadIngredients();

      // if (widget.remember == true) {
      //   ingredientDate.loadCondiment(existingData);
      // }
    } catch (e) {
      // 오류 처리
    }
  }

// 선택한 재료 삭제
  void delIngredients(Map<String, dynamic> dataToRemove) async {
    String savedData = await loadData('saveCondiment');

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
        saveData('saveCondiment', updatedDataString);

        loadIngredients(); // 수정된 데이터 로드

        // if (widget.remember == true) {
        //   ingredientDate.loadCondiment(existingData);
        // }
      }
    } catch (e) {
      // 오류 처리
    }
  }

  //선택한 재료 로드
  void loadIngredients() async {
    String date = await loadData('saveCondiment');

    try {
      if (date != null && date.isNotEmpty) {
        // JSON 문자열을 List<Map<String, dynamic>>으로 변환
        List<dynamic> decodedData = jsonDecode(date);
        List<Map<String, dynamic>> searchList =
            decodedData.cast<Map<String, dynamic>>();

        setState(() {
          selectData = searchList;
        });
      }
    } catch (e) {
      print(':::::${e}');
    }
  }

  //재료 임시저장
  void save() async {
    // 이전 데이터 불러오기
    String savedData = await loadData('saveCondiment');

    try {
      List<Map<String, dynamic>> existingData = [];

      if (savedData != null &&
          savedData.isNotEmpty &&
          widget.remember == true) {
        existingData = jsonDecode(savedData).cast<Map<String, dynamic>>();
        ingredientDate.loadCondiment(existingData);
      }
    } catch (e) {
      // 오류 처리
    }
  }

  @override
  void dispose() {
    //종료되면 데이터 리셋
    saveData('saveCondiment', '');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaHeight(context, 0.88),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.only(top: 15, left: 20),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: AppTheme.gray_4A,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 20),
                    child: Text(
                      '조미료 추가',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.gray_4A,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  widget.remember != true
                      ? Padding(
                          padding: EdgeInsets.only(top: 15, right: 20),
                          child: InkResponse(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddIngredientScreens(
                                    remember: widget.remember,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              '직접 입력',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppTheme.gray_4A,
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 15, right: 20),
                          child: Text(
                            '직접입력',
                            style: TextStyle(
                              color: Colors.transparent,
                              fontSize: 14,
                            ),
                          ),
                        ),
                ],
              ),
              Expanded(
                child: Column(
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
                                  Map<String, dynamic> data = selectData[index];
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100)),
                                                border: Border.all(
                                                  width: 1,
                                                  color: Color(0xffEBEBEB),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50), // 둥근 모서리 반지름 값
                                                  // child: Image.network(
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
                          ? MediaHeight(context, 0.64)
                          : MediaHeight(context, 0.55),
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
                                  saveCondiment(listData1[index]);
                                  // loadIngredients();
                                },
                                child: Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
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
                                      // child: Image.network(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
