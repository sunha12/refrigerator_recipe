import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalendarWidgets extends StatefulWidget {
  final Function(DateTime) onDaySelected;
  final String selectedDay;

  const CalendarWidgets(
      {required this.onDaySelected, required this.selectedDay, super.key});

  @override
  State<CalendarWidgets> createState() => _CalendarWidgetsState();
}

class _CalendarWidgetsState extends State<CalendarWidgets> {
  var _selectedDay;
  var _focusedDay = DateTime.now();
  var _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();

    _selectedDay =
        widget.selectedDay == '' ? null : DateTime.parse(widget.selectedDay);

    _focusedDay = _selectedDay ?? DateTime.now(); // 선택된 날짜가 있을 경우 해당 날짜로 포커스
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initializeDateFormatting(Localizations.localeOf(context).languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 키보드 감추기
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 500,
            decoration: ShapeDecoration(
              color: Colors.white,
              // 모서리 둥굴게
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //커스텀 헤더
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //       horizontal: MediaWidth(context, 0.03), vertical: 15),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         DateFormat("yyyy년M월").format(_focusedDay),
                //         style: TextStyle(
                //           fontSize: 18,
                //           color: Colors.black,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       Row(
                //         children: [
                //           TextButton(
                //             onPressed: () {

                //             },
                //             child: Icon(
                //               Icons.navigate_before,
                //               size: 25,
                //               color: AppTheme.gray_deep,
                //             ),
                //             style: ButtonStyle(
                //               overlayColor:
                //                   MaterialStateProperty.all(Colors.transparent),
                //               foregroundColor:
                //                   MaterialStateProperty.all(AppTheme.gray_deep),
                //             ),
                //           ),
                //           TextButton(
                //             onPressed: () {},
                //             child: Icon(
                //               Icons.navigate_next,
                //               size: 25,
                //               color: AppTheme.gray_deep,
                //             ),
                //             style: ButtonStyle(
                //               overlayColor:
                //                   MaterialStateProperty.all(Colors.transparent),
                //               foregroundColor:
                //                   MaterialStateProperty.all(AppTheme.gray_deep),
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
                //달력
                TableCalendar(
                  focusedDay: _focusedDay,
                  firstDay: DateTime.utc(1990, 1, 1),
                  //달력 제한 10년 후
                  lastDay: DateTime.now().add(Duration(days: 365 * 10 + 2)),
                  locale: 'ko-KR',
                  daysOfWeekHeight: 30,
                  //헤더 노출
                  // headerVisible: false,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                  ),
                  //날짜 스타일
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(color: Colors.black),
                    weekendTextStyle: TextStyle(color: Colors.black),
                    // selectedDay 모양 조정
                    selectedDecoration: const BoxDecoration(
                      color: AppTheme.orange,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    todayTextStyle: TextStyle(
                      color: AppTheme.orange,
                    ),
                  ),
                  //선택 날짜 변경
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });

                      widget.onDaySelected?.call(_selectedDay);
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),

                Padding(
                  padding: EdgeInsets.only(top: mediaHeight * 0.04),
                  child: Container(
                    child: LongButtonWidgets(
                        onPressed: () {
                          //내용을 입력하세요
                          Navigator.pop(context);
                        },
                        colorId: AppTheme.gray_deep,
                        buttonText: '확인',
                        iconUrl: ''),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
