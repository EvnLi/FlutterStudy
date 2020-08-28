import 'package:flutter/material.dart';

class FilmPage extends StatefulWidget {
  final data;

  const FilmPage({Key key, this.data}) : super(key: key);
  @override
  _FilmPageState createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  @override
  void initState() {
    super.initState();
    print('${widget.data}');
  }

  @override
  Widget build(BuildContext context) {
    print('build = ${widget.data[0]}');
    return Scaffold(
        // appBar: AppBar(title: Text('豆瓣电影'),),
        body: Container(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            widget.data != null ? Text(widget.data[0]["desc"]) : Text("出错了"),
            widget.data != null
                ? Text(widget.data[0]["id"].toString())
                : Text("内容为空")
          ],
        ),
      ),
    ));
  }
}
