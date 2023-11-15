import 'package:flutter/material.dart';

class RecentlyViewedRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 최근 본 레시피 목록 가져오기

    return Scaffold(
      appBar: AppBar(
        title: Text("최근 본 레시피"),
      ),
      body: Center(
        child: Text("최근 본 레시피 목록을 표시합니다."),
      ),
    );
  }
}
