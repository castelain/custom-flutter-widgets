import 'package:add_functions/database/database_helper.dart';
import 'package:add_functions/model/functionList_model.dart';
import 'package:add_functions/provide/functionList_provide.dart';
import 'package:add_functions/routers/application.dart';
import 'package:add_functions/style/global.dart';
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
  List<FunctionModel> allFunctionModels = List();

  @override
  void initState() {
    super.initState();
  }

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
          Provide.value<FunctionListProvide>(context)
              .filterFunctions(allFunctionModels);
          Application.router.navigateTo(context, '/select-function');
        },
      );

  Future<List<FunctionEntrance>> _getSelectedFunctionModelList() async {
    var dbClient = DatabaseHelper();
    List<FunctionModel> list = await dbClient.getSelectedFunctions();
    List<FunctionEntrance> selectedList = [];
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

  Future<List<FunctionEntrance>> _getAlldFunctionModelList() async {
    var dbClient = DatabaseHelper();
    List<FunctionModel> list = await dbClient.getAllFunctions();
    allFunctionModels = list;
    print('list: $list');
    List<FunctionEntrance> allList = [];
    list.forEach((item) {
      allList.add(FunctionEntrance(
        id: item.id,
        iconName: item.iconName,
        iconColor: item.iconColor,
        title: item.title,
        url: item.url,
      ));
    });
    return allList;
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Application.router.navigateTo(context, '/'),
        ),
        title: Text('全部功能'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Title,
            FutureBuilder(
                future: _getSelectedFunctionModelList(),
                builder: (context, scope) {
                  List<FunctionEntrance> selectedFunctions = List();
                  if (scope.hasData) {
                    selectedFunctions = scope.data;
                  }
                  return Expanded(
                    child: GridView.count(
                      crossAxisCount: 5,
                      physics: NeverScrollableScrollPhysics(),
                      children: selectedFunctions,
                    ),
                  );
                }),
            buildAddButton(context),
            Text('全部功能'),
            FutureBuilder(
                future: _getAlldFunctionModelList(),
                builder: (context, scope) {
                  List<FunctionEntrance> allFunctions = List();
                  if (scope.hasData) {
                    allFunctions = scope.data;
                  }
                  return Expanded(
                    child: GridView.count(
                      crossAxisCount: 5,
                      physics: NeverScrollableScrollPhysics(),
                      children: allFunctions,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
