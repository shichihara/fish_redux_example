import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fr_test/main.dart';

import 'action.dart';
import 'state.dart';

MainState _mainState;
Dispatch _dispatch;
ViewService _viewService;

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  _mainState = state;
  _dispatch = dispatch;
  _viewService = viewService;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  _buildDrawerIcon() {
    return Container(
      // color: Colors.blue,
      height: 30.0,
      width: 30.0,
      margin: EdgeInsets.only(
        right: 5.0,
        left: 10.0
      ),
      child: Listener(
        onPointerDown:(_){
          _scaffoldKey.currentState.openDrawer();
        },
        child: Image.asset(
          'assets/mainpage/icon_menu.png',
          fit: BoxFit.fill,
          gaplessPlayback: true,
        ),
      )
    );
  }

  _buildLeftArea() {
    return Row(
      children: [
        _buildDrawerIcon(),
        Container(
          // color: Colors.purple,
          height: 20.0,
          // child: Image.asset(
          //   'assets/mainpage/app_logo.png',
          //   fit: BoxFit.fill,
          //   gaplessPlayback: true,
          // ),
          child: Text(
            'Logo Area',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  _buildTabItem(String title, int pageId) {
    print('currentpage ${_mainState.currentPage}');
    print('pageId: ${pageId}');
    return Listener(
      onPointerDown: (_){
        print(_mainState.currentPage);
        // if (_mainState.currentPage != pageId) {
          _dispatch(MainActionCreator.onChangePageAction(pageId));
        // }
      },
      child: Container(
        height: 40.0,
        width: 140.0,
        decoration: (_mainState.currentPage == pageId)
        ? BoxDecoration(
          border: Border.all(width:1 , color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          gradient: RadialGradient(
            center: const Alignment(0, 0), // near the top right
            radius: 2.1,
            colors: [
              const Color.fromRGBO(2, 242, 248, 1), // Center cyan
              const Color.fromRGBO(0, 96, 99, 1), // darker cyan
            ],
            stops: [0.2, 1.0],
          )
        )
        : BoxDecoration(
          color: Color.fromRGBO(46, 46, 46, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(3.0)
          ),
        ),
        child:Center(
          child:Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: _mainState.currentPage == pageId
                ? Colors.black
                : Color.fromRGBO(112, 112, 112, 1),
            )
          ),
        )
      )
    );
  }

  _buildTabBar() {
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(width:2, color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Row(
        children: [
          // _buildTabItem('video', 0),
          // _buildTabItem('audio', 1),
          // _buildTabItem('settings', 2),
          _viewService.buildComponent('videoTab'),
          _viewService.buildComponent('audioTab'),
          _viewService.buildComponent('settingsTab'),
        ]
      ),
    );
  }

  _buildStreamControl() {
    return Container(
      margin: EdgeInsets.only(right: 5.0),
      child: Row(
        children: [
          Text(
            '${_mainState.recordTime.hour}:${_mainState.recordTime.minute}:${_mainState.recordTime.second}',
            style: TextStyle(color: _mainState.store.textColor),
          ),
          Listener(
            onPointerDown: (_){
              print('Streaming left click');
            },
            child:Container(
              width: 45.0,
              height: 45.0,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/golive/golive_normal.png',
                fit: BoxFit.fill,
                gaplessPlayback: true,
              ),
            ),
          ),
          Listener(
            onPointerDown: (_){
              print('Streaming right click');
            },
            child:Container(
              width: 45.0,
              height: 45.0,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/golive/pause_normal.png',
                fit: BoxFit.fill,
                gaplessPlayback: true,
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar _renderAppBar() {
    return AppBar(
      backgroundColor: _mainState.store.backgroundColor,
      centerTitle: true,
      automaticallyImplyLeading: false,
      titleSpacing: 10,
      title: Container(
        padding:EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0)
          ),
          border: Border.all(width: 1, color: Colors.black)
        ),
        height: 55.0,
        child:
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLeftArea(),
                _buildTabBar(),
                _buildStreamControl(),
              ]
            )
      ),
    );
  }

  return Scaffold(
    key: _scaffoldKey,
    appBar: _renderAppBar(),
    drawer: Drawer(child: RouteConfig.routes.buildPage(RouteConfig.drawerPage,null)),
    body: PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: _mainState.pageList.length,
      itemBuilder: (context, index) => _mainState.pageList[index],
      controller: _mainState.pageController,
    ),
    // TabBarView(
    //   controller: _mainState.tabController,
    //   children: [
    //     RouteConfig.routes.buildPage(RouteConfig.videoPage, null),
    //     RouteConfig.routes.buildPage(RouteConfig.audioPage, null),
    //     RouteConfig.routes.buildPage(RouteConfig.settingsPage, null),
    //   ],
    // ),
    // ),
  );
}
