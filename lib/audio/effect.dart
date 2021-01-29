import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AudioState> buildEffect() {
  return combineEffects(<Object, Effect<AudioState>>{
    AudioAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AudioState> ctx) {
}
