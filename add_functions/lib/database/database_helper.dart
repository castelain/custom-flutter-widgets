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

  final String dbName = 'functionDb';
  final int dbVersion = 1;

  initDb() async {
    String databasePath = await getDatabasesPath();
    // String path = join(databasePath, dbName);
    // return await openDatabase(path, version: dbVersion, onCreate: _onCreate());
  }

  _onCreate() {}
}
