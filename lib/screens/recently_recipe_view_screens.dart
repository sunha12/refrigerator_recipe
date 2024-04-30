import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/recipe_fild_widgets.dart';

class RecentlyRecipeViewScreens extends StatefulWidget {
  final List<Map<String, dynamic>> recipes; // 데이터를 저장할 변수 추가

  const RecentlyRecipeViewScreens({super.key, required this.recipes}); // 생성자에 recipes 추가

  @override
  State<RecentlyRecipeViewScreens> createState() =>
      _RecentlyRecipeViewScreensState();
}

class _RecentlyRecipeViewScreensState extends State<RecentlyRecipeViewScreens> {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    final sumCnt = widget.recipes.length;  // 전달받은 recipes를 사용

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
              child: BackButtonWidgets(appBarText: '최근 본 레시피'),
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
                itemCount: widget.recipes.length,
                itemBuilder: (context, index) {
                  var recipe = widget.recipes[index];
                  return RecipeWidgets(
                    recipeName: recipe['title'],
                    images: recipe['file_nm'],
                    info: recipe['info'],
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => DetailScreens(
                      //         parameter: data['p_uuid'],
                      //         owner: true,
                      //       ),
                      //     ),
                      //   );
                    },
                  );
                },
                controller: _scrollController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
