import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/notification_window_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/policy_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/size_box_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';
import 'package:refrigerator_recipe_app/provider/time_update.dart';

class AddIngredientScreens extends StatefulWidget {
  final bool remember;
  const AddIngredientScreens({
    required this.remember,
    super.key,
  });

  @override
  State<AddIngredientScreens> createState() => _AddIngredientScreensState();
}

class _AddIngredientScreensState extends State<AddIngredientScreens> {
  void _onChanged(String text) {
    setState(() {
      //상태 관리 코드
    });
  }

  String _birthDt = ''; //유통기한

  //유통기한 받아오기
  void _birthDtDaySelected(DateTime selectedDay) {
    setState(() {
      var _selected = selectedDay;
      _birthDt = DateFormat('yyyy-MM-dd').format(_selected);
    });

    print(_birthDt);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            // 뒤로가기
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                ),
              ),
              child: AddBackButtonWidgets(
                appBarText: '직접 입력',
                onPressed: () {},
              ),
            ),
            //이미지
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 23),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppTheme.gray_D9),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        // 'https://api.gooodall.com/files/${widget.images}',
                        // 'assets/images/img_dessert.jpg',
                        '',
                        fit: BoxFit.cover, // 이미지를 위젯 크기에 맞추기 위해 fit 설정
                        width: 170,
                        height: 170,
                        errorBuilder: (context, error, stackTrace) {
                          return ClipOval(
                            child: Container(
                              width: 170,
                              height: 170,
                              color: AppTheme.gray_D4,
                              child: Icon(
                                Icons.photo_size_select_actual_outlined,
                                size: 22,
                                color: AppTheme.gray_4A,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 3, right: 3),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white, // 배경 색상을 흰색으로 설정
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              blurRadius: 15.0, //그림자 세기
                              spreadRadius: 0.0,
                              offset:
                                  const Offset(0, 0), // x, y 값을 받아서 그림자 위치를 조절
                            ),
                          ],
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
                ),
              ],
            ),
            //이름
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaWidth(context, 0.07), top: 24, bottom: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      '이름',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.gray_4A,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                LongTextInputFildWidgets(
                  inText: '',
                  hintText: '',
                  onChanged: _onChanged,
                ),
              ],
            ),
            //수량
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaWidth(context, 0.07), top: 18, bottom: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      '수량',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.gray_4A,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                LongTextInputFildWidgets(
                  inText: '',
                  hintText: '예) 3',
                  onChanged: _onChanged,
                ),
              ],
            ),
            //유통기한
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaWidth(context, 0.07), top: 18, bottom: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      '유통기한',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.gray_4A,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: SelectDateButtonWidgets(
                    selectedDay: _birthDt,
                    buttonText: _birthDt,
                    onDaySelected: _birthDtDaySelected,
                    buttonColor:
                        _birthDt == '' ? AppTheme.gray_md : AppTheme.gray_4A,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
