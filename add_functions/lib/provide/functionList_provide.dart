import 'package:add_functions/database/database_helper.dart';
import 'package:add_functions/model/functionList_model.dart';
import 'package:flutter/cupertino.dart';

class FunctionListProvide with ChangeNotifier {
  List<FunctionModel> functionList = List();
  List<FunctionModel> selectedFunctionList = List();
  List<FunctionModel> unSelectFunctionList = List();

  void initData() async {
    var dbClient = DatabaseHelper();
    List<FunctionModel> result = await dbClient.getAllFunctions();
    functionList = result;
    filterFunctions(functionList);
    notifyListeners();
  }

  void filterFunctions(list) {
    functionList = list;
    //清空之前的数据
    selectedFunctionList = List();
    unSelectFunctionList = List();

    list.forEach((element) {
      if (element.isSelected == 1) {
        selectedFunctionList.add(element);
      } else {
        unSelectFunctionList.add(element);
      }
    });
    notifyListeners();
  }

  void refreshFunctionList() {
    functionList.clear();
    functionList..addAll(selectedFunctionList)..addAll(unSelectFunctionList);
    filterFunctions(functionList);
  }

  void addFunction(int id) {
    for (var i = 0; i < unSelectFunctionList.length; i++) {
      if (unSelectFunctionList[i].id == id) {
        unSelectFunctionList[i].isSelected = 1;
        break;
      }
    }
    refreshFunctionList();
    notifyListeners();
  }

  void removeFunction(int id) {
    for (var i = 0; i < selectedFunctionList.length; i++) {
      if (selectedFunctionList[i].id == id) {
        selectedFunctionList[i].isSelected = 0;
        break;
      }
    }
    refreshFunctionList();
    notifyListeners();
  }

  void commitSelectedFunctions() async {
    var dbClient = DatabaseHelper();
    unSelectFunctionList.forEach((item) async {
      await dbClient.updateFunctionModel(item.id, 0);
    });
    selectedFunctionList.forEach((item) async {
      await dbClient.updateFunctionModel(item.id, 1);
    });
    initData();
  }
}
