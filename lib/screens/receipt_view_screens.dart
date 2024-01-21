import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/screens/password_auth_srceens.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';

class ReceiptViewScreens extends StatefulWidget {
  const ReceiptViewScreens({
    super.key,
  });

  @override
  State<ReceiptViewScreens> createState() => _ReceiptViewScreensState();
}

class _ReceiptViewScreensState extends State<ReceiptViewScreens> {
  ScrollController _scrollController = ScrollController();

  String title = '요리 이름';
  String image = 'assets/images/img_europe.jpg';

  List<Map<String, dynamic>> ingredientTrueData = [
    {
      'file_nm': 'assets/images/img_carrot.png',
    },
    {
      'file_nm': 'assets/images/img_asparagus.png',
    },
    {
      'file_nm': 'assets/images/img_potato.png',
    },
  ];
  List<Map<String, dynamic>> ingredientFalseData1 = [
    {
      'file_nm': 'assets/images/img_carrot.png',
    },
    {
      'file_nm': 'assets/images/img_asparagus.png',
    },
    {
      'file_nm': 'assets/images/img_potato.png',
    },
    {
      'file_nm': 'assets/images/img_carrot.png',
    },
    {
      'file_nm': 'assets/images/img_asparagus.png',
    },
    {
      'file_nm': 'assets/images/img_potato.png',
    },
    {
      'file_nm': 'assets/images/img_carrot.png',
    },
    {
      'file_nm': 'assets/images/img_asparagus.png',
    },
    {
      'file_nm': 'assets/images/img_potato.png',
    },
  ];
  List<Map<String, dynamic>> listData1 = [
    {
      'text':
          '요리 방법 텍스트가 들어갑니다. 요리 방법 텍스트가 들어갑니다. 요리 방법 텍스트가 들어갑니다. 요리 방법 텍스트가 들어갑니다.',
      'file_nm': 'assets/images/img_europe.jpg',
    },
    {
      'text':
          '요리 방법 텍스트가 들어갑니다. 요리 방법 텍스트가 들어갑니다. 요리 방법 텍스트가 들어갑니다. 요리 방법 텍스트가 들어갑니다.',
      'file_nm': 'assets/images/img_europe.jpg',
    },
    {
      'text':
          '요리 방법 텍스트가 들어갑니다. 요리 방법 텍스트가 들어갑니다. 요리 방법 텍스트가 들어갑니다. 요리 방법 텍스트가 들어갑니다.',
      'file_nm': 'assets/images/img_europe.jpg',
    },
    {
      'text':
          '요리 방법 텍스트가 들어갑니다. 요리 방법 텍스트가 들어갑니다. 요리 방법 텍스트가 들어갑니다. 요리 방법 텍스트가 들어갑니다.',
      'file_nm': 'assets/images/img_europe.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonWidgets(appBarText: title),
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    color: Color(0xffEFEFEF),
                    border: Border.all(width: 1, color: AppTheme.gray_D4)),
                // child: Image.network(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaWidth(context, 0.04),
                              0,
                              MediaWidth(context, 0.04),
                              4),
                          child: Text(
                            '요리 이름',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff313033),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaWidth(context, 0.05),
                              0,
                              MediaWidth(context, 0.05),
                              0),
                          child: Container(
                            width: MediaWidth(context, 0.65),
                            child: Text(
                              '레시피 등록 시 입력한 짧은 요리 소개를 출력합니다. 최대 2줄까지 출력할 수 있습니다. ',
                              style: TextStyle(
                                fontSize: 13.0,
                                color: AppTheme.gray_4A,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(right: MediaWidth(context, 0.03)),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share_outlined,
                            color: AppTheme.gray_4A,
                            size: 24,
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaWidth(context, 0.04), 0, MediaWidth(context, 0.04), 4),
                child: Text(
                  '있는 재료',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff313033),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 30,
                    left: MediaWidth(context, 0.04),
                    right: MediaWidth(context, 0.04)),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 70, // 최대 높이 설정
                  ),
                  child: GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: ingredientTrueData.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = ingredientTrueData[index];
                      return Container(
                        width: 25,
                        height: 25,
                        // child: Image.network(
                        child: Image.asset(
                          // 'https://api.gooodall.com/files/${widget.images}',
                          data['file_nm'],
                          fit: BoxFit.fitHeight,
                          width: 25,
                          height: 25,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaWidth(context, 0.04), 0, MediaWidth(context, 0.04), 4),
                child: Text(
                  '없는 재료',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff313033),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 30,
                    left: MediaWidth(context, 0.04),
                    right: MediaWidth(context, 0.04)),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 90, // 최대 높이 설정
                  ),
                  child: GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: ingredientFalseData1.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = ingredientFalseData1[index];
                      return Container(
                        width: 25,
                        height: 25,
                        // child: Image.network(
                        child: Image.asset(
                          // 'https://api.gooodall.com/files/${widget.images}',
                          data['file_nm'],
                          fit: BoxFit.fitHeight,
                          width: 25,
                          height: 25,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(width: 0.5, color: AppTheme.gray_97),
                  bottom: BorderSide(width: 0.5, color: AppTheme.gray_97),
                )),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaWidth(context, 0.1), vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.string('''
                        <svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect x="-0.5" y="0.5" width="49" height="49" rx="9.5" transform="matrix(-1 0 0 1 49 0)" stroke="#FF1414"/>
                        <rect width="38" height="26" rx="5" transform="matrix(-1 0 0 1 44 12)" fill="#FF1414"/>
                        <path d="M31 24.5L22 29.2631V19.7369L31 24.5Z" fill="white"/>
                        </svg>
                        '''),
                      ),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.string('''
                        <svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect x="-0.5" y="0.5" width="49" height="49" rx="9.5" transform="matrix(-1 0 0 1 49 0)" stroke="#00D615"/>
                        <rect width="38" height="26" rx="5" transform="matrix(-1 0 0 1 44 12)" fill="#00D615"/>
                        <path d="M16.308 29.168C15.708 29.168 15.06 28.856 14.52 28.292H14.472L14.328 29H12.948V19.436H14.712V21.848L14.652 22.916C15.192 22.448 15.852 22.124 16.524 22.124C18.168 22.124 19.164 23.468 19.164 25.532C19.164 27.848 17.784 29.168 16.308 29.168ZM15.924 27.716C16.728 27.716 17.352 27.02 17.352 25.568C17.352 24.272 16.956 23.564 16.02 23.564C15.576 23.564 15.156 23.792 14.712 24.26V27.224C15.12 27.596 15.564 27.716 15.924 27.716ZM22.0867 29.168C20.8507 29.168 20.4307 28.364 20.4307 27.116V19.436H22.1947V27.188C22.1947 27.608 22.3747 27.74 22.5427 27.74C22.6027 27.74 22.6507 27.74 22.7707 27.716L22.9867 29.024C22.7827 29.096 22.5067 29.168 22.0867 29.168ZM26.7838 29.168C25.0918 29.168 23.5558 27.872 23.5558 25.652C23.5558 23.42 25.0918 22.124 26.7838 22.124C28.4638 22.124 29.9998 23.42 29.9998 25.652C29.9998 27.872 28.4638 29.168 26.7838 29.168ZM26.7838 27.74C27.6958 27.74 28.1998 26.912 28.1998 25.652C28.1998 24.38 27.6958 23.564 26.7838 23.564C25.8598 23.564 25.3558 24.38 25.3558 25.652C25.3558 26.912 25.8598 27.74 26.7838 27.74ZM33.5995 31.916C32.0275 31.916 30.8035 31.376 30.8035 30.2C30.8035 29.636 31.1395 29.144 31.7635 28.808V28.748C31.4155 28.52 31.1515 28.16 31.1515 27.608C31.1515 27.104 31.4875 26.648 31.9075 26.36V26.312C31.4395 25.976 30.9955 25.34 30.9955 24.548C30.9955 22.964 32.2915 22.124 33.7075 22.124C34.0915 22.124 34.4515 22.184 34.7275 22.292H37.1515V23.588H35.9995C36.1795 23.816 36.3115 24.188 36.3115 24.596C36.3115 26.12 35.1595 26.876 33.7075 26.876C33.4435 26.876 33.1435 26.828 32.8435 26.72C32.6635 26.888 32.5555 27.032 32.5555 27.308C32.5555 27.656 32.8315 27.86 33.6115 27.86H34.7635C36.3835 27.86 37.2715 28.352 37.2715 29.54C37.2715 30.896 35.8435 31.916 33.5995 31.916ZM33.7075 25.796C34.2955 25.796 34.7635 25.34 34.7635 24.548C34.7635 23.756 34.3075 23.324 33.7075 23.324C33.1195 23.324 32.6515 23.756 32.6515 24.548C32.6515 25.34 33.1195 25.796 33.7075 25.796ZM33.8755 30.8C34.8835 30.8 35.5675 30.356 35.5675 29.84C35.5675 29.36 35.1715 29.228 34.4515 29.228H33.6355C33.2275 29.228 32.9515 29.204 32.7115 29.132C32.3995 29.384 32.2675 29.648 32.2675 29.924C32.2675 30.488 32.8915 30.8 33.8755 30.8Z" fill="white"/>
                        </svg>
                        '''),
                      ),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.string('''
                        <svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect x="-0.5" y="0.5" width="49" height="49" rx="9.5" transform="matrix(-1 0 0 1 49 0)" stroke="black"/>
                        <rect width="38" height="26" rx="5" transform="matrix(-1 0 0 1 44 12)" fill="black"/>
                        <path d="M19.28 32L23.44 24.38L19.52 17.2H22.8L24.28 20.26C24.64 20.96 24.96 21.68 25.4 22.6H25.48C25.84 21.68 26.14 20.96 26.46 20.26L27.86 17.2H30.98L27.08 24.52L31.26 32H27.98L26.32 28.72C25.94 27.96 25.58 27.2 25.14 26.28H25.06C24.7 27.2 24.34 27.96 24 28.72L22.42 32H19.28Z" fill="white"/>
                        </svg>
                        '''),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 18, horizontal: MediaWidth(context, 0.04)),
                child: Text(
                  '조리 과정',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff313033),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: listData1.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = listData1[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaWidth(context, 0.04), vertical: 15),
                    child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaWidth(context, 0.65),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: (index + 1).toString() + '. ',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: AppTheme.gray_4A,
                                      ),
                                    ),
                                    TextSpan(
                                      text: data['text'],
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: AppTheme.gray_4A,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(10), // 둥근 모서리 반지름 값
                              // child: Image.network(
                              child: Image.asset(
                                data['file_nm'],
                                fit: BoxFit.cover,
                                width: 70,
                                height: 70,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons
                                        .camera_alt_outlined, // 사용자 프로필 아이콘으로 변경
                                    size: 95, // 아이콘 크기 조절
                                    color: Color(0xffD4D4D4), // 아이콘 색상 설정
                                  );
                                },
                              ),
                            ),
                          ]),
                    ),
                  );
                },
                // // 스크롤 제어
                controller: _scrollController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
