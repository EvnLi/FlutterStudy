import 'package:flutter/material.dart';

class SafeAreaPage extends StatefulWidget {
  @override
  _SafeAreaState createState() => _SafeAreaState();
}

class _SafeAreaState extends State<SafeAreaPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.white,
        child: ListView(
          children: List.generate(100, (i) => Text('老孟，一个有态度的程序员')),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
