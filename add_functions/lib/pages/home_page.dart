import 'package:add_functions/model/functionList_model.dart';
import 'package:add_functions/pages/home_page/select_function_area.dart';
import 'package:add_functions/provide/functionList_provide.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FunctionModel> functionList = List.generate(
      11,
      (index) => FunctionModel(
          id: index,
          iconName: 'account_balance',
          iconColor: 'deepPurple',
          title: '仓库查询',
          url: '/warehouse-query',
          isSelected: false));

  @override
  Widget build(BuildContext context) {
    Provide.value<FunctionListProvide>(context).filterFunctions(functionList);

    return Scaffold(
      appBar: AppBar(
        title: Text('添加功能到首页'),
      ),
      body: Container(
        child: SelectFunctionArea(),
      ),
    );
  }
}
