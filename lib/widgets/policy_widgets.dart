import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';

class PolicyWidgets extends StatefulWidget {
  const PolicyWidgets({super.key});

  @override
  State<PolicyWidgets> createState() => _PolicyWidgetsState();
}

class _PolicyWidgetsState extends State<PolicyWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //전체 동의
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Row(
                  children: [
                    //아이콘 버튼
                    //텍스트
                    Text(
                      '전체 동의 (선택 정보 포함)',
                      style: TextStyle(
                        color: AppTheme.dark_charcoal,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
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
          Container(
            child: Column(
              children: [
                //서비스 이용 약관

                //개인정보 처리 방침

                //만 14세 이상입니다

                //이벤트 및 혜택 알림 동의
              ],
            ),
          )
        ],
      ),
    );
  }
}
