import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';

class ContactUsScreens extends StatefulWidget {
  @override
  _ContactUsScreensState createState() => _ContactUsScreensState();
}

class _ContactUsScreensState extends State<ContactUsScreens> {
  String selectedType = '유형을 선택해주세요.';
  TextEditingController _inputController = TextEditingController();
  int _inputLength = 0;

  final List<String> contactTypes = [
    '앱 사용 관련',
    '이벤트 관련',
    '제휴 관련',
    '오류 제보',
    '기타 문의',
  ];

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
              padding: EdgeInsets.only(
                  left: 18.0, right: 16.0, top: 20.0, bottom: 0),
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
            buildContactTypeListButton(),
            buildInputField('문의 내용', 16.0, 21.0),
            buildImageUploader(),
            buildEmailInputField(),
            buildSendButton(),
          ],
        ),
      ),
    );
  }

  Widget buildContactTypeListButton() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 9.0, bottom: 4.0),
      child: InkWell(
        onTap: () {
          _showContactTypeList();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppTheme.gray_97,
              width: 0.5,
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedType,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  void _showContactTypeList() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: ListView.builder(
            itemCount: contactTypes.length,
            itemBuilder: (context, index) {
              final contactType = contactTypes[index];
              return ListTile(
                title: Text(contactType),
                onTap: () {
                  setState(() {
                    selectedType = contactType;
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget buildInputField(
      String hintText, double horizontalPadding, double verticalPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding)
          .copyWith(top: verticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              '문의하실 내용을 입력해주세요.',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppTheme.gray_97,
                width: 0.5,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.0),
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
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$_inputLength / 1000',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
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
                  Icons.image,
                  size: 24.0,
                  color: Colors.grey,
                ),
                Positioned(
                  bottom: 8.0,
                  child: Text(
                    '0/3',
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
      padding: EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            child: Text(
              '수신이메일',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          LongTextInputFildWidgets(
            hintText: '이메일을 입력하세요.',
            onChanged: (value) {},
            inText: '',
          ),
        ],
      ),
    );
  }

  Widget buildSendButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
          minimumSize: Size(double.infinity, 50.0),
        ),
      ),
    );
  }
}
