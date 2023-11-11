import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:refrigerator_recipe_app/widgets/button_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/calendar_widgets.dart';
import 'package:refrigerator_recipe_app/widgets/text_input_widgets.dart';

//버튼색 일반
class ShortSizeBoxWidgets extends StatefulWidget {
  final String hintText;
  final Color colorId;
  final String buttonText;
  final String iconUrl;
  final String inText;
  final bool isvVsible;
  final ValueChanged<String> onChanged;
  final VoidCallback onPressed;

  const ShortSizeBoxWidgets(
      {required this.hintText,
      required this.colorId,
      required this.buttonText,
      required this.iconUrl,
      required this.isvVsible,
      required this.onPressed,
      required this.onChanged,
      required this.inText,
      super.key});

  @override
  State<ShortSizeBoxWidgets> createState() => _ShortSizeBoxWidgetsState();
}

class _ShortSizeBoxWidgetsState extends State<ShortSizeBoxWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaWidth(context, 0.04)),
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(right: MediaWidth(context, 0.02)),
                child: ShortTextInputFildWidgets(
                  hintText: widget.hintText,
                  isvVsible: widget.isvVsible,
                  onChanged: widget.onChanged,
                  inText: widget.inText,
                ),
              ),
            ),
            Expanded(
              child: ShortButtonWidgets(
                  onPressed: widget.onPressed,
                  colorId: widget.colorId,
                  buttonText: widget.buttonText,
                  iconUrl: widget.iconUrl),
            ),
          ],
        ),
      ),
    );
  }
}

//버튼색 흰색
class ShortWhiteSizeBoxWidgets extends StatefulWidget {
  final String hintText;
  final String buttonText;
  final String iconUrl;
  final bool isvVsible;
  final String inText;
  final ValueChanged<String> onChanged;
  final VoidCallback onPressed;

  const ShortWhiteSizeBoxWidgets(
      {required this.hintText,
      required this.buttonText,
      required this.iconUrl,
      required this.isvVsible,
      required this.onPressed,
      required this.onChanged,
      required this.inText,
      super.key});

  @override
  State<ShortWhiteSizeBoxWidgets> createState() =>
      _ShortWhiteSizeBoxWidgetsState();
}

class _ShortWhiteSizeBoxWidgetsState extends State<ShortWhiteSizeBoxWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaWidth(context, 0.04)),
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(right: MediaWidth(context, 0.02)),
                child: ShortTextInputFildWidgets(
                  hintText: widget.hintText,
                  isvVsible: widget.isvVsible,
                  onChanged: widget.onChanged,
                  inText: widget.inText,
                ),
              ),
            ),
            Expanded(
              child: ShortWhiteButtonWidgets(
                  onPressed: widget.onPressed,
                  buttonText: widget.buttonText,
                  iconUrl: widget.iconUrl),
            ),
          ],
        ),
      ),
    );
  }
}
