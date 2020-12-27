import 'dart:async';

import 'package:add_functions/model/functionList_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database _db;

  DatabaseHelper.internal();

  // 定义表格字段名
  final String id = 'id';
  final String iconName = 'iconName';
  final String iconColor = 'iconColor';
  final String title = 'title';
  final String url = 'url';
  final String isSelected = 'isSelected';

  final String dbName = 'functionDb';
  final int dbVersion = 1;
  final String tableName = 'functionTable';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  // 建立数据库连接，并创建表
  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: _onCreate);
  }

  // 创建表
  _onCreate(Database db, int newVersion) async {
    await db.execute(
        'create table $tableName($id integer primary key,$iconName text,$iconColor text,$title text,$url text,$isSelected integer)');
  }

  Future<int> addFunctionModel(FunctionModel functionModel) async {
    Database dbClient = await db;
    var result = dbClient.insert(tableName, functionModel.toJson());
    return result;
  }

  Future<List<FunctionModel>> getAllFunctions() async {
    Database dbClient = await db;
    var result = await dbClient.query(tableName, orderBy: '$id');
    var list = result.toList();
    List<FunctionModel> functionModelList = List();
    list.forEach((item) {
      functionModelList.add(FunctionModel.fromJson(item));
    });
    return functionModelList;
  }

  Future<List<FunctionModel>> getSelectedFunctions() async {
    Database dbClient = await db;
    var result = await dbClient.query(tableName,
        where: '$isSelected = ?', whereArgs: [1], orderBy: '$id');
    var list = result.toList();
    List<FunctionModel> functionModelList = List();
    list.forEach((item) {
      functionModelList.add(FunctionModel.fromJson(item));
    });
    return functionModelList;
  }

  Future<int> updateFunctionModel(int updateId, int isSelected) async {
    Database dbClient = await db;
    var result = await dbClient.update(tableName, {'isSelected': isSelected},
        where: '$id = ?', whereArgs: [updateId]);
    return result;
  }

  Future<int> removeFunctionModel(int removeId) async {
    Database dbClient = await db;
    var result = await dbClient
        .delete(tableName, where: '$id = ?', whereArgs: [removeId]);
    return result;
  }

  Future<int> removeAllFunctionModels() async {
    Database dbClient = await db;
    var result = await dbClient.delete(tableName);
    return result;
  }

  Future close() async {
    Database dbClient = await db;
    dbClient.close();
  }
}
