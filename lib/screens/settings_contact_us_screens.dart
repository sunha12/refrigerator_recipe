import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';

class ContactUsScreens extends StatefulWidget {
  @override
  _ContactUsScreensState createState() => _ContactUsScreensState();
}

class _ContactUsScreensState extends State<ContactUsScreens> {
  String selectedType = '앱 사용 관련'; // 기본 선택값

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            BackButtonWidgets(appBarText: '문의하기'),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                ),
              ),
            ),
            buildContactTypeDropdown(), // 문의 유형 선택 드롭다운
            buildInputField('문의하실 내용을 입력해주세요', 358, 232), // 문의 내용 입력 박스
            buildImageUploader(), // 이미지 업로더
            buildEmailInputField(), // 이메일 입력 필드
            buildSendButton(), // 보내기 버튼
          ],
        ),
      ),
    );
  }

  Widget buildContactTypeDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: selectedType,
        items: [
          '앱 사용 관련',
          '이벤트 관련',
          '제휴 관련',
          '오류 제보',
          '기타 문의',
        ].map((String type) {
          return DropdownMenuItem<String>(
            value: type,
            child: Text(
              type,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            selectedType = value ?? '앱 사용 관련';
          });
        },
        decoration: InputDecoration(
          labelText: '문의 유형 선택',
          labelStyle: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String hintText, double width, double height) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.gray_97,
            width: 0.5,
          ),
        ),
        child: TextFormField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

  Widget buildImageUploader() {
    // 이미지 업로더 추가 로직 구현
    return Container(
        // 이미지 업로더 위젯 추가
        // ...
        );
  }

  Widget buildEmailInputField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: '수신 이메일',
          labelStyle: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
    );
  }

  Widget buildSendButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          // 보내기 버튼 클릭 시 처리 로직 추가
        },
        child: Text(
          '보내기',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.orange, // 주황색 배경
          minimumSize: Size(double.infinity, 50.0), // 버튼 크기 설정
        ),
      ),
    );
  }
}
