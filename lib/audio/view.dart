import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(AudioState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: EdgeInsets.only(top: 20),
    child: Text('This is audio view'),
  );
}
