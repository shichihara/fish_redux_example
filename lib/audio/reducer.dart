import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AudioState> buildReducer() {
  return asReducer(
    <Object, Reducer<AudioState>>{
      AudioAction.action: _onAction,
    },
  );
}

AudioState _onAction(AudioState state, Action action) {
  final AudioState newState = state.clone();
  return newState;
}
