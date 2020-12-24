import 'package:add_functions/provide/functionList_provide.dart';
import 'package:add_functions/routers/application.dart';
import 'package:add_functions/widgets/function_selected.dart';
import 'package:add_functions/widgets/function_to_be_select.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class SelectFunctionPage extends StatefulWidget {
  @override
  _SelectFunctionPageState createState() => _SelectFunctionPageState();
}

class _SelectFunctionPageState extends State<SelectFunctionPage> {
  // ignore: non_constant_identifier_names
  Widget Title = Center(
      child: Column(
    children: [
      Text(
        '你可以将常用的功能添加到系统首页，',
      ),
      Text('下面是首页已添加的功能')
    ],
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: TextButton(
          child: Text(
            '取消',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          onPressed: () {
            Provide.value<FunctionListProvide>(context).initData();
            Application.router.navigateTo(context, '/list-function');
          },
        ),
        title: Text(
          '管理我的功能',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          ElevatedButton(
            child: Text('完成'),
            onPressed: () {
              Provide.value<FunctionListProvide>(context)
                  .commitSelectedFunctions();
              Application.router.navigateTo(context, '/list-function');
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Title,
            Provide<FunctionListProvide>(builder: (context, child, scope) {
              List<Widget> selectedFunctions = List();
              scope.selectedFunctionList.forEach((item) {
                selectedFunctions.add(FunctionSelected(
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
            }),
            Text('其它功能'),
            Provide<FunctionListProvide>(builder: (context, child, scope) {
              List<Widget> unSelectedFunctions = List();
              scope.unSelectFunctionList.forEach((item) {
                unSelectedFunctions.add(FunctionToBeSelect(
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
