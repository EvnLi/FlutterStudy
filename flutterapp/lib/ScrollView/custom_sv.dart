import 'dart:math';
import 'package:flutter/material.dart';

class CustomSV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> valueNoti = ValueNotifier<String>('Init String Data');
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            height: 100,
            color: Colors.black,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((content, index) {
            return Container(
              height: 65,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }, childCount: 50),
        )
      ],
    );
  }
}
