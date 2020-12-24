import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class FunctionSelectionStyle {
  static Color backgroundColor = Colors.grey[200];

  static TextStyle titleStyle = TextStyle(
    fontSize: 12,
  );

  static Color operationRemoveIconColor = Colors.grey;
  static Color operationAddIconColor = Colors.blue;
  static double operationIconSize = 20;

  static double boxWidth = ScreenUtil().setWidth(130);
  static double boxHeight = ScreenUtil().setHeight(130);
  static EdgeInsets boxPadding = EdgeInsets.all(8);
}
