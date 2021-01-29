import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fr_test/main/page.dart';
import 'package:fr_test/main/tabItem_component/state.dart';
import 'package:fr_test/store/state.dart';

import 'package:fr_test/video/page.dart';
import 'package:fr_test/audio/page.dart';
import 'package:fr_test/settings/page.dart';

class MainState implements Cloneable<MainState>, GlobalBaseState {
  // List<TabModels> tabList;
  // TabController tabController;
  int currentPage;
  List<TabItemState> tabList;
  List<Widget> pageList;
  PageController pageController;
  RecordTime recordTime;


  @override
  MainState clone() {
    return MainState()
      ..store = store
      ..tabList = tabList
      // ..tabController = tabController
      ..currentPage = currentPage
      ..pageList = pageList
      ..pageController = pageController
      ..recordTime;
  }

  @override
  StoreModel store;
}

MainState initState(Map<String, dynamic> args) {
  return MainState();
}

class VideoConnector extends ConnOp<MainState, TabItemState> {
  @override
  TabItemState get(MainState state) {
    return state.tabList[0].clone();
  }

  @override
  void set(MainState state, TabItemState subState) {
    state.tabList[0] = subState;
  }
}

class AudioConnector extends ConnOp<MainState, TabItemState> {
  @override
  TabItemState get(MainState state) {
    return state.tabList[1].clone();
  }

  @override
  void set(MainState state, TabItemState subState) {
    state.tabList[1] = subState;
  }
}

class SettingConnector extends ConnOp<MainState, TabItemState> {
  @override
  TabItemState get(MainState state) {
    return state.tabList[2].clone();
  }

  @override
  void set(MainState state, TabItemState subState) {
    state.tabList[2] = subState;
  }
}



class TabModels {
  String title;
  int tabId;

  TabModels({
    this.title,
    this.tabId,
  });
}

class RecordTime {
  String hour;
  String minute;
  String second;

  RecordTime({
    this.hour,
    this.minute,
    this.second,
  });
}


