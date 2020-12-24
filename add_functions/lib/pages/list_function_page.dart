import 'package:add_functions/pages/style/global.dart';
import 'package:add_functions/provide/functionList_provide.dart';
import 'package:add_functions/routers/application.dart';
import 'package:add_functions/widgets/function_entrance.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

class ListFunctionPage extends StatefulWidget {
  @override
  _ListFunctionPageState createState() => _ListFunctionPageState();
}

class _ListFunctionPageState extends State<ListFunctionPage> {
  // ignore: non_constant_identifier_names
  Widget Title = Center(
    child: Column(
      children: [
        Text(
          '我的功能',
        ),
      ],
    ),
  );

  Widget buildAddButton(context) => InkWell(
        child: DottedBorder(
          color: FunctionSelectionStyle.operationRemoveIconColor,
          child: Container(
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(160),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: FunctionSelectionStyle.operationRemoveIconColor,
                ),
                Text(
                  '添加',
                )
              ],
            ),
          ),
        ),
        onTap: () {
          Application.router.navigateTo(context, '/select-function');
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('全部功能'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Title,
            Provide<FunctionListProvide>(
              builder: (context, child, scope) {
                List<Widget> selectedFunctions = List();
                scope.selectedFunctionList.forEach((item) {
                  selectedFunctions.add(FunctionEntrance(
                    id: item.id,
                    iconName: item.iconName,
                    iconColor: item.iconColor,
                    title: item.title,
                    url: item.url,
                  ));
                });
                return Expanded(
                  child: GridView.count(
                    crossAxisCount: 5,
                    physics: NeverScrollableScrollPhysics(),
                    children: selectedFunctions,
                  ),
                );
              },
            ),
            buildAddButton(context),
            Text('全部功能'),
            Provide<FunctionListProvide>(builder: (context, child, scope) {
              List<Widget> unSelectedFunctions = List();
              scope.unSelectFunctionList.forEach((item) {
                unSelectedFunctions.add(FunctionEntrance(
                  id: item.id,
                  iconName: item.iconName,
                  iconColor: item.iconColor,
                  title: item.title,
                  url: item.url,
                ));
              });
              return Expanded(
                child: GridView.count(
                  crossAxisCount: 5,
                  physics: NeverScrollableScrollPhysics(),
                  children: unSelectedFunctions,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
