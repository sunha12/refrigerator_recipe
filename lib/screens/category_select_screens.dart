import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/models/api_helper.dart';
import 'package:refrigerator_recipe_app/screens/recipe_select_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/navigation_bar_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/recipe_fild_widgets.dart';

class CategorySelectScreens extends StatefulWidget {
  final title;

  const CategorySelectScreens({
    super.key,
    required this.title,
  });

  @override
  State<CategorySelectScreens> createState() => _CategorySelectScreensState();
}

class _CategorySelectScreensState extends State<CategorySelectScreens> {
  // List<Map<String, dynamic>> listData = [];
  List<Map<String, dynamic>> listData = [
    {
      'title': '감자튀김',
      'file_nm': 'assets/images/img_french_fries.jpeg',
      'r_uuid': 'uuid1',
    },
    {
      'title': '요리이름',
      'file_nm': 'assets/images/img_dakbokkeumtang.jpeg',
      'r_uuid': 'uuid2',
    },
  ];

  TextEditingController _searchController = TextEditingController();

  String gbn = '';
  String cate = '';
  String gender = '';
  String srchText = '';
  String FilterOptions = '';
  int pageNo = 1;

  //스크롤 감지
  bool _isLoading = false;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // 뒤로가기
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                ),
              ),
              child: BackButtonWidgets(appBarText: widget.title),
            ),
            //검색
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaWidth(context, 0.04), vertical: 15),
              child: TextField(
                // 사용자가 텍스트 필드의 입력을 완료했음을 나타내는 텍스트 입력 동작 (키보드 완료,확인 버튼)
                textInputAction: TextInputAction.done,
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: '레시피 검색',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppTheme.gray_D4),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppTheme.gray_D4),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //검색
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/ico_search.svg"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // 레시피 리스트
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = listData[index];
                  return RecipeFildWidgets(
                    recipeName: data['title'],
                    images: data['file_nm'],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeSelectScreens(
                            title: data['title'],
                          ),
                        ),
                      );
                    },
                  );
                },
                // // 스크롤 제어
                controller: _scrollController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
