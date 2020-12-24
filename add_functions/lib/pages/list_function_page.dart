import 'package:add_functions/database/database_helper.dart';
import 'package:add_functions/model/functionList_model.dart';
import 'package:add_functions/routers/application.dart';
import 'package:add_functions/style/global.dart';
import 'package:add_functions/widgets/function_entrance.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  List<Widget> selectedFunctions = List();
  List<Widget> selectedList = List();

  Future<void> _getSelectedFunctionModelList() async {
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
    setState(() {
      selectedFunctions = selectedList;
    });
  }

  List<Widget> allFunctions = List();
  List<Widget> allList = List();

  Future<void> _getAlldFunctionModelList() async {
    var dbClient = DatabaseHelper();
    List<FunctionModel> list = await dbClient.getAllFunctions();
    print('list: $list');
    allList = [];
    list.forEach((item) {
      allList.add(FunctionEntrance(
        id: item.id,
        iconName: item.iconName,
        iconColor: item.iconColor,
        title: item.title,
        url: item.url,
      ));
    });
    setState(() {
      allFunctions = allList;
    });
  }

  @override
  build(BuildContext context) {
    _getSelectedFunctionModelList()
        .then((res) => {print('selectedList: $selectedList')});

    _getAlldFunctionModelList().then((res) => {print('allList: $allList')});

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
            Expanded(
              child: GridView.count(
                crossAxisCount: 5,
                physics: NeverScrollableScrollPhysics(),
                children: selectedFunctions,
              ),
            ),
            buildAddButton(context),
            Text('全部功能'),
            Expanded(
              child: GridView.count(
                crossAxisCount: 5,
                physics: NeverScrollableScrollPhysics(),
                children: allFunctions,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
