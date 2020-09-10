import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Components/feedback_widget.dart';
import 'package:flutterapp/Model/category_model.dart';
import 'package:flutterapp/widget/circle_text.dart';

class CategoryListItem extends StatelessWidget {
  final CategoryModel data;
  final Function(CategoryModel) onDeleteItemClick;
  final Function(CategoryModel) onEditItemClick;

  CategoryListItem(
      {@required this.data, this.onDeleteItemClick, this.onEditItemClick});

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.yellow,
      child: Container(
        child: _buildChild(context),
      ),
    );
  }

  Widget _buildChild(BuildContext context) {
    var color = Colors.yellow;
    return Column(
      children: [
        _buildTitle(color),
        const Divider(),
        Expanded(
            child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text(
                "xxx",
                style: TextStyle(color: Colors.grey, shadows: [
                  Shadow(color: color, offset: Offset(2, 2), blurRadius: .5)
                ]),
              ),
            ),
            Positioned(
                bottom: 5,
                right: 5,
                child: FeedbackWidget(
                    child: Icon(
                      Icons.edit,
                      size: 20,
                      color: color,
                    ),
                    onPressed: () {})),
          ],
        )),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "创建于20200909",
            style: const TextStyle(color: Colors.green, fontSize: 15),
          ),
        )
      ],
    );
  }

  Widget _buildTitle(Color color) {
    return Row(
      children: [
        CircleText(
          text: "010",
          size: 35,
          fontSize: 14,
          backgroundColor: color,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          "图文集",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        FeedbackWidget(
            child: const Icon(
              CupertinoIcons.delete_solid,
              color: Colors.red,
            ),
            onPressed: () {
              if (onDeleteItemClick != null) {}
            })
      ],
    );
  }
}
