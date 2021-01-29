import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CountAction { updateCount }

class CountActionCreator {
  static Action updateCount() {
    return const Action(CountAction.updateCount);
  }
}
