import 'package:flutter/material.dart';
import 'package:flutterapp/Raised_Button/raised_button.dart';
import 'package:flutterapp/widget/raised_button.dart';

class RaisedButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 50, left: 30),
            child: Column(
              children: [
                RaisedButtonWidget(
                  text: "菱角",
                  textColor: Colors.red,
                  onPressedClick: this.onClick(),
                  radius: 5,
                  borderColor: Colors.yellow,
                ),
                RaisedButtonWidget(
                  text: "菱形",
                  textColor: Colors.yellow,
                  onPressedClick: this.onClick(),
                  radius: 100,
                  borderColor: Colors.green,
                ),
                RaisedButtonWidget(
                  text: "矩形",
                  textColor: Colors.yellow,
                  onPressedClick: this.onClick(),
                  radius: 0,
                  borderColor: Colors.green,
                ),
                RaisedButtonWidget(
                  text: "圆角",
                  onPressedClick: this.onClick(),
                  borderColor: Colors.green,
                  borderWidth: 1,
                  style: RaisedButtonStyle.Circle,
                ),
                _ClipRectWidget()
              ],
            )));
  }

  //图片裁剪
  Widget _ClipRectWidget() {
    return ClipRect(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 40,
          width: 40,
          child: Image.asset(
            "assets/images/caver.webp",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  onClick() {}
}
