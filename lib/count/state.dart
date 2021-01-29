import 'package:fish_redux/fish_redux.dart';
import 'package:fr_test/store/state.dart';

class CountState implements Cloneable<CountState>, GlobalBaseState {
  int count;

  @override
  StoreModel store;

  @override
  CountState clone() {
    return CountState()
      ..count = count
      ..store = store;
  }

  Map<String, dynamic> toJson() {
    var map = {
      'count': count,
    };
    return map;
  }

}

CountState initState(Map<String, dynamic> args) {
  return CountState()..count = 0;
}
