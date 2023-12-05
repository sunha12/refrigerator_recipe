import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/provider/ingredient.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/registration_mod_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';

class RecipeRegistrationPage extends StatefulWidget {
  const RecipeRegistrationPage({super.key});

  @override
  State<RecipeRegistrationPage> createState() => _RecipeRegistrationPageState();
}

class _RecipeRegistrationPageState extends State<RecipeRegistrationPage> {
  @override
  final Ingredient ingredientDate = Get.put(Ingredient());

  final String initialRecipeName = '';
  final String initialRecipeDescription = '';
  final String initialRecipeLink = '';

  void onNameChanged(String value) {}
  void onDescriptionChanged(String value) {}
  void onLinkChanged(String value) {}

  @override
  void dispose() {
    //데이터 리셋
    ingredientDate.loadIngredient(<Map<String, dynamic>>[]);
    ingredientDate.loadCondiment(<Map<String, dynamic>>[]);
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
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
                //재료 추가
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IngredientAddButtonWidgets(
                      text: '식재료 추가',
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: false,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: MediaHeight(context, 0.88),
                              child: AddIngredientsModalWidgets(remember: true),
                            );
                          },
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        width: MediaWidth(context, 0.70),
                        height: 70,
                        child: GridView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            childAspectRatio: 1.5,
                          ),
                          itemCount:
                              ingredientDate.ingredientsDate.value.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> data =
                                ingredientDate.ingredientsDate.value[index];
                            return Container(
                              width: 30,
                              height: 30,
                              // child: Image.network(
                              child: Image.asset(
                                // 'https://api.gooodall.com/files/${widget.images}',
                                data['file_nm'],
                                fit: BoxFit.fitHeight,
                                width: 30,
                                height: 30,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16.0),
                //조미료 추가
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IngredientAddButtonWidgets(
                      text: '조미료 추가',
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: false,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: MediaHeight(context, 0.88),
                              child: AddCondimentModalWidgets(remember: true),
                            );
                          },
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        width: MediaWidth(context, 0.70),
                        height: 70,
                        child: GridView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            childAspectRatio: 1.5,
                          ),
                          itemCount: ingredientDate.condimentDate.value.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 30,
                              height: 30,
                              // child: Image.network(
                              child: Image.asset(
                                // 'https://api.gooodall.com/files/${widget.images}',
                                ingredientDate.condimentDate.value[index]
                                    ['file_nm'],
                                fit: BoxFit.fitHeight,
                                width: 30,
                                height: 30,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
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
      ),
    );
  }
}
