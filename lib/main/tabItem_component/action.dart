import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TabItemAction { action }

class TabItemActionCreator {
  static Action onAction() {
    return const Action(TabItemAction.action);
  }
}
