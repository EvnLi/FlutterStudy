import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapp/stream/loading.dart';
import 'package:flutterapp/stream/global_state.dart';
import 'package:flutterapp/stream/error.dart';

// 生成具体的Widget
// typedef
typedef GlobalContentBuilder<T> = Widget Function(BuildContext buildContext, T t);

// 返回各种状态下的Widget
// T是当前生成页面Widget的数据
class MultiState<T> extends StatefulWidget {

  Widget loading = LoadingPage();
  Widget error = ErrorPage();

  GlobalContentBuilder contentBuilder;
  StreamController<GlobalState> streamController;
  // 接收传来的stream控制器、builder构造器
  MultiState({this.streamController, this.contentBuilder, this.loading, this.error});

  @override
  _MultiStateState<T> createState() => _MultiStateState<T>();
}

class _MultiStateState<T> extends State<MultiState> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<GlobalState>(
        stream: widget.streamController.stream,
        builder: (context, snap){
          Widget result;
            if(snap.data != null){
              if(snap.data is GlobalLoadingState){
                result = LoadingPage();
              }else if(snap.data is GlobalErrorState){
                result = ErrorPage();
              }else if(snap.data is GlobalContentState){
                
                result = widget.contentBuilder(context, (snap.data as GlobalContentState).t);
              }
            }
            // 这里必须返回一个空容器的，否则会报错
            if(result == null){
              result = Container();
            }
            
            return result;
        },
      ),
    );
  }
}

