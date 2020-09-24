import 'package:flutter/material.dart';
import 'package:flutterapp/Model/user_model.dart';
import 'package:flutterapp/DB/db_provider.dart';
import 'package:flutterapp/DB/add_user.dart';

class DBList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DBListState();
  }
}

class _DBListState extends State<DBList> {
  List<UserModel> _list = [];
  @override
  void initState() {
    super.initState();
    _loadData(-1);
  }

  _loadData(int index) async {
    if (index == -1) {
      _list = await DBProvider().findAll();
    } else {
      _list = await DBProvider().find(index);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqlite list data"),
      ),
      body: Builder(builder: (context) {
        return Column(
          children: [
            Row(
              children: [
                RaisedButton(
                  onPressed: () {
                    _loadData(-1);
                  },
                  child: Text("查询数据"),
                ),
                RaisedButton(
                  onPressed: () {
                    _loadData(0);
                  },
                  child: Text("通过ID查询数据"),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "addUser", arguments: -1);
                  },
                  child: Text("添加数据"),
                ),
              ],
            ),
            Row(
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "addUser", arguments: 0);
                  },
                  child: Text("更新数据"),
                ),
                RaisedButton(
                  onPressed: () async {
                    int result = await DBProvider().deleteAll();
                    print("****deleteResult=$result");
                    if (result > 0) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('删除数据成功，result:$result'),
                      ));
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('删除数据失败，result:$result'),
                      ));
                    }
                  },
                  child: Text("删除数据"),
                ),
              ],
            ),
            Table(
              children: [
                TableRow(children: [
                  TableCell(child: Text('id')),
                  TableCell(child: Text('姓名')),
                  TableCell(child: Text('昵称')),
                ]),
                ..._list.map((user) {
                  return TableRow(children: [
                    TableCell(child: Text("${user.id}")),
                    TableCell(child: Text("${user.userName}")),
                    TableCell(child: Text("${user.nick}")),
                  ]);
                })
              ],
            )
          ],
        );
      }),
    );
  }
}
