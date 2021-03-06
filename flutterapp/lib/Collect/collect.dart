import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Components/feedback_widget.dart';
import 'package:flutterapp/Components/circle_image_widget.dart';
import 'package:flutterapp/Collect/category.dart';
import 'package:flutterapp/Collect/default.dart';
import 'package:flutterapp/util/constant.dart';

class CollectPage extends StatefulWidget {
  @override
  _CollectPageState createState() => _CollectPageState();
}

class _CollectPageState extends State<CollectPage>
    with AutomaticKeepAliveClientMixin {
  final _tabs = ["收藏集录", "默认收藏"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: _tabs.length,
          child: TabBarView(
            children: [CategoryPage(), DefaultCollectPage()],
          )
          // child: NestedScrollView(
          //     headerSliverBuilder:
          //         (BuildContext context, bool innerBoxIsScrolled) {
          //       return [
          //         SliverOverlapAbsorber(
          //           handle:
          //               NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          //           sliver: _buildAppBar(context, innerBoxIsScrolled),
          //         )
          //       ];
          //     },
          //     body: TabBarView(
          //       children: [CategoryPage(), DefaultCollectPage()],
          //     )),
          ),
    );
  }

  Widget _buildAppBar(BuildContext context, bool index) {
    return SliverAppBar(
      leading: Container(
          margin: EdgeInsets.all(10),
          child: FeedbackWidget(
            onPressed: () {
              // Navigator.of(context).pushNamed(UnitRouter.login);
            },
            child: CircleImage(
              image: AssetImage('assets/images/icon_head.webp'),
              borderSize: 1.5,
            ),
          )),
      actions: <Widget>[_buildAddActionBuilder(context)],
      title: Text(
        '收藏集 CollectUnit',
        style: TextStyle(
            color: Colors.white, //标题
            fontSize: 18,
            shadows: [
              Shadow(color: Colors.blue, offset: Offset(1, 1), blurRadius: 2)
            ]),
      ),
      pinned: true,
      expandedHeight: 150.0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax, //视差效果
        background: Image.asset(
          Images.collect,
          fit: BoxFit.cover,
        ),
      ),
      forceElevated: index,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: TabBar(
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.white,
          labelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 16, shadows: [
            Shadow(
                color: Theme.of(context).primaryColor,
                offset: Offset(1, 1),
                blurRadius: 10)
          ]),
          tabs: _tabs
              .map((String name) => Container(
                  margin: EdgeInsets.only(bottom: 5),
                  alignment: Alignment.center,
                  child: Text(name)))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildAddActionBuilder(BuildContext context) => IconButton(
      icon: Icon(
        Icons.add,
        size: 30,
      ),
      onPressed: () => Scaffold.of(context).openEndDrawer());

  @override
  bool get wantKeepAlive => true;
}
