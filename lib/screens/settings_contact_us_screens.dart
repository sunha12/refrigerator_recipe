import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';

class ContactUsScreens extends StatefulWidget {
  @override
  _ContactUsScreensState createState() => _ContactUsScreensState();
}

class _ContactUsScreensState extends State<ContactUsScreens> {
  String _seviceInfor = '';

  void _seviceInforText(String text) {
    setState(() {
      _seviceInfor = text;
    });
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
                  left: 18.0, right: 16.0, top: 20.0, bottom: 4),
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
            TypeButtonWidgets(
              text: '유형을 선택해주세요.',
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  isDismissible: false,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: MediaHeight(context, 0.4),
                      child: buildImageUploader(),
                    );
                  },
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 18.0, right: 16.0, top: 20.0, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '문의하실 내용을 입력해주세요.',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            BigTextInputFildWidgets(
              inText: '',
              hintText: '내용을 입력해주세요',
              onChanged: _seviceInforText,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: MediaWidth(context, 0.045)),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, // 배경 색상을 흰색으로 설정
                      border: Border.all(width: 1, color: AppTheme.gray_D4),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        minimumSize: MaterialStateProperty.all(Size.zero),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Icon(
                              Icons.photo_size_select_actual_outlined,
                              weight: 17,
                              color: AppTheme.gray_4A,
                            ),
                            Text(
                              '0/3',
                              style: TextStyle(
                                color: Color(0xffA8A8A8),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 40),
                //   child: Container(
                //     width: MediaWidth(context, 0.70),
                //     height: 70,
                //     child: GridView.builder(
                //       physics: ScrollPhysics(),
                //       shrinkWrap: true,
                //       gridDelegate:
                //           SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 6,
                //         childAspectRatio: 1.5,
                //       ),
                //       itemCount:
                //           ingredientDate.ingredientsDate.value.length,
                //       itemBuilder: (context, index) {
                //         Map<String, dynamic> data =
                //             ingredientDate.ingredientsDate.value[index];
                //         return Container(
                //           width: 30,
                //           height: 30,
                //           // child: Image.network(
                //           child: Image.asset(
                //             // 'https://api.gooodall.com/files/${widget.images}',
                //             data['file_nm'],
                //             fit: BoxFit.fitHeight,
                //             width: 30,
                //             height: 30,
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                    child: Text(
                      '수신 이메일',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.gray_4A,
                      ),
                    ),
                  ),
                  LongTextInputFildWidgets(
                    hintText: '',
                    onChanged: (value) {},
                    inText: '',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: LongButtonWidgets(
                onPressed: () {},
                colorId: AppTheme.orange,
                buttonText: "보내기",
                iconUrl: "",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageUploader() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaHeight(context, 0.4),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.only(top: 15, left: 20),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: AppTheme.gray_4A,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 15, left: MediaWidth(context, 0.3), bottom: 20),
                  child: Text(
                    '유형 선택',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.gray_4A,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            TextButtonNotBorderWidgets(
              onPressed: () {},
              buttonText: '앱 사용 관련',
              icon: '',
            ),
            TextButtonNotBorderWidgets(
              onPressed: () {},
              buttonText: '제휴 관련',
              icon: '',
            ),
            TextButtonNotBorderWidgets(
              onPressed: () {},
              buttonText: '오류 관련',
              icon: '',
            ),
            TextButtonNotBorderWidgets(
              onPressed: () {},
              buttonText: '오류 제보',
              icon: '',
            ),
            TextButtonNotBorderWidgets(
              onPressed: () {},
              buttonText: '기타 문의',
              icon: '',
            ),
          ],
        ),
      ),
    );
  }
}
