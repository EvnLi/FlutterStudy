import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutterapp/stream/state_manage.dart';
import 'package:flutterapp/stream/multiple_state.dart';
import 'package:flutterapp/stream/film.dart';

class StreamBuilderPage extends StatefulWidget {
  @override
  _StreamBuilderPageState createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  StateManage stateManage;

  Future _loadData(bool needException) async {
    Response response =
        await Dio().get('https://novel.dkvirus.top/api/v3/gysw/novel/classify');

    // 按需设置返回异常
    if (needException) {
      return Future.error('请求错误');
    }

    if (response.statusCode == 200) {
      return response.data["data"];
    } else {
      return Future.error('请求错误');
    }
  }

  @override
  void initState() {
    stateManage = StateManage();
    super.initState();
    _loadNetData();
  }

  @override
  void dispose() {
    stateManage.dispose();
    super.dispose();
  }

  void _loadNetData() {
    stateManage.loading();

    _loadData(false).then((val) {
      stateManage.content(val);
    }).catchError((err) {
      stateManage.error();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('封装StreamBuilder'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: _loadNetData,
      ),
      body: MultiState(
        streamController: stateManage.streamController,
        contentBuilder: (context, data) {
          return FilmPage(data: data);
        },
      ),
    );
  }
}
