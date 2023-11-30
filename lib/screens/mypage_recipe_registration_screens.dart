import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';

class RecipeRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String initialRecipeName = '';
    final String initialRecipeDescription = '';
    final String initialRecipeLink = '';

    void onNameChanged(String value) {}
    void onDescriptionChanged(String value) {}
    void onLinkChanged(String value) {}

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CancleButtonWidgets(appBarText: '레시피 등록'),
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    color: Color(0xffEFEFEF),
                    border: Border.all(width: 1, color: AppTheme.gray_D4)),
                child: IconButton(
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    size: 20,
                    color: AppTheme.gray_4A,
                  ), // 카메라 아이콘
                  onPressed: () {
                    // 사진 업로드 로직
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaWidth(context, 0.04), 25,
                    MediaWidth(context, 0.04), 5),
                child: Text(
                  '이름',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              LongTextInputFildWidgets(
                hintText: '레시피 이름',
                onChanged: onNameChanged,
                inText: initialRecipeName,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaWidth(context, 0.04), 25,
                    MediaWidth(context, 0.04), 5),
                child: Text(
                  '레시피 소개',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              LongTextInputFildWidgets(
                hintText: '레시피에 대한 간단한 설명을 입력하세요.',
                onChanged: onDescriptionChanged,
                inText: initialRecipeDescription,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaWidth(context, 0.04), 25,
                    MediaWidth(context, 0.04), 5),
                child: Text(
                  '링크',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              LongTextInputFildWidgets(
                hintText: '블로그, 유튜브 등',
                onChanged: onLinkChanged,
                inText: initialRecipeLink,
              ),
              IngredientAddButtonWidgets(
                text: '재료 추가',
                onPressed: () {
                  // 재료 추가 로직
                },
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: IngredientAddButtonWidgets(
                  text: '조미료 추가',
                  onPressed: () {
                    // 조미료 추가 로직
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: LongButtonWidgets(
                    onPressed: () {},
                    colorId: AppTheme.orange,
                    buttonText: '등록하기',
                    iconUrl: ''),
              )
            ],
          ),
        ),
      ),
    );
  }
}
