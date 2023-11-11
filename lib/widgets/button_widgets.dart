import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart'; // svg 이미지 사용
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/calendar_widgets.dart';

//가로 길이가 짧은 위젯
class ShortButtonWidgets extends StatefulWidget {
  final Color colorId;
  final String buttonText;
  final String iconUrl;
  final VoidCallback onPressed;

  const ShortButtonWidgets(
      {super.key,
      required this.onPressed,
      required this.colorId,
      required this.buttonText,
      required this.iconUrl});

  @override
  State<ShortButtonWidgets> createState() => _ShortButtonWidgetsState();
}

class _ShortButtonWidgetsState extends State<ShortButtonWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      //최대 길이 임의지정
      // constraints: BoxConstraints(maxWidth: 300),
      child: SizedBox(
        child: widget.iconUrl != ''
            ? SizedBox(
                child: ElevatedButton.icon(
                  onPressed: widget.onPressed,
                  icon: SvgPicture.asset(widget.iconUrl),
                  label: Text(
                    widget.buttonText,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      widget.colorId,
                    ),
                    overlayColor: MaterialStateProperty.all(
                      widget.colorId,
                    ),
                  ),
                ),
              )
            : SizedBox(
                child: ElevatedButton(
                  onPressed: widget.onPressed,
                  child: Text(
                    widget.buttonText,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      widget.colorId,
                    ),
                    overlayColor: MaterialStateProperty.all(
                      widget.colorId,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

//가로 길이가 짧고 배경이 흰색인 버튼 위젯
class ShortWhiteButtonWidgets extends StatefulWidget {
  final String buttonText;
  final String iconUrl;
  final VoidCallback onPressed;

  const ShortWhiteButtonWidgets(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.iconUrl});

  @override
  State<ShortWhiteButtonWidgets> createState() =>
      _ShortWhiteButtonWidgetsState();
}

class _ShortWhiteButtonWidgetsState extends State<ShortWhiteButtonWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      //최대 길이 임의지정
      // constraints: BoxConstraints(maxWidth: 300),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0, // 보더의 너비
            color: AppTheme.gray_light,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.buttonText,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
            overlayColor: MaterialStateProperty.all(
              Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

//가로 길이가 긴 버튼 위젯
class LongButtonWidgets extends StatefulWidget {
  final Color colorId;
  final String buttonText;
  final String iconUrl;
  final VoidCallback onPressed;

  const LongButtonWidgets(
      {super.key,
      required this.onPressed,
      required this.colorId,
      required this.buttonText,
      required this.iconUrl});

  @override
  State<LongButtonWidgets> createState() => _LongButtonWidgetsState();
}

class _LongButtonWidgetsState extends State<LongButtonWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: MediaWidth(context, 0.04)),
      //최대 길이 임의지정
      // constraints: BoxConstraints(maxWidth: 900),
      child: SizedBox(
        width: double.infinity,
        child: widget.iconUrl != ''
            ? TextButton.icon(
                onPressed: widget.onPressed,
                icon: SvgPicture.asset(widget.iconUrl),
                label: Text(
                  widget.buttonText,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    widget.colorId,
                  ),
                  overlayColor: MaterialStateProperty.all(
                    widget.colorId,
                  ),
                ),
              )
            : TextButton(
                onPressed: widget.onPressed,
                child: Text(
                  widget.buttonText,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    widget.colorId,
                  ),
                  overlayColor: MaterialStateProperty.all(
                    widget.colorId,
                  ),
                ),
              ),
      ),
    );
  }
}

//아이콘 포함된 버튼 (업체 프로필)
class TextButtonWidgets extends StatefulWidget {
  final String buttonText;
  final String icon;
  final VoidCallback onPressed;
  final bool bar;

  const TextButtonWidgets(
      {required this.icon,
      required this.bar,
      required this.buttonText,
      required this.onPressed,
      super.key});

  @override
  State<TextButtonWidgets> createState() => _TextButtonWidgetsState();
}

class _TextButtonWidgetsState extends State<TextButtonWidgets> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: widget.bar == true
                      ? AppTheme.line_thin
                      : Colors.transparent,
                ),
              ),
            ),
            child: TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0), // 그림자 제거
                overlayColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: widget.onPressed,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: MediaWidth(context, 0.04)),
                  child: Row(
                    //위젯 양쪽 정렬
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            widget.icon != ''
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        right: MediaWidth(context, 0.04)),
                                    child: SvgPicture.asset(widget.icon,
                                        height: 18,
                                        width: 18,
                                        fit: BoxFit.scaleDown),
                                  )
                                : Container(),
                            Text(
                              widget.buttonText,
                              style: TextStyle(
                                color: AppTheme.gray_deep,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset('assets/icons/ico_next.svg'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//아이콘 포함된 테두리 없는 위젯
class TextButtonNotBorderWidgets extends StatefulWidget {
  final String buttonText;
  final String icon;
  final VoidCallback onPressed;

  const TextButtonNotBorderWidgets(
      {required this.icon,
      required this.buttonText,
      required this.onPressed,
      super.key});

  @override
  State<TextButtonNotBorderWidgets> createState() =>
      _TextButtonNotBorderWidgetsState();
}

class _TextButtonNotBorderWidgetsState
    extends State<TextButtonNotBorderWidgets> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0), // 그림자 제거
                overlayColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: widget.onPressed,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: MediaWidth(context, 0.04)),
                  child: Row(
                    //위젯 양쪽 정렬
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            widget.icon != ''
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: SvgPicture.asset(widget.icon,
                                        height: 18,
                                        width: 18,
                                        fit: BoxFit.scaleDown),
                                  )
                                : Container(),
                            Text(
                              widget.buttonText,
                              style: TextStyle(
                                color: AppTheme.gray_deep,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset('assets/icons/ico_next.svg'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//업체 프로필 설정 위젯
class ProfileSettingWidgets extends StatefulWidget {
  final titleText;
  final bodyText;
  final bool setting;
  final VoidCallback onPressed;
  const ProfileSettingWidgets(
      {required this.titleText,
      required this.bodyText,
      required this.onPressed,
      required this.setting,
      super.key});

  @override
  State<ProfileSettingWidgets> createState() => _ProfileSettingWidgetsState();
}

class _ProfileSettingWidgetsState extends State<ProfileSettingWidgets> {
  var switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaWidth(context, 0.04)),
      child: Container(
        child: TextButton(
          onPressed: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        widget.titleText,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.gray_deep,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(widget.bodyText,
                        style: TextStyle(
                          fontSize: 10,
                          color: AppTheme.gray_deep,
                        )),
                  ],
                ),
                widget.setting == false
                    ? SvgPicture.asset('assets/icons/ico_next.svg')
                    : Transform.scale(
                        scale: 0.7,
                        child: CupertinoSwitch(
                            activeColor: AppTheme.green,
                            value: switchValue,
                            onChanged: (value) {
                              setState(() {
                                switchValue = value;
                              });
                            }),
                      ),
              ],
            ),
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(AppTheme.gray_deep),
          ),
        ),
      ),
    );
  }
}

//시간 선택 버튼 위젯
class TimeButtonWidgets extends StatefulWidget {
  const TimeButtonWidgets({super.key});

  @override
  State<TimeButtonWidgets> createState() => _TimeButtonWidgetsState();
}

class _TimeButtonWidgetsState extends State<TimeButtonWidgets> {
  late TimeOfDay _selectedTime;

  void _showTimePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                decoration: BoxDecoration(
                  color: Color(0xffF2F3F5),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: Text(
                        '취소',
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoButton(
                      child: Text(
                        '확인',
                        style: TextStyle(color: Colors.green),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (DateTime newDateTime) {
                      setState(() {
                        _selectedTime = TimeOfDay.fromDateTime(newDateTime);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat.jm().format(DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      _selectedTime.hour,
      _selectedTime.minute,
    ));

    return Container(
      width: MediaWidth(context, 0.4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [],
      ),
      child: TextButton(
        onPressed: _showTimePicker,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0), // 그림자 제거
          overlayColor: MaterialStateProperty.all<Color>(AppTheme.gray_white),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppTheme.gray_white),
        ),
        child: Text(
          formattedTime,
          style: TextStyle(
            color: AppTheme.gray_deep,
          ),
        ),
      ),
    );
  }
}

//* * 뒤로가기(back) 버튼 * *//
class BackBtn extends StatefulWidget {
  const BackBtn({super.key});

  @override
  State<BackBtn> createState() => _BackBtnState();
}

class _BackBtnState extends State<BackBtn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 0, top: 30),
          child: AppBar(
            brightness: Brightness.light, // 밝은 화면 배경
            backgroundColor: Colors.transparent,
            elevation: 0.0, // 그림자 제거
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: SvgPicture.asset("assets/icons/btn_back.svg"),
              //tooltip: 'back page',
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
      ),
    );
  }
}
//* * 뒤로가기(back) 버튼 * *//

//날짜 선택 위젯
class SelectDateButtonWidgets extends StatefulWidget {
  final String buttonText;
  final Color buttonColor;
  final String selectedDay;
  final Function(DateTime) onDaySelected;
  const SelectDateButtonWidgets({
    super.key,
    required this.buttonText,
    required this.selectedDay,
    required this.buttonColor,
    required this.onDaySelected,
  });

  @override
  State<SelectDateButtonWidgets> createState() =>
      _SelectDateButtonWidgetsState();
}

class _SelectDateButtonWidgetsState extends State<SelectDateButtonWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaWidth(context, 0.04)),
      child: Container(
        //최대 길이 임의지정
        constraints: BoxConstraints(maxWidth: MediaWidth(context, 0.5)),
        child: TextButton(
          onPressed: () {
            setState(
              () {
                FocusScope.of(context).unfocus(); // 현재 포커스 해제
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Container(
                      height: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20), // 모달 좌상단 라운딩 처리
                          topRight: Radius.circular(20), // 모달 우상단 라운딩 처리
                        ),
                      ),
                      child: CalendarWidgets(
                        onDaySelected: widget.onDaySelected,
                        selectedDay: widget.selectedDay,
                      ),
                    );
                  },
                  backgroundColor: Colors.transparent,
                );
                // assentTrue = 1;
              },
            );
          },
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0), // 그림자 제거
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(
                color: AppTheme.gray_light,
                width: 1.0,
              ),
            ),
            overlayColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(AppTheme.gray_md),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.2, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.buttonText,
                  style: TextStyle(
                    fontSize: 12,
                    color: widget.buttonColor,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/ico_calendar.svg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//더하기 버튼 위젯
class PlusButtonWidgets extends StatefulWidget {
  final VoidCallback onPressed;
  const PlusButtonWidgets({
    super.key,
    required this.onPressed,
  });

  @override
  State<PlusButtonWidgets> createState() => _PlusButtonWidgetsState();
}

class _PlusButtonWidgetsState extends State<PlusButtonWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaWidth(context, 0.04)),
      child: TextButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0), // 그림자 제거
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),

          overlayColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: MaterialStateProperty.all(AppTheme.gray_md),
        ),
        child: Center(
          child: Icon(
            Icons.add_circle_outline_rounded,
            size: 18,
            color: AppTheme.gray_md,
          ),
        ),
      ),
    );
  }
}

//  테두리가 있고 베경이 흰색인 더보기 버튼 위젯
class MoreButtonWidgets extends StatefulWidget {
  final String buttonText;
  final String icon;
  final VoidCallback onPressed;

  const MoreButtonWidgets({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.icon,
  });

  @override
  State<MoreButtonWidgets> createState() => _MoreButtonWidgetsState();
}

// 더보기 기능
bool _showMore = false;

class _MoreButtonWidgetsState extends State<MoreButtonWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: SizedBox(
        width: double.infinity,
        child: SizedBox(
          child: TextButton(
            onPressed: widget.onPressed,
            child: Text(
              widget.buttonText,
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.dark_charcoal,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.zero,
              side: BorderSide(color: AppTheme.gray_light, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
