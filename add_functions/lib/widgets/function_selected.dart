import 'package:add_functions/pages/style/global.dart';
import 'package:add_functions/provide/functionList_provide.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class FunctionSelected extends StatelessWidget {
  int id;
  String iconName;
  String iconColor;
  String title;
  String url;

  FunctionSelected(
      {Key key, this.id, this.iconName, this.iconColor, this.title, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: FunctionSelectionStyle.boxWidth,
      height: FunctionSelectionStyle.boxHeight,
      padding: FunctionSelectionStyle.boxPadding,
      child: Stack(
        children: [
          Column(
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
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              child: Icon(
                Icons.cancel,
                size: FunctionSelectionStyle.operationIconSize,
                color: FunctionSelectionStyle.operationRemoveIconColor,
              ),
              onTap: () {
                print('移除功能，id为：$id');
                Provide.value<FunctionListProvide>(context).removeFunction(id);
              },
            ),
          )
        ],
      ),
    );
  }
}
