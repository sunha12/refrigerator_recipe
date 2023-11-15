import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyPage(),
  ));
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("마이페이지",
                style: TextStyle(fontFamily: 'NotoSansKR'))), // 변경된 부분
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // 설정 화면으로 이동
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage:
                    AssetImage("assets/profile_image.jpg"), // 프로필 사진
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                "사용자 닉네임",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSansKR',
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text("레시피 스크랩",
                style: TextStyle(
                    fontSize: 18.0, fontFamily: 'NotoSansKR')), // 변경된 부분
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // 최근 본 레시피 화면으로 이동
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RecentlyViewedRecipes(),
                          ),
                        );
                      },
                      child: Icon(Icons.history), // 최근 본 레시피
                    ),
                    Text("최근 본 레시피",
                        style: TextStyle(fontFamily: 'NotoSansKR')),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.star),
                    Text("스크랩", style: TextStyle(fontFamily: 'NotoSansKR')),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.edit),
                    Text("레시피 등록", style: TextStyle(fontFamily: 'NotoSansKR')),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text("나의 레시피",
                style: TextStyle(fontSize: 18.0, fontFamily: 'NotoSansKR')),
            SizedBox(height: 10.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4개씩 한 줄에 표시
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: myRecipes.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      // 레시피 세부 정보 화면으로 이동
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/recipe_image.jpg", // 레시피 사진
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          myRecipes[index].title,
                          style: TextStyle(
                              fontSize: 16.0, fontFamily: 'NotoSansKR'),
                        ),
                      ],
                    ),
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

class Recipe {
  final String title;

  Recipe({required this.title});
}

// 가상 레시피 데이터
List<Recipe> myRecipes = [
  Recipe(title: "스파게티"),
  Recipe(title: "피자"),
  Recipe(title: "샐러드"),
  //더미 데이터 추가
];

class RecentlyViewedRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 최근 본 레시피 목록

    return Scaffold(
      appBar: AppBar(
        title: Text("최근 본 레시피", style: TextStyle(fontFamily: 'NotoSansKR')),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text("최근 본 레시피 목록을 표시합니다.",
            style: TextStyle(fontFamily: 'NotoSansKR')),
      ),
    );
  }
}
