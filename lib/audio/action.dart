import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AudioAction { action }

class AudioActionCreator {
  static Action onAction() {
    return const Action(AudioAction.action);
  }
}
