import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/provider/ingredient.dart';
import 'package:refrigerator_recipe_app/screens/mypage_recipe_registration_two_screens.dart';
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
                CancleButtonWidgets(appBarText: '레시피 등록 (1/3)'),
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
                  padding: EdgeInsets.fromLTRB(MediaWidth(context, 0.05), 25,
                      MediaWidth(context, 0.05), 5),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '이름 ',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                LongTextInputFildWidgets(
                  hintText: '레시피 이름',
                  onChanged: onNameChanged,
                  inText: initialRecipeName,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(MediaWidth(context, 0.05), 25,
                      MediaWidth(context, 0.05), 5),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '레시피 소개 ',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                LongTextInputFildWidgets(
                  hintText: '레시피에 대한 간단한 설명을 입력하세요.',
                  onChanged: onDescriptionChanged,
                  inText: initialRecipeDescription,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(MediaWidth(context, 0.05), 25,
                      MediaWidth(context, 0.05), 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '분류 ',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TypeButtonWidgets(
                  text: '유형을 선택해주세요.',
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      isDismissible: false,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: MediaHeight(context, 0.5),
                          child: buildImageUploader(),
                        );
                      },
                    );
                  },
                ),
                //재료 추가
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // 메인 축을 시작 부분으로 정렬
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IngredientAddButtonWidgets(
                      text: '식재료 추가',
                      essential: true,
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Container(
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
                                child: Image.asset(
                                  data['file_nm'],
                                  fit: BoxFit.fitHeight,
                                  width: 30,
                                  height: 30,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.0),
                //조미료 추가
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IngredientAddButtonWidgets(
                      text: '조미료 추가',
                      essential: true,
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Container(
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
                                ingredientDate.condimentDate.value.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 30,
                                height: 30,
                                child: Image.asset(
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
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: LongButtonWidgets(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  RecipeRegistrationPageTwo()),
                        );
                      },
                      colorId: AppTheme.orange,
                      buttonText: '다음으로',
                      iconUrl: ''),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImageUploader() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaHeight(context, 0.5),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
          ),
          child: SingleChildScrollView(
            // SingleChildScrollView 추가
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // 스크롤 가능한 내용에는 MainAxisSize.min이 적합
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      padding: EdgeInsets.only(
                          top: 15, left: MediaWidth(context, 0.3), bottom: 20),
                      child: Text(
                        '유형 선택',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.gray_4A,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                TextButtonNotBorderWidgets(
                  onPressed: () {},
                  buttonText: '한식',
                  icon: '',
                ),
                TextButtonNotBorderWidgets(
                  onPressed: () {},
                  buttonText: '일식',
                  icon: '',
                ),
                TextButtonNotBorderWidgets(
                  onPressed: () {},
                  buttonText: '중식',
                  icon: '',
                ),
                TextButtonNotBorderWidgets(
                  onPressed: () {},
                  buttonText: '양식',
                  icon: '',
                ),
                TextButtonNotBorderWidgets(
                  onPressed: () {},
                  buttonText: '퓨전 음식',
                  icon: '',
                ),
                TextButtonNotBorderWidgets(
                  onPressed: () {},
                  buttonText: '디저트',
                  icon: '',
                ),
              ],
            ),
          ),
        ));
  }
}
