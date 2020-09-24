import 'package:flutter/material.dart';
import 'package:flutterapp/TestWidget/test_widget.dart';

class TestWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestWidgetPageState();
  }
}

class _TestWidgetPageState extends State<TestWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试验证"),
      ),
      body: Center(
        child: TestWidget(),
      ),
    );
  }
}
