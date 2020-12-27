import 'dart:math';

import 'package:add_functions/database/database_helper.dart';
import 'package:add_functions/model/functionList_model.dart';
import 'package:add_functions/style/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import 'home_page/select_function_area.dart';

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
          iconName: 'images/warehouse-query.png',
          iconColor: 'deepPurple',
          title: '仓库查询$index',
          url: '/warehouse-query',
          isSelected: 0));

  @override
  void initState() {
    super.initState();
    _storeData();
  }

  void _storeData() async {
    var dbClient = DatabaseHelper();
    List<FunctionModel> list = await dbClient.getAllFunctions();
    if (list.length == 0) {
      functionList.forEach((item) async {
        await dbClient.addFunctionModel(item);
      });
    }
    // dbClient.removeAllFunctionModels().then((res) => {
    //       functionList.forEach((item) async {
    //         await dbClient.addFunctionModel(item);
    //       })
    //     });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleGestureDetector(
      onHorizontalSwipe: (SwipeDirection direction) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('添加功能到首页'),
        ),
        body: Container(
          child: SelectFunctionArea(),
        ),
        backgroundColor: FunctionSelectionStyle.backgroundColor,
      ),
    );
  }
}
