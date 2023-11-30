import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/recipe_fild_widgets.dart';

class ScrepRecipeScreens extends StatefulWidget {
  const ScrepRecipeScreens({super.key});

  @override
  State<ScrepRecipeScreens> createState() => _ScrepRecipeScreensState();
}

class _ScrepRecipeScreensState extends State<ScrepRecipeScreens> {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    List<Map<String, dynamic>> listData = [
      {
        'title': '감자튀김',
        'file_nm': 'assets/images/img_french_fries.jpeg',
        'r_uuid': 'uuid1',
        'info': '레시피 등록 시 입력한 짧은 요리 소개를 출력합니다. 최대 2줄까지 출력할 수 있습니다.',
      },
      {
        'title': '요리이름',
        'file_nm': 'assets/images/img_dakbokkeumtang.jpeg',
        'r_uuid': 'uuid2',
        'info': '레시피 등록 시 입력한 짧은 요리 소개를 출력합니다. 최대 2줄까지 출력할 수 있습니다.',
      },
    ];
    final sumCnt = listData.length;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 뒤로가기
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                  ),
                ),
                child: BackButtonWidgets(appBarText: '스크랩'),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaWidth(context, 0.04),
                  top: 4,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${sumCnt}',
                        style: TextStyle(
                          color: AppTheme.orange,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '개',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data = listData[index];
                    return RecipeWidgets(
                      recipeName: data['title'],
                      images: data['file_nm'],
                      info: data['info'],
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DetailScreens(
                        //       parameter: data['p_uuid'],
                        //       owner: true,
                        //     ),
                        //   ),
                        // );
                      },
                    );
                  },
                  // // 스크롤 제어
                  controller: _scrollController,
                ),
              ),
            ],
          )),
    );
  }
}
