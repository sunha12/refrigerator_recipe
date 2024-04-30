import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_recipe_app/screens/recently_recipe_view_screens.dart';
import 'package:refrigerator_recipe_app/screens/recipe_select_screens.dart';
import 'package:refrigerator_recipe_app/screens/mypage_scrap_screens.dart';
import 'package:refrigerator_recipe_app/screens/mypage_recipe_registration_screens.dart';
import 'package:refrigerator_recipe_app/screens/screp_recipe_screens.dart';
import 'dart:convert';
import 'package:refrigerator_recipe_app/models/api_helper.dart';

class MypageWidget extends StatelessWidget {
  final ApiClient apiClient = ApiClient(baseUrl: 'http://localhost:3000');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildIconColumn(
          context,
          icon: Icons.remove_red_eye_rounded,
          label: "최근 본 레시피",
          onTap: () async {
            var response = await apiClient.get('/recently-viewed?userIdx=1');
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => RecentlyRecipeViewScreens(recipes: response['data'])),
            );
          },
        ),
        _buildIconColumn(
          context,
          icon: Icons.bookmark_border,
          label: "스크랩",
          onTap: () async {
            var response = await apiClient.get('/scraps?userIdx=1');
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ScrepRecipeScreens(recipes: response['data'])),
            );
          },
        ),
        _buildIconColumn(
          context,
          icon: Icons.mode_edit_outline_rounded,
          label: "레시피 등록",
          onTap: () async {
            var newRecipe = {'userIdx': 1, 'rcpNm': '새로운 레시피', 'rcpImage': 'image_url'};
            var response = await apiClient.post('/new-recipe', newRecipe);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => RecipeRegistrationPage(result: response)),
            );
          },
        ),
      ],
    );
  }

  Widget _buildIconColumn(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return TextButton(
      onPressed: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Icon(icon, size: 30),
          ),
          Text(
            label,
            style: TextStyle(
              color: Color(0xff313033),
              fontSize: 10,
            ),
          ),
        ],
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
    );
  }
}
