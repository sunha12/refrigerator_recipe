import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refrigerator_recipe_app/constants/constants.dart';
import 'package:refrigerator_recipe_app/widgets/timer_widgets.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:refrigerator_recipe_app/styles/theme.dart';
import 'dart:async';

//가로 길이가 짧은 텍스트 위젯
class ShortTextInputFildWidgets extends StatefulWidget {
  final String hintText;
  final bool isvVsible;
  final ValueChanged<String> onChanged;
  final String inText;

  const ShortTextInputFildWidgets(
      {required this.hintText,
      required this.inText,
      required this.isvVsible,
      required this.onChanged,
      super.key});

  @override
  State<ShortTextInputFildWidgets> createState() =>
      _ShortTextInputFildWidgetsState();
}

class _ShortTextInputFildWidgetsState extends State<ShortTextInputFildWidgets> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 텍스트 필드의 초기값 설정
    _controller.text = widget.inText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          counterStyle: TextStyle(color: AppTheme.gray_md),
          hintText: widget.hintText,
          suffixIcon: Container(
            height: 14,
            width: 0.2,
            child: Visibility(
              visible: widget.isvVsible, // true이면 화면에 보이고, false이면 감춥니다.
              child: TimerWidgets(),
            ),
          ),
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
        style: TextStyle(
          fontSize: 12,
        ),
        controller: _controller,
        onChanged: widget.onChanged,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

//가로 길이기 긴 텍스트 위젯
class LongTextInputFildWidgets extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final String inText;

  const LongTextInputFildWidgets(
      {required this.hintText,
      required this.onChanged,
      required this.inText,
      Key? key})
      : super(key: key);

  @override
  State<LongTextInputFildWidgets> createState() =>
      _LongTextInputFildWidgetsState();
}

class _LongTextInputFildWidgetsState extends State<LongTextInputFildWidgets> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 텍스트 필드의 초기값 설정
    _controller.text = widget.inText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaWidth(context, 0.04)),
      child: TextField(
        decoration: InputDecoration(
          counterStyle: TextStyle(color: AppTheme.gray_md),
          hintText: widget.hintText,
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
        controller: _controller,
        style: TextStyle(
          fontSize: 12,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

//글자수 20글자 제한이 있는 텍스트 필드

class TwentyMaxTextInputFildWidgets extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final String inText;

  const TwentyMaxTextInputFildWidgets(
      {required this.hintText,
      required this.onChanged,
      required this.inText,
      Key? key})
      : super(key: key);

  @override
  State<TwentyMaxTextInputFildWidgets> createState() =>
      _TwentyMaxTextInputFildWidgetsState();
}

class _TwentyMaxTextInputFildWidgetsState
    extends State<TwentyMaxTextInputFildWidgets> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 텍스트 필드의 초기값 설정
    _controller.text = widget.inText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaWidth(context, 0.04)),
      child: Container(
        width: double.infinity,
        child: TextField(
          maxLength: 20,
          controller: _controller,
          decoration: InputDecoration(
            counterStyle: TextStyle(color: AppTheme.gray_md),
            hintText: widget.hintText,
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
          style: TextStyle(
            fontSize: 12,
          ),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// 기본 3줄에서 시작해서 입력값에 따라 늘어나는 텍스트 필드
class BigTextInputFildWidgets extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final String inText;

  const BigTextInputFildWidgets(
      {required this.hintText,
      required this.onChanged,
      required this.inText,
      super.key});

  @override
  State<BigTextInputFildWidgets> createState() =>
      _BigTextInputFildWidgetsState();
}

class _BigTextInputFildWidgetsState extends State<BigTextInputFildWidgets> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 텍스트 필드의 초기값 설정
    _controller.text = widget.inText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaWidth(context, 0.04)),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              counterStyle: TextStyle(color: AppTheme.gray_md),
              hintText: widget.hintText,
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
            maxLines: 12, // 최대 행 수
            minLines: 3, // 최소 라인 수
            // maxLength: 1000, //최대 글자수
            controller: _controller,
            style: TextStyle(
              fontSize: 12,
            ),
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
