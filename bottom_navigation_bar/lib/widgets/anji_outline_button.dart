import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class AnjiOutlineButton extends StatelessWidget {
  String text;
  Function onPressedHandler;

  AnjiOutlineButton({
    Key key,
    @required this.text,
    @required this.onPressedHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(340),
      child: OutlineButton(
        color: Colors.white,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onPressed: onPressedHandler,
      ),
    );
  }
}
