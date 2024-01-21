import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';

class RecipeRegistrationCookingProcessWidgets extends StatefulWidget {
  final String number;
  final ValueChanged<String> onChanged;
  final VoidCallback onPressed;

  const RecipeRegistrationCookingProcessWidgets({
    required this.number,
    required this.onChanged,
    required this.onPressed,
    super.key,
  });

  @override
  State<RecipeRegistrationCookingProcessWidgets> createState() =>
      _RecipeRegistrationCookingProcessWidgetsState();
}

class _RecipeRegistrationCookingProcessWidgetsState
    extends State<RecipeRegistrationCookingProcessWidgets> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaWidth(context, 0.04)),
      child: Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.number,
                style: TextStyle(
                  fontSize: 13,
                  color: AppTheme.gray_4A,
                ),
              ),
              Container(
                width: MediaWidth(context, 0.65),
                child: TextField(
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: AppTheme.gray_md),
                    hintText: '조리과정을 작성해주세요',
                    //기본 상태
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppTheme.gray_D4),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    //포커스 상태
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppTheme.gray_D4),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                  maxLines: 2,
                  maxLength: 70, //최대 글자수
                  controller: _controller,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                  onChanged: widget.onChanged,
                ),
              ),
              Container(
                width: 70,
                height: 70,
                child: TextButton(
                  onPressed: widget.onPressed,
                  child: Icon(
                    Icons.photo_camera_outlined,
                    color: AppTheme.gray_4A,
                    size: 25,
                  ),
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(
                        color: AppTheme.gray_D4,
                        width: 1.0,
                      ),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    overlayColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor:
                        MaterialStateProperty.all(AppTheme.gray_4A),
                  ),
                ),
              )
            ]),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
