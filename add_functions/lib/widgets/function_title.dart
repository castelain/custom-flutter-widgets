import 'package:add_functions/style/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class FunctionTitle extends StatelessWidget {
  String text;

  FunctionTitle({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FunctionSelectionStyle.contentBgColor,
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.only(top: 20),
      child: Center(
        child: Text(
          text,
          style: FunctionSelectionStyle.titleStyle,
        ),
      ),
    );
  }
}
