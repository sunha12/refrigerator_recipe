import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';

//뒤로가기 위젯
class BackButtonWidgets extends StatelessWidget {
  final String appBarText;
  const BackButtonWidgets({required this.appBarText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        title: Text(
          appBarText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
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
      ),
    );
  }
}

//텍스트가 왼쪽에 붙은 뒤로가기 위젯
class BackLeftButtonWidgets extends StatelessWidget {
  final String appBarText;
  const BackLeftButtonWidgets({required this.appBarText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            appBarText,
            style: TextStyle(
              color: Colors.black,
              // fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
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
      ),
    );
  }
}

//저장 기능있는 뒤로가기 위젯
class SettingBackButtonWidgets extends StatelessWidget {
  final String appBarText;
  final VoidCallback onPressed;
  const SettingBackButtonWidgets(
      {required this.appBarText, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        title: Text(
          appBarText,
          style: TextStyle(
            fontSize: 16,
            color: AppTheme.gray_deep,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/ico_back.svg'),
          iconSize: 26,
          onPressed: () {
            // 뒤로가기 버튼을 누르면 이전 화면으로 돌아가기
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(AppTheme.gray_deep),
              ),
              onPressed: onPressed,
              child: Text(
                '저장',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.gray_deep,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 취소, 닫기 뒤로가기 위젯
class CancellationBackButtonWidgets extends StatelessWidget {
  final String appBarText;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;
  //임시 저장 활성화 (오른쪽 끝)
  final bool isSave;
  //닫기 버튼 활성화 (왼쪽 끝)
  final bool isClose;
  const CancellationBackButtonWidgets(
      {required this.appBarText,
      required this.onPressed1,
      required this.onPressed2,
      required this.isSave,
      required this.isClose,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        title: Text(
          appBarText,
          style: TextStyle(
            fontSize: 16,
            color: AppTheme.gray_deep,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        leading: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(AppTheme.gray_deep),
          ),
          child: isClose == false
              ? Text(
                  '취소',
                  style: TextStyle(fontSize: 14),
                )
              : Icon(
                  Icons.close,
                  size: 20,
                ),
          onPressed: onPressed1,
        ),
        elevation: 0,
        actions: [
          isSave == true
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor:
                          MaterialStateProperty.all(AppTheme.gray_deep),
                    ),
                    onPressed: onPressed2,
                    child: Text(
                      '저장',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.gray_deep,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

//임시저장 뒤로가기
class temporaryStorageBackButtonWidgets extends StatelessWidget {
  final String appBarText;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;
  //임시 저장 활성화 (오른쪽 끝)
  final bool isSave;
  //닫기 버튼 활성화 (왼쪽 끝)
  final bool isClose;
  const temporaryStorageBackButtonWidgets(
      {required this.appBarText,
      required this.onPressed1,
      required this.onPressed2,
      required this.isSave,
      required this.isClose,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        title: Text(
          appBarText,
          style: TextStyle(
            fontSize: 16,
            color: AppTheme.gray_deep,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        leading: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(AppTheme.gray_deep),
          ),
          child: isClose == false
              ? Text(
                  '취소',
                  style: TextStyle(fontSize: 14),
                )
              : Icon(
                  Icons.close,
                  size: 20,
                ),
          onPressed: onPressed1,
        ),
        elevation: 0,
        actions: [
          isSave == true
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor:
                          MaterialStateProperty.all(AppTheme.gray_deep),
                    ),
                    onPressed: onPressed2,
                    child: Text(
                      '임시 저장',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.gray_deep,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
