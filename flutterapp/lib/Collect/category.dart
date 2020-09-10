import 'package:flutter/material.dart';
import 'package:flutterapp/Model/category_model.dart';
import 'package:flutterapp/Items/category_list_item.dart';
import 'package:flutterapp/widget/circle.dart';

class CategoryPage extends StatelessWidget {
  List dataList;
  final gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: 0.8,
  );

  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // SliverOverlapInjector(
        //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        // ),
        _buildContent(context)
      ],
    );
  }

  _buildContent(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 40),
      sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
              (_, index) => Container(
                    child: GestureDetector(
                        onTap: () {},
                        child: CategoryListItem(
                          data: null,
                          onDeleteItemClick: (model) =>
                              _deleteCollect(context, model),
                          onEditItemClick: (model) =>
                              _editCollect(context, model),
                        )),
                  ),
              childCount: 11),
          gridDelegate: gridDelegate),
    );
  }

  _deleteCollect(BuildContext context, CategoryModel model) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(width: 50, child: Container()),
      ),
    );
  }

  _editCollect(BuildContext context, CategoryModel model) {
    showDialog(
        context: context,
        builder: (ctx) => Dialog(
              backgroundColor: Color(0xFFF2F2F2),
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: Circle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        '修改收藏集',
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      CloseButton()
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0), child: Container()),
                ],
              ),
            ));
  }

  _toDetailPage(BuildContext context, CategoryModel model) {}
}
