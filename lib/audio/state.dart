import 'package:fish_redux/fish_redux.dart';

class AudioState implements Cloneable<AudioState> {

  @override
  AudioState clone() {
    return AudioState();
  }
}

AudioState initState(Map<String, dynamic> args) {
  return AudioState();
}
