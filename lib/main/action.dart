import 'package:fish_redux/fish_redux.dart';
import 'package:fr_test/main/state.dart';

//TODO replace with your own action
enum MainAction {
  onChangePageListAction,
  onChangePageAction,
  onChangeRecordTimeAction,
  initData,
}

class MainActionCreator {
  static Action initData(int index) {
    return const Action(MainAction.initData);
  }
  static Action onChangePageListAction(Map<String, dynamic> initInfo) {
    return Action(MainAction.onChangePageListAction, payload: initInfo);
  }

  static Action onChangePageAction(int page) {
    return Action(MainAction.onChangePageAction,
      payload: page);
  }

  static Action onChangeRecordTimeAction(RecordTime time) {
    return Action(MainAction.onChangeRecordTimeAction,
      payload: time);
  }
}
