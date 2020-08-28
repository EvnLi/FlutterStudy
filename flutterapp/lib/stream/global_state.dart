class GlobalState{}

class GlobalLoadingState extends GlobalState{}

class GlobalErrorState extends GlobalState{}

class GlobalHideDialogState extends GlobalState{}

// 为了全局APP都能使用这个状态，所以传入一个泛型，这样任何类型数据进来，都能接收
class GlobalContentState<T> extends GlobalState{
  T t;
  GlobalContentState(this.t);
}

