import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';

class PolicyWidgets extends StatefulWidget {
  const PolicyWidgets({super.key});

  @override
  State<PolicyWidgets> createState() => _PolicyWidgetsState();
}

class _PolicyWidgetsState extends State<PolicyWidgets> {
  bool assentTrue = false; //정책 동의

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppTheme.gray_D4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          //전체 동의
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 14, horizontal: MediaWidth(context, 0.015)),
            child: Align(
              // alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      setState(
                        () {
                          assentTrue = !assentTrue;
                        },
                      );
                    },
                    icon: assentTrue == false
                        ? SvgPicture.asset('assets/icons/ico_chack.svg')
                        : SvgPicture.asset('assets/icons/ico_chack_active.svg'),
                    label: Text(
                      '전체 동의 (선택 정보 포함)',
                      style: TextStyle(
                          color: AppTheme.dark_charcoal,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.white), //배경색
                      foregroundColor:
                          MaterialStateProperty.all(AppTheme.gray_deep), //글자색
                      //자동 패딩 제거
                      minimumSize: MaterialStateProperty.all(Size.zero),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 3, left: MediaWidth(context, 0.03)),
                    child: Text(
                      '서비스 이용약관, 개인정보 수집 및 이용, 마케팅 이용에 대한 안내를 읽었으며 아래 내용에 모두 동의합니다.',
                      style: TextStyle(
                        color: Color(0xff979797),
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: AppTheme.gray_D4),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  //서비스 이용 약관
                  TextButtonPolicyWidgets(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => NotificationScreens()),
                      // );
                    },
                    buttonText: '[필수] 서비스 이용 약관',
                    icon: '',
                    isAgree: false,
                  ),

                  //개인정보 처리 방침
                  TextButtonPolicyWidgets(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => NotificationScreens()),
                      // );
                    },
                    buttonText: '[필수] 개인정보 처리 방침',
                    icon: '',
                    isAgree: false,
                  ),
                  //만 14세 이상입니다
                  TextButtonPolicyWidgets(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => NotificationScreens()),
                      // );
                    },
                    buttonText: '[필수] 만 14세 이상입니다',
                    icon: '14',
                    isAgree: false,
                  ),
                  //이벤트 및 혜택 알림 동의
                  TextButtonPolicyWidgets(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => NotificationScreens()),
                      // );
                    },
                    buttonText: '[선택] 이벤트 및 혜택 알림 동의',
                    icon: '',
                    isAgree: false,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
