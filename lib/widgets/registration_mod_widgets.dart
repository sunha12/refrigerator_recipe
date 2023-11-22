import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/models/api_helper.dart';
import 'package:refrigerator_recipe_app/screens/add_ingredient_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/utils/shared_preferences.dart';
import 'package:refrigerator_recipe_app/widgets/tab_bar_widgets.dart';

//식재료 추가
class AddIngredientsModalWidgets extends StatefulWidget {
  @override
  _AddIngredientsModalWidgetsState createState() =>
      _AddIngredientsModalWidgetsState();
}

class _AddIngredientsModalWidgetsState
    extends State<AddIngredientsModalWidgets> {
  String gbn_idx = '1000000';
  String searchText = '';

  List<dynamic> _dataList = []; //펫 데이터
  List<bool> _checkedList = []; //체크 여부 리스트
  List<String> _searchTextList = []; //최근 검색어 5개
  List<dynamic> _vogueSearchText = []; //인기 검색어

  @override
  void initState() {
    super.initState();
    // _searchController.addListener(_onSearchChanged);
    // _initCheckedList();
    // vogueTextDate();
  }

  void _initCheckedList() {
    _checkedList = List<bool>.filled(_dataList.length, false);
  }

  void _handleTextSelection(int selectedText) {
    print(selectedText);
  }

  void _handleCheckboxSelection(int index, bool value) {
    setState(() {
      _checkedList[index] = value;
      if (value) {
        _handleTextSelection(_dataList[index]['cate_idx']);
      }
    });
  }

  //체크된 아이템이 있는지 확인
  bool hasTrueValue(List<bool> list) {
    for (var value in list) {
      if (value == true) {
        return true;
      }
    }
    return false;
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
                      '식재료 추가',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.gray_4A,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, right: 20),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddIngredientScreens(),
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
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent), //배경색
                        foregroundColor:
                            MaterialStateProperty.all(AppTheme.gray_4A), //글자색
                        //자동 패딩 제거
                        minimumSize: MaterialStateProperty.all(Size.zero),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: IngredientsTabBarWidgets(),
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
  @override
  _AddCondimentModalWidgetsState createState() =>
      _AddCondimentModalWidgetsState();
}

class _AddCondimentModalWidgetsState extends State<AddCondimentModalWidgets> {
  String _address = '';
  String gbn_idx = '1000000';
  String searchText = '';

  TextEditingController _searchController = TextEditingController();
  List<dynamic> _dataList = []; //펫 데이터
  List<bool> _checkedList = []; //체크 여부 리스트
  List<String> _searchTextList = []; //최근 검색어 5개
  List<dynamic> _vogueSearchText = []; //인기 검색어

  @override
  void initState() {
    super.initState();
    // _searchController.addListener(_onSearchChanged);
    // _initCheckedList();
    // vogueTextDate();
  }

  void _onSearchChanged() {
    if (_searchController.text.isEmpty) {
      setState(() {
        _dataList = [];
      });
    }

    setState(() {
      _initCheckedList();
    });
  }

  void _initCheckedList() {
    _checkedList = List<bool>.filled(_dataList.length, false);
  }

  void _handleTextSelection(int selectedText) {
    print(selectedText);
  }

  void _handleCheckboxSelection(int index, bool value) {
    setState(() {
      _checkedList[index] = value;
      if (value) {
        _handleTextSelection(_dataList[index]['cate_idx']);
      }
    });
  }

  //체크된 아이템이 있는지 확인
  bool hasTrueValue(List<bool> list) {
    for (var value in list) {
      if (value == true) {
        return true;
      }
    }
    return false;
  }

  @override
  void dispose() {
    _searchController.dispose();
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
                    padding: EdgeInsets.only(top: 15),
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
                  Padding(
                    padding: EdgeInsets.only(top: 15, right: 20),
                    child: TextButton(
                      onPressed: () {
                        //
                      },
                      child: Text(
                        '직접 입력',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.gray_4A,
                        ),
                      ),
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent), //배경색
                        foregroundColor:
                            MaterialStateProperty.all(AppTheme.gray_4A), //글자색
                        //자동 패딩 제거
                        minimumSize: MaterialStateProperty.all(Size.zero),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // 주소 검색 입력 창
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: MediaWidth(context, 0.04)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: '검색',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppTheme.gray_D9),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppTheme.gray_D9),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        suffixIcon:
                            //검색
                            IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/ico_search.svg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: MediaWidth(context, 0.04)),
                      child: Text(
                        '최근 검색어',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.gray_4A,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaWidth(context, 0.04), bottom: 18, top: 10),
                    child: Container(
                      height: MediaHeight(context, 0.05),
                      child: ListView.builder(
                        // physics: BouncingScrollPhysics(), //튕겨나가며, 배경이 늘어남
                        physics:
                            RangeMaintainingScrollPhysics(), //전체 길이만큼만 움직여짐
                        scrollDirection: Axis.horizontal,
                        itemCount: _searchTextList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: TextButton(
                                  child: Row(
                                    children: [
                                      Text(
                                        _searchTextList[index],
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: AppTheme.gray_4A,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _searchTextList.removeAt(index);
                                          });
                                        },
                                        icon: SvgPicture.asset(
                                            'assets/icons/ico_cancel.svg'),
                                        padding: EdgeInsets.zero, // 패딩 설정
                                        constraints: BoxConstraints(),
                                        color: Colors.transparent,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    _searchController.text =
                                        _searchTextList[index];
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        side: BorderSide(
                                            color: AppTheme.gray_D9, width: 1),
                                      ),
                                    ), //테두리
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.white), //배경색
                                    foregroundColor: MaterialStateProperty.all(
                                        AppTheme.gray_4A), //글자색
                                    //자동 패딩 제거
                                    minimumSize:
                                        MaterialStateProperty.all(Size.zero),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10)),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
