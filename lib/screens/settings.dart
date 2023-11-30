import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/screens/home_screens.dart';
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
import 'package:refrigerator_recipe_app/screens/signup_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/notification_window_widgets.dart';

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
            TextButtonWidgets(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfileEditScreens(),
                  ),
                );
              },
              buttonText: '프로필 수정',
              icon: '',
              bar: true,
            ),
            TextButtonWidgets(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NotificationSettingsScreens(),
                  ),
                );
              },
              buttonText: '알람 설정',
              icon: '',
              bar: true,
            ),
            TextButtonWidgets(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ContactUsScreens(),
                  ),
                );
              },
              buttonText: '문의하기',
              icon: '',
              bar: true,
            ),
            TextButtonWidgets(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HelpScreens(),
                  ),
                );
              },
              buttonText: '도움말',
              icon: '',
              bar: true,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: AppTheme.gray_D4,
                  ),
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: MediaWidth(context, 0.06)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '앱 버전',
                      style: TextStyle(
                        color: AppTheme.gray_4A,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '1.1.1',
                      style: TextStyle(
                        color: AppTheme.gray_4A,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButtonWidgets(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PrivacyPolicyScreens(),
                  ),
                );
              },
              buttonText: '개인정보 처리방침',
              icon: '',
              bar: true,
            ),
            TextButtonWidgets(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TermsOfServiceScreens(),
                  ),
                );
              },
              buttonText: '이용약관',
              icon: '',
              bar: true,
            ),
            TextButtonWidgets(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AdvertisementConsentScreens(),
                  ),
                );
              },
              buttonText: '광고 수신 동의',
              icon: '',
              bar: true,
            ),
            TextButtonWidgets(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MarketingConsentScreens(),
                  ),
                );
              },
              buttonText: '마케팅 수신 동의',
              icon: '',
              bar: true,
            ),
            TextButtonWidgets(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OpenSourceLicensesScreens(),
                  ),
                );
              },
              buttonText: '오픈소스 라이선스',
              icon: '',
              bar: true,
            ),
            TextButtonWidgets(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DeveloperScreens(),
                  ),
                );
              },
              buttonText: '개발자',
              icon: '',
              bar: true,
            ),
            TextButtonWidgets(
              onPressed: () {
                showDialog(
                  barrierDismissible: false, // 외부를 터치해도 창이 사라지지 않도록 설정
                  context: context,
                  builder: (BuildContext context) {
                    return NotificationMultiWindowWidgets(
                      buttonText1: '아니요',
                      buttonText2: '로그아웃',
                      onPressed1: () => Navigator.pop(context),
                      onPressed2: () {
                        //로그아웃
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoingScreens()),
                        );
                      },
                      titleText: '',
                      alertText: '로그아웃 하시겠습니까?',
                    );
                  },
                );
              },
              buttonText: '로그아웃',
              icon: '',
              bar: true,
            ),
            TextButtonWidgets(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WithdrawalScreens(),
                  ),
                );
              },
              buttonText: '회원 탈퇴',
              icon: '',
              bar: true,
            ),
          ],
        ),
      ),
    );
  }
}
