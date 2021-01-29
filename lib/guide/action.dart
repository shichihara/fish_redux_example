import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GuideAction {
  toCount,
  toJump,
  toList,
  toListEdit,
  toComponent,
  switchTheme,
}

class GuideActionCreator {
  static Action toCount() {
    return const Action(GuideAction.toCount);
  }

  static Action toJump() {
    return const Action(GuideAction.toJump);
  }

  static Action toList() {
    return const Action(GuideAction.toList);
  }

  static Action toListEdit() {
    return const Action(GuideAction.toListEdit);
  }

  static Action toComponent() {
    return const Action(GuideAction.toComponent);
  }

  static Action switchTheme() {
    return const Action(GuideAction.switchTheme);
  }
}
