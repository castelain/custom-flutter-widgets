import 'package:add_functions/database/database_helper.dart';
import 'package:add_functions/model/functionList_model.dart';
import 'package:add_functions/widgets/function_entrance.dart';
import 'package:add_functions/widgets/function_list.dart';
import 'package:flutter/material.dart';

class SelectFunctionArea extends StatefulWidget {
  @override
  _SelectFunctionAreaState createState() => _SelectFunctionAreaState();
}

class _SelectFunctionAreaState extends State<SelectFunctionArea> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Widget>> _getSelectedFunctionModelList() async {
    List<FunctionEntrance> selectedList = List();
    var dbClient = DatabaseHelper();
    List<FunctionModel> list = await dbClient.getSelectedFunctions();
    selectedList = [];
    list.forEach((item) {
      selectedList.add(FunctionEntrance(
        id: item.id,
        iconName: item.iconName,
        iconColor: item.iconColor,
        title: item.title,
        url: item.url,
      ));
    });
    return selectedList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _getSelectedFunctionModelList(),
        builder: (context, snapshot) {
          List<Widget> selectedFunctions = [];
          if (snapshot.hasData) {
            selectedFunctions = snapshot.data;
            selectedFunctions.add(buildAddButton());
          }
          return FunctionList(
            list: selectedFunctions,
          );
        },
      ),
    );
  }

  Widget buildAddButton() {
    return FunctionEntrance(
      iconName: 'images/all.png',
      iconColor: 'grey',
      title: '全部',
      url: '/list-function',
    );
  }
}
