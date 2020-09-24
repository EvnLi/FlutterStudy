import 'package:flutter/material.dart';

class TestWidget extends Widget {
  @override
  Element createElement() {
    // TODO: implement createElement
    return testElement(this);
  }

  Widget build(BuildContext context) {
    print("验证");
    return Text("Element");
  }
}

class testElement extends Element {
  Element _child;
  testElement(Widget widget) : super(widget);
  @override
  // TODO: implement debugDoingBuild
  bool get debugDoingBuild => throw UnimplementedError();

  @override
  void performRebuild() {
    ///调用build函数
    var _build = build();

    ///更新子视图
    _child = updateChild(_child, _build, slot);
  }

  @override
  void update(Widget newWidget) {
    super.update(newWidget);
    print("TestWidget update");

    ///更新
    performRebuild();
  }

  ///将widget强转成TestWidget
  @override
  TestWidget get widget => super.widget as TestWidget;

  /// 调用TestWidget的build函数
  Widget build() => widget.build(this);
}
