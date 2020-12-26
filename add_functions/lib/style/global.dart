import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class FunctionSelectionStyle {
  static Color backgroundColor = Colors.grey[200];
  static Color contentBgColor = Colors.white;

  static TextStyle titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static EdgeInsets titleMargin = EdgeInsets.only(top: 20);

  static double wrapSpacing = 2.0;

  static TextStyle iconTitleStyle = TextStyle(
    fontSize: 12,
  );

  static Color operationRemoveIconColor = Colors.grey;
  static Color operationAddIconColor = Colors.blue;
  static double operationIconSize = 20;

  static double boxWidth = ScreenUtil().setWidth(146);
  static double boxHeight = ScreenUtil().setHeight(130);
  static EdgeInsets boxPadding = EdgeInsets.all(8);
}
