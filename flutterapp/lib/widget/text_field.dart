import 'package:flutter/material.dart';

class TVDemoPage extends StatefulWidget {
  @override
  _TVDemoPageState createState() => _TVDemoPageState();
}

class _TVDemoPageState extends State<TVDemoPage> {
  TextEditingController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController();
    _ctrl.addListener(() {
      // _ctrl.text = _ctrl.text.toUpperCase();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _ctrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('封装StreamBuilder'),
        ),
        body: Container(
            child: TextField(
          controller: _ctrl,
          textCapitalization: TextCapitalization.sentences,
          textAlignVertical: TextAlignVertical.center,
          textDirection: TextDirection.ltr,
          toolbarOptions: ToolbarOptions(
              copy: true, cut: true, paste: true, selectAll: false),
          showCursor: true,
          cursorColor: Colors.yellow,
          cursorRadius: Radius.circular(8),
          decoration: InputDecoration(
              icon: Icon(Icons.person),
              helperText: "长度6-8位",
              helperStyle: TextStyle(color: Colors.red),
              hintText: "请输入名称",
              hintStyle: TextStyle(color: Colors.grey),
              counterText: "1/150"),
        )));
  }
}
