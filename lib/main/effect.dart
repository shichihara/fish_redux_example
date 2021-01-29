import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fr_test/main.dart';
import 'package:fr_test/main/tabItem_component/state.dart';
import 'action.dart';
import 'state.dart';

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    Lifecycle.initState: init,
    MainAction.initData: _onInitData,
    MainAction.onChangePageAction: _onChangePage,
  });
}

void init(Action action, Context<MainState> ctx) {
  List<TabItemState> tabList = [
    TabItemState(
      pageId: 0,
      text: "video",
      isEnable: true,
      callback: () {
        ctx.dispatch(MainActionCreator.onChangePageAction(0));
      },
    ),
    TabItemState(
      pageId: 1,
      text: "audio",
      isEnable: false,
      callback: (){
        ctx.dispatch(MainActionCreator.onChangePageAction(1));
      }
    ),
    TabItemState(
      pageId: 2,
      text: "settings",
      isEnable: false,
      callback: (){
        ctx.dispatch(MainActionCreator.onChangePageAction(2));
      }
    ),
  ];

  List<Widget> pageList = [
    RouteConfig.routes.buildPage(RouteConfig.videoPage, null),
    RouteConfig.routes.buildPage(RouteConfig.audioPage, null),
    RouteConfig.routes.buildPage(RouteConfig.settingsPage, null),
  ];

  var _controller = PageController();
  _controller.addListener(() {
    println(_controller.page);
  });

  ctx.dispatch(MainActionCreator.onChangePageListAction({
    'tab': tabList,
    'page': pageList,
    'control': _controller,
    'initIndex': 0
  }));


  //init recordTime
  RecordTime recordTime = RecordTime(hour: '00',minute: '00', second: '00');
  ctx.dispatch(MainActionCreator.onChangeRecordTimeAction(recordTime));

}

void _onInitData(Action action, Context<MainState> ctx) {
}

void _onChangePage(Action action, Context<MainState> ctx) {
  ctx.state.pageController.jumpToPage(action.payload);
}
