import 'package:add_functions/routers/application.dart';
import 'package:add_functions/style/global.dart';
import 'package:flutter/material.dart';

class FunctionEntrance extends StatelessWidget {
  int id;
  String iconName;
  String iconColor;
  String title;
  String url;

  FunctionEntrance(
      {Key key, this.id, this.iconName, this.iconColor, this.title, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: FunctionSelectionStyle.boxWidth,
      height: FunctionSelectionStyle.boxHeight,
      padding: FunctionSelectionStyle.boxPadding,
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Icon(
              Icons.account_balance,
              color: Colors.deepPurple,
            )),
            Text(
              title,
              style: FunctionSelectionStyle.titleStyle,
            ),
          ],
        ),
        onTap: () {
          Application.router.navigateTo(context, url);
        },
      ),
    );
  }
}
