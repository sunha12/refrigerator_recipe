import 'package:flutter/material.dart';
import '../styles/theme.dart';
import '../widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/screens/recipe_select_screens.dart';
import 'package:refrigerator_recipe_app/widgets/recipe_fild_widgets.dart';

class RecentlyViewedRecipes extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            BackButtonWidgets(appBarText: '최근 본 레시피'),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
