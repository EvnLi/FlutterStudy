import 'package:flutter/material.dart';

class SlideTransitionPage extends StatefulWidget {
  @override
  _SlideTransitionPageState createState() => _SlideTransitionPageState();
}

class _SlideTransitionPageState extends State<SlideTransitionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text(
        '123456',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
