import 'dart:async';
import 'package:flutterapp/stream/global_state.dart';



// Stream的控制类
class StateManage{
 StreamController<GlobalState> streamController;

 StateManage(){
   streamController = StreamController();
 }

  // 销毁
  void dispose(){
    if(streamController!=null){
      streamController.close();
    }
  }

  // loading状态时
  void loading(){
    streamController.sink.add(GlobalLoadingState());
  }


  void error(){
    streamController.sink.add(GlobalErrorState());
  }

  void content<T>(T t){
    streamController.sink.add(GlobalContentState(t));
  }

}

