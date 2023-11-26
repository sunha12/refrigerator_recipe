import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';

//재료 필드
class IngredientWidgets extends StatefulWidget {
  final onPressed;
  final ingredientName;
  final images;
  final dete;
  final count;

  const IngredientWidgets(
      {required this.onPressed,
      required this.ingredientName,
      required this.images,
      required this.dete,
      required this.count,
      super.key});

  @override
  State<IngredientWidgets> createState() => _IngredientWidgetsState();
}

class _IngredientWidgetsState extends State<IngredientWidgets> {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    border: Border.all(
                      width: 1,
                      color: Color(0xffEBEBEB),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50), // 둥근 모서리 반지름 값
                      child: Image.network(
                        // 'https://api.gooodall.com/files/${widget.images}',
                        widget.images,
                        // fit: BoxFit.cover, // 이미지를 위젯 크기에 맞추기 위해 fit 설정
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: MediaWidth(context, 0.04)),
                        child: Text(
                          '${widget.ingredientName} ${widget.count}',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.gray_4A,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaWidth(context, 0.04),
                      ),
                      child: Text(
                        '유통기한 ${widget.dete}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true, // 자동으로 줄바꿈
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffA8A8A8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SvgPicture.asset('assets/icons/ico_next.svg'),
          ],
        ),
      ),
    );
  }
}
