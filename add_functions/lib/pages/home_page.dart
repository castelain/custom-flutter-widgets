import 'dart:math';

import 'package:add_functions/database/database_helper.dart';
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
  // 伪造数据，并进行持久化
  List<FunctionModel> functionList = List.generate(
      11,
      (index) => FunctionModel(
          id: Random().nextInt(1000),
          iconName: 'account_balance',
          iconColor: 'deepPurple',
          title: '仓库查询',
          url: '/warehouse-query',
          isSelected: 0));

  void _storeData() async {
    var dbClient = DatabaseHelper();
    // 先清空数据库中已保存的数据
    await dbClient.removeAllFunctionModels().then((value) => {
          functionList.forEach((item) async {
            await dbClient.addFunctionModel(item);
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    _storeData();
    Provide.value<FunctionListProvide>(context).filterFunctions(functionList);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('添加功能到首页'),
      ),
      body: Container(
        child: SelectFunctionArea(),
      ),
    );
  }
}
