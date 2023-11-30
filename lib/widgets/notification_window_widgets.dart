import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/models/api_helper.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';

//동작 버튼이 중앙에 한 개인 경우
class NotificationWindowWidgets extends StatelessWidget {
  final String buttonText;
  final Color textColor;
  final String alertText;
  final VoidCallback onPressed;
  const NotificationWindowWidgets({
    super.key,
    required this.buttonText,
    required this.textColor,
    required this.alertText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // 테두리 둥글기 설정
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 오른쪽 상단에 버튼을 배치
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: AppTheme.gray_4A,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 25),
                    child: Text(
                      alertText,
                      style: TextStyle(fontSize: 17),
                      textAlign: TextAlign.center,
                    )),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25),
                    child: TextButton(
                      onPressed: onPressed,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(fontSize: 16),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),

                        elevation: MaterialStateProperty.all<double>(0),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(120, 50)),
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: AppTheme.gray_D4,
                            width: 1.0,
                          ),
                        ),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent), //마우스 올려도 배경색 안 변함
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaWidth(context, 0.14)),
                        child: Text(
                          buttonText,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//동작 버튼이 아래 양쪽으로 두개인 경우
class NotificationMultiWindowWidgets extends StatelessWidget {
  final String buttonText1;
  final String buttonText2;
  final String titleText;
  final String alertText;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;

  const NotificationMultiWindowWidgets({
    super.key,
    required this.buttonText1,
    required this.buttonText2,
    required this.titleText,
    required this.alertText,
    required this.onPressed1,
    required this.onPressed2,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // 테두리 둥글기 설정
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: 20, top: 20, left: 20, right: 20),
                child: Text(
                  alertText,
                  style: TextStyle(fontSize: 17),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppTheme.gray_md, // 왼쪽 테두리 색상
                      width: 1.0, // 왼쪽 테두리 두께
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: AppTheme.gray_md, // 왼쪽 테두리 색상
                              width: 1.0, // 왼쪽 테두리 두께
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: TextButton(
                            onPressed: onPressed1,
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.white),
                              foregroundColor:
                                  MaterialStateProperty.all(AppTheme.gray_4A),
                            ),
                            child: Text(
                              buttonText1,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: TextButton(
                            onPressed: onPressed2,
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.white),
                              foregroundColor:
                                  MaterialStateProperty.all(AppTheme.gray_4A),
                            ),
                            child: Text(
                              buttonText2,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//동작 버튼이 아래 양쪽으로 두개이며 버튼 하나가 빨간색인 경우
class NotificationMultiRedWindowWidgets extends StatelessWidget {
  final String buttonText1;
  final String buttonText2;
  final String titleText;
  final String alertText;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;

  const NotificationMultiRedWindowWidgets({
    super.key,
    required this.buttonText1,
    required this.buttonText2,
    required this.titleText,
    required this.alertText,
    required this.onPressed1,
    required this.onPressed2,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // 테두리 둥글기 설정
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              // 오른쪽 상단에 버튼을 배치
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: AppTheme.gray_4A,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Text(
                  alertText,
                  style: TextStyle(fontSize: 17),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppTheme.gray_md, // 왼쪽 테두리 색상
                      width: 1.0, // 왼쪽 테두리 두께
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: AppTheme.gray_md, // 왼쪽 테두리 색상
                              width: 1.0, // 왼쪽 테두리 두께
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: TextButton(
                            onPressed: onPressed1,
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.white),
                              foregroundColor: MaterialStateProperty.all(
                                  Colors.red), // 텍스트 색상을 빨간색으로 설정
                            ),
                            child: Text(
                              buttonText1,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: TextButton(
                            onPressed: onPressed2,
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.white),
                              foregroundColor: MaterialStateProperty.all(
                                  Colors.black), // 텍스트 색상을 빨간색으로 설정
                            ),
                            child: Text(
                              buttonText2,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
