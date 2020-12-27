import 'package:add_functions/provide/functionList_provide.dart';
import 'package:add_functions/routers/application.dart';
import 'package:add_functions/style/global.dart';
import 'package:add_functions/widgets/function_list.dart';
import 'package:add_functions/widgets/function_selected.dart';
import 'package:add_functions/widgets/function_title.dart';
import 'package:add_functions/widgets/function_to_be_select.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class SelectFunctionPage extends StatefulWidget {
  @override
  _SelectFunctionPageState createState() => _SelectFunctionPageState();
}

void _notSave(BuildContext context) {
  Provide.value<FunctionListProvide>(context).initData();
  Application.router.navigateTo(context, '/list-function');
}

void _save(BuildContext context) {
  Provide.value<FunctionListProvide>(context).commitSelectedFunctions();
  Application.router.navigateTo(context, '/list-function');
}

class _SelectFunctionPageState extends State<SelectFunctionPage> {
  // ignore: non_constant_identifier_names
  Widget Title = Container(
    color: FunctionSelectionStyle.contentBgColor,
    padding: FunctionSelectionStyle.titleMargin,
    child: Center(
      child: Column(
        children: [
          Text(
            '你可以将常用的功能添加到系统首页，',
          ),
          Text('下面是首页已添加的功能')
        ],
      ),
    ),
  );

  Future<void> _showConfirmSaveDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Center(
              child: Text('是否保存已编辑的内容'),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('取消'),
              onPressed: () {
                _notSave(context);
              },
            ),
            TextButton(
              child: Text(
                '保存',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              onPressed: () {
                _save(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleGestureDetector(
      onHorizontalSwipe: (SwipeDirection direction) {
        bool needSave = Provide.value<FunctionListProvide>(context).isDirty;
        if (needSave) {
          _showConfirmSaveDialog(context);
        } else {
          Application.router.navigateTo(context, '/list-function');
        }
      },
      child: Scaffold(
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
              _notSave(context);
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
                _save(context);
              },
            ),
          ],
        ),
        body: Container(
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
                return FunctionList(
                  list: selectedFunctions,
                );
              }),
              Container(
                margin: FunctionSelectionStyle.titleMargin,
                child: FunctionTitle(text: '其它功能'),
              ),
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
                return Container(
                  child: FunctionList(
                    list: unSelectedFunctions,
                  ),
                );
              }),
            ],
          ),
        ),
        backgroundColor: FunctionSelectionStyle.backgroundColor,
      ),
    );
  }
}
