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
    _loadData();
  }

  _loadData() async {
    _list = await DBProvider().findAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqlite list data"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              RaisedButton(
                onPressed: () {
                  _loadData();
                },
                child: Text("查询数据"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return AddUser();
                  }));
                },
                child: Text("添加数据"),
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
      ),
    );
  }
}
