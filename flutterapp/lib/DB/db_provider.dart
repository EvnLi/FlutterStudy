import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutterapp/Model/user_model.dart';

class DBProvider {
  static final DBProvider _singleton = DBProvider._internal();
  factory DBProvider() {
    return _singleton;
  }
  DBProvider._internal();
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await _initDB();
    return _db;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, "dbnm");
    return await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future _onCreate(Database db, int version) async {
    return await db.execute("CREATE TABLE User ("
        "id integer primary key AUTOINCREMENT,"
        "userName TEXT,"
        "nick TEXT"
        ")");
  }

  Future saveData(UserModel user) async {
    var _db = await db;
    return await _db.insert('User', user.toJson());
  }

  Future<List<UserModel>> findAll() async {
    var _db = await db;
    List<Map<String, dynamic>> result = await _db.query('User');

    return result.isNotEmpty
        ? result.map((e) {
            return UserModel.fromJson(e);
          }).toList()
        : [];
  }

  Future<List<UserModel>> find(int index) async {
    var _db = await db;
    List<Map<String, dynamic>> result =
        await _db.query('User', where: 'id = ?', whereArgs: [index]);

    return result.isNotEmpty
        ? result.map((e) {
            return UserModel.fromJson(e);
          }).toList()
        : [];
  }

  Future<int> delete(int id) async {
    var _db = await db;
    return await _db.delete('User', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(UserModel user) async {
    var _db = await db;
    return await _db
        .update('User', user.toJson(), where: 'id = ?', whereArgs: [user.id]);
  }

  Future<int> deleteAll() async {
    var _db = await db;
    return await _db.delete('User');
  }

  ///
  /// 更新Table
  ///
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {}
}
