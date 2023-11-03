import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

//미디어쿼리
//현재 디바이스의 물리적 픽셀 단위를 반환한다.
final mediaQueryData =
    MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
final mediaWidth = mediaQueryData.size.width;
final mediaHeight = mediaQueryData.size.height;

double MediaWidth(BuildContext context, double scale) {
  return MediaQuery.of(context).size.width * scale;
}

double MediaHeight(BuildContext context, double scale) =>
    MediaQuery.of(context).size.height * scale;


//mediaWidth(context, 0.9),
//mediaHeight(context, 0.5),