import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBManager {
  static const _version = 1;
  static const _dbName = 'fa.db';
  static Database _db;

  static init() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, _dbName);
    print(path);
    _db = await openDatabase(path, version: _version);
    print("***initwwww***");
    if (_db != null) {
      print("***init***");
    }
  }

  static Future<bool> isTableExsit(String tableName) async {
    print("***isTableExsitgetCurrentDB***");
    await getCurrentDB();
    print("***isTableExsitgetCurrentDB1111***");
    String sql =
        "select * from Sqlite_master where type = 'table' and name = '$tableName'";
    print("****isTableExsit****");
    var result = await _db.rawQuery(sql);
    print(result);
    if (result != null && result.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  static Future<Database> getCurrentDB() async {
    print("***getCurrentDB****");
    print(_db);
    if (_db == null) {
      await init();
    }
    return _db;
  }

  static close() {
    _db?.close();
    _db = null;
  }
}
