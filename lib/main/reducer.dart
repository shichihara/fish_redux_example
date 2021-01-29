import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MainState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainState>>{
      MainAction.onChangePageListAction: _onChangePageList,
      MainAction.onChangePageAction: _onChangePage,
      MainAction.onChangeRecordTimeAction: _onChangeRecordTime,
    },
  );
}
MainState _onChangePageList(MainState state, Action action) {
  final MainState newState = state.clone();
  Map<String, dynamic> info = action.payload;
  newState.tabList = info['tab'];
  newState.pageList = info['page'];
  newState.pageController = info['control'];
  newState.currentPage = info['initIndex'];
  return newState;
}

MainState _onChangePage(MainState state, Action action) {
  final MainState newState = state.clone();
  newState.currentPage = action.payload;
  return newState;
}

MainState _onChangeRecordTime(MainState state, Action action) {
  final MainState newState = state.clone();
  RecordTime time = action.payload;
  newState.recordTime = time;
  return newState;
}
