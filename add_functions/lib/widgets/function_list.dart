import 'package:add_functions/style/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class FunctionList extends StatelessWidget {
  List<Widget> list = List();

  FunctionList({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      color: FunctionSelectionStyle.contentBgColor,
      // child: Center(
      child: Wrap(
        spacing: FunctionSelectionStyle.wrapSpacing,
        children: list,
        // ),
      ),
    );
  }
}
