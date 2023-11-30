import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';

class ContactUsScreens extends StatefulWidget {
  @override
  _ContactUsScreensState createState() => _ContactUsScreensState();
}

class _ContactUsScreensState extends State<ContactUsScreens> {
  String selectedType = '앱 사용 관련'; // 기본 선택값
  TextEditingController _inputController = TextEditingController();
  int _inputLength = 0;

  @override
  void initState() {
    super.initState();
    _inputController.addListener(_updateInputLength);
  }

  void _updateInputLength() {
    setState(() {
      _inputLength = _inputController.text.length;
    });
  }

  @override
  void dispose() {
    _inputController.removeListener(_updateInputLength);
    _inputController.dispose();
    super.dispose();
  }

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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '문의 유형 선택',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            buildContactTypeDropdown(),
            buildInputField(' 문의하실 내용을 입력해주세요', 358, 232),
            buildImageUploader(),
            buildEmailInputField(),
            buildSendButton(),
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
          border: OutlineInputBorder(
            // 기본 테두리 색상 설정
            borderSide: BorderSide(color: AppTheme.orange),
          ),
          focusedBorder: OutlineInputBorder(
            // 포커스 시 테두리 색상 설정
            borderSide: BorderSide(color: AppTheme.orange),
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String hintText, double width, double height) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppTheme.gray_97,
                width: 0.5,
              ),
            ),
            child: TextFormField(
              controller: _inputController,
              maxLength: 1000,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                counterText: '',
              ),
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              '$_inputLength / 1000', // 입력 글자 수 표시
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageUploader() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () {
            // 이미지 업로더 로직을 여기에 추가
          },
          child: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.image, // 이미지 아이콘
                  size: 24.0,
                  color: Colors.grey,
                ),
                Positioned(
                  bottom: 8.0,
                  child: Text(
                    '0/3', // 업로드된 이미지 수/최대 이미지 수
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
            color: Colors.grey, // 기본 레이블 색상
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange), // 포커스 시 테두리 색상
          ),
          focusColor: Colors.orange, // 포커스 시 레이블 색상
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
          backgroundColor: Colors.orange,
          minimumSize: Size(double.infinity, 50.0), // 버튼 크기 설정
        ),
      ),
    );
  }
}
