import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';

class DeveloperScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black.withOpacity(0.1),
                    width: 2.0,
                  ),
                ),
              ),
              child: BackButtonWidgets(appBarText: '개발자'),
            ),
            Expanded(
              // 나머지 내용을 Expanded 위젯으로 감싸서 중앙 정렬
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 세로축 중앙 정렬
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // 가로축 중앙 정렬
                      children: [
                        Column(
                          children: [
                            DeveloperIcon(
                              icon: Icons.person_outline,
                            ),
                            SizedBox(height: 15.0),
                            DeveloperName(name: '박선하'),
                          ],
                        ),
                        SizedBox(width: 40.0),
                        Column(
                          children: [
                            DeveloperIcon(
                              icon: Icons.person_outline,
                            ),
                            SizedBox(height: 15.0),
                            DeveloperName(name: '장정운'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeveloperIcon extends StatelessWidget {
  final IconData icon;

  DeveloperIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 48.0,
      color: Colors.grey,
    );
  }
}

class DeveloperName extends StatelessWidget {
  final String name;

  DeveloperName({required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
