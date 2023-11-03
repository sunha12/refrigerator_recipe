import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color green = Color(0xFF19AC65);
  static const Color darkText1 = Color(0xFF4A4A4A);

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
