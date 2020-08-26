import 'package:flutterapp/DB/base_db_provider.dart';
import 'package:flutterapp/DB/db_mgr.dart';
import 'package:sqflite/sqflite.dart';
import 'package:meta/meta.dart';

abstract class BaseDBProvider {
  bool isTableExsit = false;

  createTableSql();
  tableName();

  Future<Database> getDB() async {
    return await open();
  }

  prepare(String name, String sql) async {
    isTableExsit = await DBManager.isTableExsit(name);
    if (!isTableExsit) {
      print("***preparegetCurrentDB***");
      Database db = await DBManager.getCurrentDB();
      return await db.execute(sql);
    }
  }

  open() async {
    if (!isTableExsit) {
      return prepare(tableName(), createTableSql());
    }
    return await DBManager.getCurrentDB();
  }
}
