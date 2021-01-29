import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(GuideState state, Dispatch dispatch, ViewService viewService) {
  return _bodyWidget(state, dispatch);
}

Widget _bodyWidget(GuideState state, Dispatch dispatch) {
  return Container(
    // appBar: AppBar(
    //   title: Text("GuidePage"),
    //   backgroundColor: state.store.themeColor,
    // ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _jumpButton("toCount", () {
            dispatch(GuideActionCreator.toCount());
          }),
          _jumpButton("toJump", () {
            dispatch(GuideActionCreator.toJump());
          }),
          _jumpButton("toList", () {
            dispatch(GuideActionCreator.toList());
          }),
          _jumpButton("toListEdit", () {
            dispatch(GuideActionCreator.toListEdit());
          }),
          _jumpButton("toComponent", () {
            dispatch(GuideActionCreator.toComponent());
          }),
          _jumpButton("switchTheme", () {
            dispatch(GuideActionCreator.switchTheme());
          }),
        ],
      ),
    ),
    // body: SafeArea(
    //   child: IndexedStack(
    //     index: _pageIndex,
    //     children: <Widget>[
    //       NavigatorPage(
    //         child: Text('Home'),
    //       ),
    //       NavigatorPage(
    //         child: Text('Business'),
    //       ),
    //       NavigatorPage(
    //         child: Text('Technology'),
    //       ),
    //       NavigatorPage(
    //         child: Text('Education'),
    //       ),
    //     ],
    //   ),
    // ),
  );
}

typedef CallBack = void Function();

Widget _jumpButton(String name, CallBack callBack) {
  return InkWell(
    customBorder:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    splashColor: Colors.lightBlueAccent,
    highlightColor: Colors.lightBlueAccent,
    child: RaisedButton(
      color: Colors.blue,
      highlightColor: Colors.blue[700],
      colorBrightness: Brightness.dark,
      splashColor: Colors.grey,
      child: Text(name),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: () {
        ///监听点击事件
        callBack();
      },
    ),
  );
}
