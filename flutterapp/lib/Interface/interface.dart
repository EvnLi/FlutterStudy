import 'package:flutter/material.dart';

class InterfacePage extends StatefulWidget {
  @override
  _InterfacePageState createState() => _InterfacePageState();
}

class _InterfacePageState extends State<InterfacePage>
    with TickerProviderStateMixin {
  AnimationController _container;
  Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();
    _container =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _container.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _container.reset();
      } else if (status == AnimationStatus.dismissed) {}
    });
    _animation =
        Tween(begin: Offset(0, 0), end: Offset(1, 1)).animate(_container);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                _container.forward();
              },
              child: Text("变换"),
            ),
            _buildSlideTransition(),
            _wrapWidget()
          ],
        ));
  }

  Widget _buildSlideTransition() {
    return SlideTransition(
        position: _animation,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ));
  }

  Widget _wrapWidget() {
    return Wrap(
      children: [
        Row(
          children: [
            Text("变换1"),
            Text("变换2"),
            Text("变换3"),
            Text("变换4"),
            Text("变换5"),
            Text("变换6"),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
