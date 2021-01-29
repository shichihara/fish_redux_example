import 'package:fish_redux/fish_redux.dart';

class TabItemState implements Cloneable<TabItemState> {
  int pageId;
  String text;
  bool isEnable;
  Function callback;

  TabItemState({
    this.pageId,
    this.text,
    this.isEnable,
    this.callback,
  });

  @override
  TabItemState clone() {
    return TabItemState()
      ..pageId = pageId
      ..text = text
      ..isEnable = isEnable
      ..callback;
  }
}

TabItemState initState(Map<String, dynamic> args) {
  return TabItemState();
}
