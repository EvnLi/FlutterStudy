import 'package:flutter/material.dart';

enum RaisedButtonStyle {
  Beveled, //菱角
  Diamond, //菱形
  Rect, //矩形,
  Border, //边框
  Circle, //圆角
}

class RaisedButtonWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final Function() onPressedClick;
  final Color borderColor;
  final double radius;
  final Color bgColor;
  final RaisedButtonStyle style;
  final double borderWidth;

  RaisedButtonWidget(
      {@required this.text,
      this.textColor = Colors.black,
      @required this.onPressedClick,
      this.borderColor,
      this.radius,
      this.bgColor = Colors.white,
      this.style = RaisedButtonStyle.Beveled,
      this.borderWidth = 1.0});
  @override
  Widget build(BuildContext context) {
    switch (this.style) {
      case RaisedButtonStyle.Diamond:
        return _BeveledWidget();
        break;
      case RaisedButtonStyle.Rect:
        return _BeveledWidget();
        break;
      case RaisedButtonStyle.Border:
        return _BorderWidget();
        break;
      case RaisedButtonStyle.Circle:
        return _CircleWidget();
        break;
      default:
        return _BeveledWidget();
    }
  }

  //菱角、菱形、矩形
  Widget _BeveledWidget() {
    return RaisedButton(
        shape: BeveledRectangleBorder(
            side: BorderSide(width: 1, color: this.borderColor),
            borderRadius: BorderRadius.circular(this.radius)),
        onPressed: () {
          if (this.onPressedClick != null) {
            this.onPressedClick();
          }
        },
        color: this.bgColor,
        child: Text(
          this.text,
          style: TextStyle(color: this.textColor),
        ));
  }

  //边框
  Widget _BorderWidget() {
    return RaisedButton(
        shape: Border(
            top: BorderSide(width: this.borderWidth, color: this.borderColor),
            bottom:
                BorderSide(width: this.borderWidth, color: this.borderColor)),
        onPressed: () {
          if (this.onPressedClick != null) {
            this.onPressedClick();
          }
        },
        color: this.bgColor,
        child: Text(
          this.text,
          style: TextStyle(color: this.textColor),
        ));
  }

  //圆角边框
  Widget _CircleWidget() {
    return RaisedButton(
      onPressed: () {
        if (this.onPressedClick != null) {
          this.onPressedClick();
        }
      },
      color: this.bgColor,
      shape: CircleBorder(
          side: BorderSide(color: this.borderColor, width: this.borderWidth)),
    );
  }
}
