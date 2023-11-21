import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/screens/ingredient_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/ingredient_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/notification_window_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/policy_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/size_box_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';
import 'package:refrigerator_recipe_app/provider/time_update.dart';

class CondimentScreens extends StatefulWidget {
  const CondimentScreens({
    super.key,
  });

  @override
  State<CondimentScreens> createState() => _CondimentScreensState();
}

class _CondimentScreensState extends State<CondimentScreens> {
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

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            // 뒤로가기
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                ),
              ),
              child: AddBackButtonWidgets(
                appBarText: '조미료',
                onPressed: () {},
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: listData1.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = listData1[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaWidth(context, 0.04)),
                  child: IngredientWidgets(
                    ingredientName: data['title'],
                    images: data['file_nm'],
                    dete: data['dete'],
                    count: '',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IngredientScreens(
                            title: data['title'],
                            img: data['file_nm'],
                            dete: data['dete'],
                            count: false,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              // // 스크롤 제어
              controller: _scrollController,
            ),
          ]),
        ),
      ),
    );
  }
}
