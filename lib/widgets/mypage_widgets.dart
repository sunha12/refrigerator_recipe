import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/screens/mypage_recently_viewed_recipes_screens.dart';
import 'package:refrigerator_recipe_app/screens/mypage_scrap_screens.dart';
import 'package:refrigerator_recipe_app/screens/mypage_recipe_registration_screens.dart';

class MypageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildIconColumn(
          context,
          icon: Icons.history,
          label: "최근 본 레시피",
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => RecentlyViewedRecipes()),
            );
          },
        ),
        _buildIconColumn(
          context,
          icon: Icons.star,
          label: "스크랩",
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ScrapRecipesPage()),
            );
          },
        ),
        _buildIconColumn(
          context,
          icon: Icons.edit,
          label: "레시피 등록",
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => RecipeRegistrationPage()),
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24.0),
            Text(
              label,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
      ),
    );
  }
}
