import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: Text(
          "报错啦",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
