import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(DrawerState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    width: 150,
    child: Text('this is drawer')
  );
}
