import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Loading...",
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}
