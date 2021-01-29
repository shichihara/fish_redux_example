import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter/cupertino.dart'hide Page;
import 'package:flutter/services.dart';
import 'package:fr_test/audio/page.dart';
import 'package:fr_test/jump/first/page.dart';
import 'package:fr_test/jump/second/page.dart';
import 'package:fr_test/main/page.dart';
import 'package:fr_test/main/view.dart';
import 'package:fr_test/settings/page.dart';
import 'package:fr_test/video/page.dart';
import 'count/page.dart';
import 'guide/page.dart';
import 'store/state.dart';
import 'store/store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp());

}

class RouteConfig {
  static const String mainPage = 'page/main';
  static const String videoPage = 'page/video';
  static const String audioPage = 'page/audio';
  static const String settingsPage = 'page/settings';
  static const String drawerPage = 'page/drawer';
  // static const String countPage = 'page/count';
  // static const String guidePage = 'page/guide';
  // static const String firstPage = 'page/first';
  // static const String secondPage = 'page/second';

  static final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      RouteConfig.mainPage: MainPage(),
      RouteConfig.videoPage: VideoPage(),
      RouteConfig.audioPage: AudioPage(),
      RouteConfig.settingsPage: SettingsPage(),
      // RouteConfig.countPage: CountPage(),
      // RouteConfig.guidePage: GuidePage(),
      // RouteConfig.firstPage: FirstPage(),
      // RouteConfig.secondPage: SecondPage(),
    },
    visitor: StoreConfig.visitor,
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Widget buildMainView (BuildContext context) {
    return MaterialApp(
      home: RouteConfig.routes.buildPage(RouteConfig.mainPage, null),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   primarySwatch: Colors.blue,
      //   // This makes the visual density adapt to the plaㄇtform that you run
      //   // the app on. For desktop platforms, the controls will be smaller and
      //   // closer together (more dense) than on mobile platforms.
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: buildMainView(context),
      onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        // uiAdapter(context); //界面适配
        return RouteConfig.routes.buildPage(settings.name, settings.arguments);
        });
      }
    );
  }
}

class StoreConfig {
  ///全局状态管理
  static _updateState() {
    return (Object pageState, GlobalState appState) {
      final GlobalBaseState p = pageState;

      if (pageState is Cloneable) {
        final Object copy = pageState.clone();
        final GlobalBaseState newState = copy;

        if (p.store == null) {
          ///这地方的判断是必须的，判断第一次store对象是否为空
          newState.store = appState.store;
        } else {
          /// 这地方增加字段判断，是否需要更新
          if ((p.store.themeColor != appState.store.themeColor)) {
            newState.store.themeColor = appState.store.themeColor;
          }

          /// 下列一系列对比...

        }

        /// 返回新的 state 并将数据设置到 ui
        return newState;
      }
      return pageState;
    };
  }

  static visitor(String path, Page<Object, dynamic> page) async {
    if (page.isTypeof<GlobalBaseState>()) {
      ///建立AppStore驱动PageStore的单向数据连接
      ///参数1 AppStore  参数2 当AppStore.state变化时,PageStore.state该如何变化
      page.connectExtraStore<GlobalState>(GlobalStore.store, _updateState());
    }

    page.enhancer.append(
      /// Store AOP
      middleware: [
      ],
    );
  }
}

