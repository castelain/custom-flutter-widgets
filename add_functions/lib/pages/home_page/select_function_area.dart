import 'package:add_functions/database/database_helper.dart';
import 'package:add_functions/model/functionList_model.dart';
import 'package:add_functions/routers/application.dart';
import 'package:add_functions/style/global.dart';
import 'package:add_functions/widgets/function_entrance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: const EdgeInsets.all(10.0),
      color: Colors.grey[100],
      width: ScreenUtil().setWidth(750),
      height: double.infinity,
      child: Center(
        child: FutureBuilder(
          future: _getSelectedFunctionModelList(),
          builder: (context, snapshot) {
            List<Widget> selectedFunctions = [];
            if (snapshot.hasData) {
              selectedFunctions = snapshot.data;
            }
            return Column(
              children: [
                Wrap(
                  spacing: 10.0,
                  children: selectedFunctions,
                ),
                buildAddButton()
              ],
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
