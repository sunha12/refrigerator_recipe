import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/provider/ingredient.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/registration_mod_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';

import '../widgets/recipe_registration_cooking_process_widgets.dart';
import 'mypage_recipe_registration_three_screens.dart';

class RecipeRegistrationPageTwo extends StatefulWidget {
  const RecipeRegistrationPageTwo({super.key});

  @override
  State<RecipeRegistrationPageTwo> createState() =>
      _RecipeRegistrationPageTwoState();
}

class _RecipeRegistrationPageTwoState extends State<RecipeRegistrationPageTwo> {
  void _onChanged(String text) {
    setState(() {
      //상태 관리 코드
    });
  }

  List<String> cooking_process_t = [];
  List<String> cooking_process_i = [];

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 0.5, color: AppTheme.gray_97))),
                child: temporaryStorageBackButtonWidgets(
                  appBarText: '레시피 등록 (2/3)',
                  onPressed1: () {},
                  onPressed2: () {},
                  isSave: true,
                  isClose: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaWidth(context, 0.04), 25,
                    MediaWidth(context, 0.04), 0),
                child: Text(
                  '조리 과정 ',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RecipeRegistrationCookingProcessWidgets(
                  number: '1.',
                  onChanged: _onChanged,
                  onPressed: () {},
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cooking_process_t.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: RecipeRegistrationCookingProcessWidgets(
                      number: (index + 2).toString(),
                      onChanged: _onChanged,
                      onPressed: () {},
                    ),
                  );
                },
              ),
              PlusButtonWidgets(
                onPressed: () {
                  setState(() {
                    cooking_process_t.add('');
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: LongButtonWidgets(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                RecipeRegistrationPageThree()),
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
    );
  }
}
