import 'package:flutter/material.dart';
import 'package:flutterapp/Model/user_model.dart';
import 'package:flutterapp/DB/db_provider.dart';

class AddUser extends StatefulWidget {
  int id = -1;
  AddUser({this.id});
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController _nameController;
  TextEditingController _nickController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nickController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("存储数据"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("姓名："),
              Flexible(
                  child: TextField(
                controller: _nameController,
              )),
            ],
          ),
          Row(
            children: [
              Text("昵称："),
              Flexible(
                  child: TextField(
                controller: _nickController,
              )),
            ],
          ),
          Builder(
            builder: (context) {
              return RaisedButton(
                child: Text('保存'),
                onPressed: () async {
                  var user = UserModel(
                      userName: '${_nameController.text}',
                      nick: '${_nickController.text}');

                  int result = 0;
                  print(widget.id);
                  if (widget.id == -1) {
                    print("**保存数据**");
                    result = await DBProvider().saveData(user);
                  } else {
                    print("**更新数据**");
                    user.id = widget.id;
                    result = await DBProvider().update(user);
                  }
                  if (result > 0) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('保存数据成功，result:$result'),
                    ));
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('保存数据失败，result:$result'),
                    ));
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
