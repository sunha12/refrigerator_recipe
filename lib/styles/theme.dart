import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color orange = Color(0xFFFF9100); //
  static const Color green = Color(0xFF19AC65); //
  static const Color green_light = Color(0xFFDEF5E9); // chat_bg
  static const Color blue = Color(0xFF0000ED); // 확인 text
  static const Color blue_light = Color(0xFFF3F7FB); // chat_미리알림_bg
  static const Color red = Color(0xFFFF5449); // like_heart
  static const Color dark_charcoal = Color(0xFF313033); // active_btn & font
  static const Color gray_4A = Color(0xFF4A4A4A); // font_tit1
  static const Color black_md = Color(0xFF323232); // font_tit2
  static const Color gray_md = Color(0xFFA8A8A8); // font_cont1
  static const Color sub_text = Color(0xFF737373); // font_cont2
  static const Color gray_D4 = Color(0xFFD4D4D4); //deactivate_btn & btn_line
  static const Color gray_D9 = Color(0xFFD9D9D9); //deactivate_btn & btn_line
  static const Color gray_97 = Color(0xFF979797); //deactivate_btn & btn_line
  static const Color gray_white = Color(0xFFF2F3F5);
  static const Color line_thin = Color(0xFFF5F5F5); // thin_line // 얇은 구분선
  static const Color line_bold = Color(0xFFFAFAFA); // bold_line // 굵은 구분선

  // Text, 구분선은 따로 한번 더 정의
  static const Color darkText1 = Color(0xFF4A4A4A);
  static const Color darkText2 = Color(0xFF313033);
  static const Color lightText = Color(0xFFA8A8A8);
  static const Color boldLine = Color(0xFFF2F3F5);
  static const Color thinLine = Color(0xFFD4D4D4);

  static const textTheme = TextTheme(
    headline5: headline5, // 24px
    headline6: title, // 20px
    subtitle1: subtitle, // 16px
    subtitle2: body1, // 14px darkText1
    caption: body2, // 12px darkText1
  );

  static const TextStyle headline5 = TextStyle(
    // h5 -> headline5
    fontFamily: 'NotoSansKR',
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: Colors.black,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: 'NotoSansKR',
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: 0.15,
    color: Colors.black,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle1 -> subtitle
    fontFamily: 'NotoSansKR',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    letterSpacing: 0.15,
    color: Colors.black,
  );

  static const TextStyle body1 = TextStyle(
    // subtitle2 -> body1
    fontFamily: 'NotoSansKR',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.25,
    height: 20,
    color: AppTheme.darkText1,
  );

  static const TextStyle body2 = TextStyle(
    // caption -> body2
    fontFamily: 'NotoSansKR',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.4,
    height: 17,
    color: AppTheme.darkText1,
  );
}
