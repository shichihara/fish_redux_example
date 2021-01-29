import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:fr_test/main/component.dart';
import 'package:fr_test/main/tabItem_component/component.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MainPage extends Page<MainState, Map<String, dynamic>> {
  MainPage()
    : super(
      initState: initState,
      effect: buildEffect(),
      reducer: buildReducer(),
      view: buildView,
      dependencies: Dependencies<MainState>(
          adapter: null,
          slots: <String, Dependent<MainState>>{
            "videoTab": VideoConnector() + TabItemComponent(),
            "audioTab": AudioConnector() + TabItemComponent(),
            "settingsTab": SettingConnector() + TabItemComponent()
          }),
      middleware: <Middleware<MainState>>[
      ],);

  @override
  ComponentState<MainState> createState() {
    return CommunityComponentState();
  }
}