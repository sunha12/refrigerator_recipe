import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';

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

  void toggleNotification(bool value) {
    setState(() {
      notificationEnabled = value;
    });
  }

  void toggleEventNotifications(bool value) {
    setState(() {
      eventNotificationsEnabled = value;
    });
  }

  void toggleDoNotDisturb(bool value) {
    setState(() {
      doNotDisturbEnabled = value;
    });
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
            buildNotificationSetting(
                '알림 켜기', notificationEnabled, toggleNotification,
                subTitle: '알람을 켜거나 끌 수 있습니다.'),
            buildNotificationSetting(
                '이벤트 알림', eventNotificationsEnabled, toggleEventNotifications,
                subTitle: '이벤트 정보와 다양한 혜택을 받아볼 수 있습니다.'),
            buildNotificationSetting(
                '방해 금지 설정', doNotDisturbEnabled, toggleDoNotDisturb,
                subTitle: '알림이 울리지 않는 시간대를 설정할 수 있습니다.'),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationSetting(
      String title, bool value, Function(bool) onChanged,
      {Widget? child, String subTitle = ''}) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(
              fontSize: 12.0,
              color: AppTheme.gray_97,
            ),
          ),
          trailing: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.orange,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          onTap: () {
            if (child != null) {
              onChanged(!value);
            }
          },
          tileColor: Colors.transparent,
        ),
      ],
    );
  }
}

extension TimeOfDayExtension on TimeOfDay {
  String format(BuildContext context) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(this, alwaysUse24HourFormat: false);
  }
}
