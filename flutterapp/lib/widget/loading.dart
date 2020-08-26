import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool isCover;

  const Loading({Key key, this.isLoading, this.isCover, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isCover
        ? !isLoading ? child : _loadingView
        : Stack(
            children: <Widget>[child, isLoading ? _loadingView : null],
          );
  }

  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
