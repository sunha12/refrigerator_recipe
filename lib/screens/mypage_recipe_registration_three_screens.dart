import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/provider/ingredient.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/back_button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/registration_mod_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';

class RecipeRegistrationPageThree extends StatefulWidget {
  const RecipeRegistrationPageThree({super.key});

  @override
  State<RecipeRegistrationPageThree> createState() =>
      _RecipeRegistrationPageThreeState();
}

class _RecipeRegistrationPageThreeState
    extends State<RecipeRegistrationPageThree> {
  @override
  final String initialRecipeName = '';
  final String initialRecipeDescription = '';
  final String initialRecipeLink = '';

  void onNameChanged(String value) {}
  void onDescriptionChanged(String value) {}
  void onLinkChanged(String value) {}

  @override
  void dispose() {
    //데이터 리셋
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 0.5, color: AppTheme.gray_97))),
                child: temporaryStorageBackButtonWidgets(
                  appBarText: '레시피 등록 (3/3)',
                  onPressed1: () {},
                  onPressed2: () {},
                  isSave: true,
                  isClose: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaWidth(context, 0.05), 25,
                    MediaWidth(context, 0.05), 5),
                child: Text(
                  '레시피 링크',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaWidth(context, 0.1), vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.string('''
                        <svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect x="-0.5" y="0.5" width="49" height="49" rx="9.5" transform="matrix(-1 0 0 1 49 0)" stroke="#FF1414"/>
                        <rect width="38" height="26" rx="5" transform="matrix(-1 0 0 1 44 12)" fill="#FF1414"/>
                        <path d="M31 24.5L22 29.2631V19.7369L31 24.5Z" fill="white"/>
                        </svg>
                        '''),
                    SvgPicture.string('''
                        <svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect x="-0.5" y="0.5" width="49" height="49" rx="9.5" transform="matrix(-1 0 0 1 49 0)" stroke="#00D615"/>
                        <rect width="38" height="26" rx="5" transform="matrix(-1 0 0 1 44 12)" fill="#00D615"/>
                        <path d="M16.308 29.168C15.708 29.168 15.06 28.856 14.52 28.292H14.472L14.328 29H12.948V19.436H14.712V21.848L14.652 22.916C15.192 22.448 15.852 22.124 16.524 22.124C18.168 22.124 19.164 23.468 19.164 25.532C19.164 27.848 17.784 29.168 16.308 29.168ZM15.924 27.716C16.728 27.716 17.352 27.02 17.352 25.568C17.352 24.272 16.956 23.564 16.02 23.564C15.576 23.564 15.156 23.792 14.712 24.26V27.224C15.12 27.596 15.564 27.716 15.924 27.716ZM22.0867 29.168C20.8507 29.168 20.4307 28.364 20.4307 27.116V19.436H22.1947V27.188C22.1947 27.608 22.3747 27.74 22.5427 27.74C22.6027 27.74 22.6507 27.74 22.7707 27.716L22.9867 29.024C22.7827 29.096 22.5067 29.168 22.0867 29.168ZM26.7838 29.168C25.0918 29.168 23.5558 27.872 23.5558 25.652C23.5558 23.42 25.0918 22.124 26.7838 22.124C28.4638 22.124 29.9998 23.42 29.9998 25.652C29.9998 27.872 28.4638 29.168 26.7838 29.168ZM26.7838 27.74C27.6958 27.74 28.1998 26.912 28.1998 25.652C28.1998 24.38 27.6958 23.564 26.7838 23.564C25.8598 23.564 25.3558 24.38 25.3558 25.652C25.3558 26.912 25.8598 27.74 26.7838 27.74ZM33.5995 31.916C32.0275 31.916 30.8035 31.376 30.8035 30.2C30.8035 29.636 31.1395 29.144 31.7635 28.808V28.748C31.4155 28.52 31.1515 28.16 31.1515 27.608C31.1515 27.104 31.4875 26.648 31.9075 26.36V26.312C31.4395 25.976 30.9955 25.34 30.9955 24.548C30.9955 22.964 32.2915 22.124 33.7075 22.124C34.0915 22.124 34.4515 22.184 34.7275 22.292H37.1515V23.588H35.9995C36.1795 23.816 36.3115 24.188 36.3115 24.596C36.3115 26.12 35.1595 26.876 33.7075 26.876C33.4435 26.876 33.1435 26.828 32.8435 26.72C32.6635 26.888 32.5555 27.032 32.5555 27.308C32.5555 27.656 32.8315 27.86 33.6115 27.86H34.7635C36.3835 27.86 37.2715 28.352 37.2715 29.54C37.2715 30.896 35.8435 31.916 33.5995 31.916ZM33.7075 25.796C34.2955 25.796 34.7635 25.34 34.7635 24.548C34.7635 23.756 34.3075 23.324 33.7075 23.324C33.1195 23.324 32.6515 23.756 32.6515 24.548C32.6515 25.34 33.1195 25.796 33.7075 25.796ZM33.8755 30.8C34.8835 30.8 35.5675 30.356 35.5675 29.84C35.5675 29.36 35.1715 29.228 34.4515 29.228H33.6355C33.2275 29.228 32.9515 29.204 32.7115 29.132C32.3995 29.384 32.2675 29.648 32.2675 29.924C32.2675 30.488 32.8915 30.8 33.8755 30.8Z" fill="white"/>
                        </svg>
                        '''),
                    SvgPicture.string('''
                        <svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect x="-0.5" y="0.5" width="49" height="49" rx="9.5" transform="matrix(-1 0 0 1 49 0)" stroke="black"/>
                        <rect width="38" height="26" rx="5" transform="matrix(-1 0 0 1 44 12)" fill="black"/>
                        <path d="M19.28 32L23.44 24.38L19.52 17.2H22.8L24.28 20.26C24.64 20.96 24.96 21.68 25.4 22.6H25.48C25.84 21.68 26.14 20.96 26.46 20.26L27.86 17.2H30.98L27.08 24.52L31.26 32H27.98L26.32 28.72C25.94 27.96 25.58 27.2 25.14 26.28H25.06C24.7 27.2 24.34 27.96 24 28.72L22.42 32H19.28Z" fill="white"/>
                        </svg>
                        '''),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaWidth(context, 0.05), 25,
                    MediaWidth(context, 0.05), 5),
                child: SvgPicture.string('''
                        <svg width="25" height="17" viewBox="0 0 25 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect width="25" height="17" rx="3" transform="matrix(-1 0 0 1 25 0)" fill="#FF1414"/>
                        <path d="M16 8.5L10 11.5311V5.46891L16 8.5Z" fill="white"/>
                        </svg>
                          '''),
              ),
              LongTextInputFildWidgets(
                hintText: 'https://',
                onChanged: onLinkChanged,
                inText: initialRecipeLink,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaWidth(context, 0.05), 25,
                    MediaWidth(context, 0.05), 5),
                child: SvgPicture.string('''
                       <svg width="25" height="20" viewBox="0 0 25 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                       <rect width="25" height="17" rx="3" transform="matrix(-1 0 0 1 25 2)" fill="#00D615"/>
                       <path d="M7.513 13.098C7.163 13.098 6.785 12.916 6.47 12.587H6.442L6.358 13H5.553V7.421H6.582V8.828L6.547 9.451C6.862 9.178 7.247 8.989 7.639 8.989C8.598 8.989 9.179 9.773 9.179 10.977C9.179 12.328 8.374 13.098 7.513 13.098ZM7.289 12.251C7.758 12.251 8.122 11.845 8.122 10.998C8.122 10.242 7.891 9.829 7.345 9.829C7.086 9.829 6.841 9.962 6.582 10.235V11.964C6.82 12.181 7.079 12.251 7.289 12.251ZM10.7839 13.098C10.0629 13.098 9.81788 12.629 9.81788 11.901V7.421H10.8469V11.943C10.8469 12.188 10.9519 12.265 11.0499 12.265C11.0849 12.265 11.1129 12.265 11.1829 12.251L11.3089 13.014C11.1899 13.056 11.0289 13.098 10.7839 13.098ZM13.4239 13.098C12.4369 13.098 11.5409 12.342 11.5409 11.047C11.5409 9.745 12.4369 8.989 13.4239 8.989C14.4039 8.989 15.2999 9.745 15.2999 11.047C15.2999 12.342 14.4039 13.098 13.4239 13.098ZM13.4239 12.265C13.9559 12.265 14.2499 11.782 14.2499 11.047C14.2499 10.305 13.9559 9.829 13.4239 9.829C12.8849 9.829 12.5909 10.305 12.5909 11.047C12.5909 11.782 12.8849 12.265 13.4239 12.265ZM17.2997 14.701C16.3827 14.701 15.6687 14.386 15.6687 13.7C15.6687 13.371 15.8647 13.084 16.2287 12.888V12.853C16.0257 12.72 15.8717 12.51 15.8717 12.188C15.8717 11.894 16.0677 11.628 16.3127 11.46V11.432C16.0397 11.236 15.7807 10.865 15.7807 10.403C15.7807 9.479 16.5367 8.989 17.3627 8.989C17.5867 8.989 17.7967 9.024 17.9577 9.087H19.3717V9.843H18.6997C18.8047 9.976 18.8817 10.193 18.8817 10.431C18.8817 11.32 18.2097 11.761 17.3627 11.761C17.2087 11.761 17.0337 11.733 16.8587 11.67C16.7537 11.768 16.6907 11.852 16.6907 12.013C16.6907 12.216 16.8517 12.335 17.3067 12.335H17.9787C18.9237 12.335 19.4417 12.622 19.4417 13.315C19.4417 14.106 18.6087 14.701 17.2997 14.701ZM17.3627 11.131C17.7057 11.131 17.9787 10.865 17.9787 10.403C17.9787 9.941 17.7127 9.689 17.3627 9.689C17.0197 9.689 16.7467 9.941 16.7467 10.403C16.7467 10.865 17.0197 11.131 17.3627 11.131ZM17.4607 14.05C18.0487 14.05 18.4477 13.791 18.4477 13.49C18.4477 13.21 18.2167 13.133 17.7967 13.133H17.3207C17.0827 13.133 16.9217 13.119 16.7817 13.077C16.5997 13.224 16.5227 13.378 16.5227 13.539C16.5227 13.868 16.8867 14.05 17.4607 14.05Z" fill="white"/>
                        </svg>
                          '''),
              ),
              LongTextInputFildWidgets(
                hintText: 'https://',
                onChanged: onLinkChanged,
                inText: initialRecipeLink,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaWidth(context, 0.05), 25,
                    MediaWidth(context, 0.05), 5),
                child: SvgPicture.string('''
                        <svg width="25" height="20" viewBox="0 0 25 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect width="25" height="17" rx="3" transform="matrix(-1 0 0 1 25 1)" fill="black"/>
                        <path d="M9.14 14L11.22 10.19L9.26 6.6H10.9L11.64 8.13C11.82 8.48 11.98 8.84 12.2 9.3H12.24C12.42 8.84 12.57 8.48 12.73 8.13L13.43 6.6H14.99L13.04 10.26L15.13 14H13.49L12.66 12.36C12.47 11.98 12.29 11.6 12.07 11.14H12.03C11.85 11.6 11.67 11.98 11.5 12.36L10.71 14H9.14Z" fill="white"/>
                        </svg>
                          '''),
              ),
              LongTextInputFildWidgets(
                hintText: 'https://',
                onChanged: onLinkChanged,
                inText: initialRecipeLink,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: LongButtonWidgets(
                    onPressed: () {},
                    colorId: AppTheme.orange,
                    buttonText: '등록하기',
                    iconUrl: ''),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageUploader() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaHeight(context, 0.5),
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
              buttonText: '한식',
              icon: '',
            ),
            TextButtonNotBorderWidgets(
              onPressed: () {},
              buttonText: '일식',
              icon: '',
            ),
            TextButtonNotBorderWidgets(
              onPressed: () {},
              buttonText: '중식',
              icon: '',
            ),
            TextButtonNotBorderWidgets(
              onPressed: () {},
              buttonText: '양식',
              icon: '',
            ),
            TextButtonNotBorderWidgets(
              onPressed: () {},
              buttonText: '퓨전 음식',
              icon: '',
            ),
            TextButtonNotBorderWidgets(
              onPressed: () {},
              buttonText: '디저트',
              icon: '',
            ),
          ],
        ),
      ),
    );
  }
}
