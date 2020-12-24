import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class AnjiRaisedButtion extends StatelessWidget {
  String text;
  Function onPressedHandler;

  AnjiRaisedButtion({
    Key key,
    @required this.text,
    @required this.onPressedHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(340),
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onPressedHandler,
      ),
    );
  }
}
