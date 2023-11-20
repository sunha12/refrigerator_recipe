import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';

//같은 레시피들
class RecipeFildWidgets extends StatefulWidget {
  final onPressed;
  final recipeName;
  final images;

  const RecipeFildWidgets(
      {required this.onPressed,
      required this.recipeName,
      required this.images,
      super.key});

  @override
  State<RecipeFildWidgets> createState() => _RecipeFildWidgetsState();
}

class _RecipeFildWidgetsState extends State<RecipeFildWidgets> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: MediaWidth(context, 0.04)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // 둥근 모서리 반지름 값
                    child: Image.network(
                      // 'https://api.gooodall.com/files/${widget.images}',
                      widget.images,
                      fit: BoxFit.cover, // 이미지를 위젯 크기에 맞추기 위해 fit 설정
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: MediaWidth(context, 0.04)),
                  child: Text(
                    widget.recipeName,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset('assets/icons/ico_next.svg'),
            ),
          ],
        ),
      ),
    );
  }
}

//단일 레시피 개별
class RecipeWidgets extends StatefulWidget {
  final onPressed;
  final recipeName;
  final images;
  final info;

  const RecipeWidgets(
      {required this.onPressed,
      required this.recipeName,
      required this.images,
      required this.info,
      super.key});

  @override
  State<RecipeWidgets> createState() => _RecipeWidgetsState();
}

class _RecipeWidgetsState extends State<RecipeWidgets> {
  bool private = true;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: MediaWidth(context, 0.04)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // 둥근 모서리 반지름 값
                child: Image.network(
                  // 'https://api.gooodall.com/files/${widget.images}',
                  widget.images,
                  fit: BoxFit.cover, // 이미지를 위젯 크기에 맞추기 위해 fit 설정
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: MediaWidth(context, 0.04)),
                        child: Text(
                          widget.recipeName,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: MediaWidth(context, 0.47)),
                        child: InkWell(
                          onTap: () {
                            // 클릭 이벤트 처리
                          },
                          child: SvgPicture.asset('assets/icons/ico_scrap.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaWidth(context, 0.04),
                  ),
                  child: Container(
                    width: MediaWidth(context, 0.65),
                    child: Text(
                      widget.info,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true, // 자동으로 줄바꿈
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 11,
                        color: AppTheme.gray_4A,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
