import 'package:add_functions/pages/style/global.dart';
import 'package:add_functions/provide/functionList_provide.dart';
import 'package:add_functions/routers/application.dart';
import 'package:add_functions/widgets/function_entrance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

class SelectFunctionArea extends StatefulWidget {
  @override
  _SelectFunctionAreaState createState() => _SelectFunctionAreaState();
}

class _SelectFunctionAreaState extends State<SelectFunctionArea> {
  List<Widget> list = List();

  @override
  void initState() {
    super.initState();
    list.add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.grey[100],
      width: ScreenUtil().setWidth(750),
      height: double.infinity,
      child: Center(
        child: Provide<FunctionListProvide>(
          builder: (buildContext, child, scope) {
            List<Widget> newList = List();
            scope.selectedFunctionList.forEach((item) => {
                  newList.add(FunctionEntrance(
                    iconName: item.iconName,
                    iconColor: item.iconColor,
                    title: item.title,
                    url: item.url,
                  ))
                });
            list.removeRange(0, list.length - 1);
            list.insertAll(list.length - 1, newList);
            return Wrap(
              spacing: 10.0,
              children: list,
            );
          },
        ),
      ),
    );
  }

  Widget buildAddButton() {
    return Builder(builder: (context) {
      return GestureDetector(
        child: Container(
          width: FunctionSelectionStyle.boxWidth,
          height: FunctionSelectionStyle.boxHeight,
          padding: FunctionSelectionStyle.boxPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Icon(
                  Icons.workspaces_filled,
                  color: Colors.grey,
                ),
              ),
              Text(
                '全部',
                style: FunctionSelectionStyle.titleStyle,
              ),
            ],
          ),
        ),
        onTap: () {
          Application.router.navigateTo(context, '/list-function');
        },
      );
    });
  }
}
