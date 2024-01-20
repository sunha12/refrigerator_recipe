import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';

class DeveloperScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            '개발자',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              // fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xffffffff),
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/ico_back.svg'),
            iconSize: 26,
            onPressed: () {
              // 뒤로가기 버튼을 누르면 이전 화면으로 돌아가기
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
              width: 0.5,
              color: Color(0xff979797),
            )),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppTheme.gray_D9,
                              width: 1,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: DeveloperIcon(
                                icon: Icons.coffee_rounded,
                                color: Color.fromARGB(255, 126, 89, 33)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: DeveloperName(name: '커피'),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      // DeveloperIcon(
                      //   icon: Icons.person_outline,
                      // ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.gray_D9,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: DeveloperIcon(
                              icon: Icons.person_outline,
                              color: AppTheme.gray_D4),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: DeveloperName(name: '장정운'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeveloperIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  DeveloperIcon({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 48.0,
      color: color,
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
