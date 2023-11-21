import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/screens/password_auth_srceens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';

class ReceiptAddScreens extends StatefulWidget {
  const ReceiptAddScreens({super.key});

  @override
  State<ReceiptAddScreens> createState() => _ReceiptAddScreenssState();
}

class _ReceiptAddScreenssState extends State<ReceiptAddScreens> {
  void _onChanged(String text) {
    setState(() {
      //상태 관리 코드
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          // 뒤로가기
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
              ),
            ),
            child: BackButtonWidgets(appBarText: '영수증 등록'),
          ),
          //버튼
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaWidth(context, 0.04), vertical: 16),
            child: Row(
              children: [
                //촬영하기
                Padding(
                  padding: EdgeInsets.only(right: MediaWidth(context, 0.028)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.white, // 배경 색상을 흰색으로 설정
                              border:
                                  Border.all(width: 1, color: AppTheme.gray_D9),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 22,
                                color: AppTheme.gray_4A,
                              ),
                            ),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => ),
                            // );
                          },
                        ),
                      ),
                      Text(
                        '촬영하기',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.gray_4A,
                        ),
                      )
                    ],
                  ),
                ),
                //앨범에서 선택

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            color: Colors.white, // 배경 색상을 흰색으로 설정
                            border:
                                Border.all(width: 1, color: AppTheme.gray_D9),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.photo_size_select_actual_outlined,
                              size: 22,
                              color: AppTheme.gray_4A,
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Text(
                      '앨범에서 선택',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.gray_4A,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
