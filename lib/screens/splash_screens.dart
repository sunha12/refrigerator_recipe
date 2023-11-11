// Timer 클래스를 사용하기위한 비동기 프로그래밍 라이브러리
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/screens/loing_screens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/utils/shared_preferences.dart';

class SplashScreens extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  bool modeStates = false; // 입양모드인 경우: false(0), 분양모드인 경우: true(1)
  // load data 함수 생성
  String tokenCheck = ''; //토큰
  String ownerCheck = ''; //오너
  String userCheck = ''; //유저
  //토큰 체크
  // Future<void> _tokenCheck() async {
  //   final t = await loadData('accessToken');
  //   final rt = await loadData('refreshToken');
  //   print('::::::::::::::::$t');
  //   print('::::::::::::::$rt');

  //   final res =
  //       await ApiClientAuth(baseUrlAuth: 'https://api.gooodall.com/accchk')
  //           .get('');
  //   // print(res);

  //   ownerCheck = await loadData('ownerhome');
  //   userCheck = await loadData('userhome');

  //   if (res['message'] == 'invalid_grant' || res['message'] == '토큰만료') {
  //     Timer(const Duration(seconds: 1), () {
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (context) => LogInScreens(),
  //         ),
  //       );
  //     });
  //   } else {
  //     if (userCheck == 'true') {
  //       Timer(const Duration(seconds: 1), () {
  //         Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(
  //             builder: (context) => HomeScreens(),
  //           ),
  //         );
  //       });
  //     } else if (ownerCheck == 'true') {
  //       Timer(const Duration(seconds: 1), () {
  //         Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(
  //             builder: (context) => HomeOwnerScreens(),
  //           ),
  //         );
  //       });
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();

    // _tokenCheck();

    // 설정한 시간(초)뒤에 HomeScreens 이동
    // 2초로 임의 지정
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          // builder: (context) => SocialLoginScreens(),
          // builder: (context) => HomeScreens(),
          builder: (context) => LoingScreens(),
        ),
      );
    });
  }

  // 설정한 시간(초)뒤에 HomeScreens 이동
  // 1초로 임의 지정
  // Timer(const Duration(seconds: 1), () {
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       // builder: (context) => SocialLoginScreens(),
  //       // builder: (context) => HomeScreens(),
  //       builder: (context) => LogInScreens(),
  //     ),
  //   );
  // });

  // 스플래시 화면
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      body: Center(
          //  child: SvgPicture.asset("/images/logo.svg"),
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 65),
            child: Image.asset(
              'assets/images/logo.png',
              // height: mediaHeight * 0.15,
              // width: MediaWidth(context, 0.4),
            ),
          ),
          Image.asset(
            'assets/images/logo_text.png',
            // height: mediaHeight * 0.15,
            // width: MediaWidth(context, 0.4),
          ),
        ],
      )),
    );
  }
}
