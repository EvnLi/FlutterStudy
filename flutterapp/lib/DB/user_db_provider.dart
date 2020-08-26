import 'package:flutter/widgets.dart';
import 'package:flutterapp/Model/user_model.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:flutterapp/DB/base_db_provider.dart';

class UserDBProvider extends BaseDBProvider {
  final String name = 'sqlite_table';
  final String cId = 'id';
  final String cUserName = 'userName';
  final String cNick = 'nick';

  UserDBProvider();

  @override
  tableName() {
    return name;
  }

  @override
  createTableSql() {
    return '''
        create table $name (
        $cId integer primary key,$cUserName text not null,
        $cNick text not null)
      ''';
  }

  Future<List<Map<String, dynamic>>> _queryDB(Database db, int id) async {
    List<Map<String, dynamic>> maps =
        await db.rawQuery("select * from $name where $cId = $id");
    return maps;
  }

  ///插入到数据库
  Future insert(UserModel model) async {
    print("*******44444*****");
    Database db = await getDB();
    print("*******555555*****");
    var userProvider = await _queryDB(db, model.id);
    if (userProvider != null) {
      ///删除数据
      await db.delete(name, where: "$cId = ?", whereArgs: [model.id]);
    }
    print("*******666666*****");
    int index = await db.rawInsert(
        "insert into $name ($cId,$cUserName,$cNick) values (?,?,?)",
        [model.id, model.userName, model.nick]);
    print(index);
    return index;
  }

  ///更新数据库
  Future<void> update(UserModel model) async {
    Database database = await getDB();
    await database.rawUpdate(
        "update $name set $cUserName = ?,$cNick = ? where $cId= ?",
        [model.userName, model.nick, model.id]);
  }

  ///获取事件数据
  Future<UserModel> getUserInfo(int id) async {
    Database db = await getDB();
    print("***getUserInfo***");
    List<Map<String, dynamic>> maps = await _queryDB(db, id);
    if (maps.length > 0) {
      return UserModel.fromJson(maps[0]);
    }
    return null;
  }
}
