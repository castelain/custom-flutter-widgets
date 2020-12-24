import 'package:add_functions/model/functionList_model.dart';
import 'package:flutter/cupertino.dart';

class FunctionListProvide with ChangeNotifier {
  List<FunctionModel> functionList = List();
  List<FunctionModel> selectedFunctionList = List();
  List<FunctionModel> unSelectFunctionList = List();

  void filterFunctions(list) {
    functionList = list;
    //清空之前的数据
    selectedFunctionList = List();
    unSelectFunctionList = List();

    list.forEach((element) {
      if (element.isSelected) {
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
        unSelectFunctionList[i].isSelected = true;
        break;
      }
    }
    refreshFunctionList();
    notifyListeners();
  }

  void removeFunction(int id) {
    for (var i = 0; i < selectedFunctionList.length; i++) {
      if (selectedFunctionList[i].id == id) {
        selectedFunctionList[i].isSelected = false;
        break;
      }
    }
    refreshFunctionList();
    notifyListeners();
  }

  void commitSelectedFunctions() async {}
}
