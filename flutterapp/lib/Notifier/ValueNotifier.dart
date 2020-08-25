import 'dart:math';
import 'package:flutter/material.dart';

class ValueNotifierWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> valueNoti = ValueNotifier<String>('Init String Data');
    return Container(
        color: Colors.yellow,
        child: NOtifierWidget(
          data: valueNoti,
        ));
    return Column(
      children: [
        NOtifierWidget(
          data: valueNoti,
        ),
        // RaisedButton(
        //   onPressed: () =>
        //       valueNoti.value = 'New Value ${Random().nextInt(100)}',
        //   child: Text('Change'),
        // ),
      ],
    );
  }
}

class NOtifierWidget extends StatefulWidget {
  final ValueNotifier<String> data;
  NOtifierWidget({this.data});
  @override
  _NOtifierWidgetState createState() => _NOtifierWidgetState();
}

class _NOtifierWidgetState extends State<NOtifierWidget> {
  String info;
  @override
  void initState() {
    super.initState();
    widget.data.addListener(changeNOtifier);
  }

  void changeNOtifier() {
    print('${widget.data.value} 修改value');
    setState(() => info = '${widget.data.value}');
  }

  @override
  Widget build(BuildContext context) {
    print("gggggg");
    print(info);
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
    widget.data.removeListener(changeNOtifier);
    super.dispose();
  }
}
