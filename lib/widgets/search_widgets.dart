import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';

class SearchWidgets extends StatefulWidget {
  final onPressed;
  final controller;

  const SearchWidgets({
    required this.onPressed,
    required this.controller,
    super.key,
  });

  @override
  State<SearchWidgets> createState() => _SearchWidgetsState();
}

class _SearchWidgetsState extends State<SearchWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaWidth(context, 0.04), vertical: 10),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: '검색',
          hintStyle: TextStyle(fontSize: 14, color: AppTheme.gray_md),
          labelStyle: TextStyle(fontSize: 14, color: AppTheme.gray_4A),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppTheme.gray_D9),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppTheme.gray_D9),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon:
              //검색
              IconButton(
            onPressed: widget.onPressed,
            icon: SvgPicture.asset("assets/icons/ico_search.svg"),
          ),
        ),
      ),
    );
  }
}
