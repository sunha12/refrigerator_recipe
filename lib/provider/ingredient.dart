import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:refrigerator_recipe_app/utils/shared_preferences.dart';

class Ingredient extends GetxController {
  RxList<Map<String, dynamic>> ingredientsDate = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> condimentDate = <Map<String, dynamic>>[].obs;

  void loadIngredient(ingredient) {
    ingredientsDate.value = ingredient;
    update();
  }

  void loadCondiment(condiment) {
    condimentDate.value = condiment;
    update();
  }
  // void loadIngredients() async {
  //   String ingredientsData = await loadData('ingredients');
  //   String condimentData = await loadData('condiment');

  //   // JSON 문자열을 List<Map<String, dynamic>>으로 변환하여 변수에 할당
  //   List<dynamic> decodedIngredientsData = jsonDecode(ingredientsData);
  //   List<Map<String, dynamic>> ingredientsList =
  //       decodedIngredientsData.cast<Map<String, dynamic>>();

  //   ingredientsDate.assignAll(ingredientsList);

  //   List<dynamic> decodedCondimentData = jsonDecode(condimentData);
  //   List<Map<String, dynamic>> condimentList =
  //       decodedCondimentData.cast<Map<String, dynamic>>();

  //   condimentDate.assignAll(condimentList);

  //   print(':::::::::::::::loadIngredients');
  //   update();
  // }
}
