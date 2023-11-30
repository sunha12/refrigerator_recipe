import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/screens/settings_help_screens.dart';
import 'package:refrigerator_recipe_app/screens/settings_notification_settings_screens.dart';
import 'package:refrigerator_recipe_app/screens/settings_contact_us_screens.dart';
import 'package:refrigerator_recipe_app/screens/settings_privacy_policy_screens.dart';
import 'package:refrigerator_recipe_app/screens/settings_profile_edit_screens.dart';
import 'package:refrigerator_recipe_app/screens/settings_terms_of_service_screens.dart';
import 'package:refrigerator_recipe_app/screens/settings_advertisement_consent_screens.dart';
import 'package:refrigerator_recipe_app/screens/settings_marketing_consent_screens.dart';
import 'package:refrigerator_recipe_app/screens/settings_open_source_licenses_screens.dart';
import 'package:refrigerator_recipe_app/screens/settings_developer_screens.dart';
import 'package:refrigerator_recipe_app/screens/settings_withdrawal_screens.dart';
import 'package:refrigerator_recipe_app/screens/loing_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            BackButtonWidgets(appBarText: '설정'),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                ),
              ),
            ),
            ListTile(
              title: Text("프로필 수정"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfileEditScreens(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("알림 설정"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NotificationSettingsScreens(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("문의하기"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ContactUsScreens(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("도움말"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HelpScreens(),
                  ),
                );
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("앱 버전"),
                  Text(
                    "1.1.1",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("개인정보 처리방침"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PrivacyPolicyScreens(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("이용약관"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TermsOfServiceScreens(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("광고 수신 동의"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AdvertisementConsentScreens(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("마케팅 수신 동의"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MarketingConsentScreens(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("오픈소스 라이선스"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OpenSourceLicensesScreens(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("개발자"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DeveloperScreens(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("로그아웃"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("로그아웃"),
                      content: Text("로그아웃하시겠습니까?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "취소",
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoingScreens(),
                              ),
                            );
                          },
                          child: Text(
                            "로그아웃",
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Text("회원 탈퇴"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WithdrawalScreens(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
