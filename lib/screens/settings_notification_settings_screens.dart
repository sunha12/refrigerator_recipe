import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationSettingsScreens extends StatefulWidget {
  @override
  _NotificationSettingsScreensState createState() =>
      _NotificationSettingsScreensState();
}

class _NotificationSettingsScreensState
    extends State<NotificationSettingsScreens> {
  bool notificationEnabled = true;
  bool eventNotificationsEnabled = true;
  bool doNotDisturbEnabled = false;
  TimeOfDay? doNotDisturbStartTime;
  TimeOfDay? doNotDisturbEndTime;

  @override
  void initState() {
    super.initState();
    fetchSettings();
  }

  Future<void> fetchSettings() async {
    var response = await http
        .get(Uri.parse('https://api.codingduo.co.kr/alarm-settings?userIdx=1'));
    var data = json.decode(response.body);
    setState(() {
      notificationEnabled = data['alarm'];
      eventNotificationsEnabled = data['event_alarm'];
      doNotDisturbEnabled = data['al_no_stime'] != null;
      doNotDisturbStartTime =
          TimeOfDayExtension.fromDateTime(DateTime.parse(data['al_no_stime']));
      doNotDisturbEndTime =
          TimeOfDayExtension.fromDateTime(DateTime.parse(data['al_no_etime']));
    });
  }

  Future<void> updateSettings() async {
    await http.post(
      Uri.parse('https://api.codingduo.co.kr/update-alarm-settings'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'userIdx': 1,
        'alarm': notificationEnabled,
        'eventAlarm': eventNotificationsEnabled,
        'alNoStime': doNotDisturbStartTime?.format(context),
        'alNoEtime': doNotDisturbEndTime?.format(context),
      }),
    );
  }

  void toggleNotification(bool value) {
    setState(() {
      notificationEnabled = value;
    });
    updateSettings();
  }

  void toggleEventNotifications(bool value) {
    setState(() {
      eventNotificationsEnabled = value;
    });
    updateSettings();
  }

  void toggleDoNotDisturb() {
    setState(() {
      doNotDisturbEnabled = !doNotDisturbEnabled;
    });
    updateSettings();
  }

  Future<void> selectDoNotDisturbStartTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: doNotDisturbStartTime ?? TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        doNotDisturbStartTime = selectedTime;
      });
    }
  }

  Future<void> selectDoNotDisturbEndTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: doNotDisturbEndTime ?? TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        doNotDisturbEndTime = selectedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            BackButtonWidgets(appBarText: '알림 설정'),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                ),
              ),
            ),
            ProfileSettingWidgets(
              titleText: '알림 켜기',
              bodyText: '알림을 켜거나 끌 수 있습니다.',
              onPressed: () {},
              setting: true,
            ),
            ProfileSettingWidgets(
              titleText: '이벤트 알림',
              bodyText: '이벤트 정보와 다양한 혜택을 받아볼 수 있습니다.',
              onPressed: () {},
              setting: true,
            ),
            ProfileSettingWidgets(
              titleText: '방해 금지 설정',
              bodyText: '알림이 울리지 않는 시간대를 설정할 수 있습니다.',
              onPressed: () {
                toggleDoNotDisturb();
              },
              setting: true,
            ),
            doNotDisturbEnabled == true
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: MediaWidth(context, 0.04)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppTheme.gray_white,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: MediaWidth(context, 0.04)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '시작 시간',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppTheme.gray_4A,
                                    ),
                                  ),
                                  TimeButtonWidgets(),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '종료 시간',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.gray_4A,
                                  ),
                                ),
                                TimeButtonWidgets(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationSetting(
      String title, bool value, Function(bool) onChanged,
      {Widget? child, String subTitle = ''}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0), // 좌우 패딩
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                subTitle,
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppTheme.gray_97,
                ),
              ),
            ),
            trailing: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Color(0xFFFF9100),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            onTap: () {
              if (child != null) {
                onChanged(!value);
              }
            },
            tileColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}

extension TimeOfDayExtension on TimeOfDay {
  static TimeOfDay fromDateTime(DateTime dateTime) {
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  String format(BuildContext context) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(this, alwaysUse24HourFormat: false);
  }
}
