import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'state.dart';

Widget buildView(TabItemState state, Dispatch dispatch, ViewService viewService) {
  return Listener(
      onPointerDown: state.callback,
      child: Container(
        height: 40.0,
        width: 140.0,
        decoration: state.isEnable
        ? BoxDecoration(
          border: Border.all(width:1 , color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          gradient: RadialGradient(
            center: const Alignment(0, 0), // near the top right
            radius: 2.1,
            colors: [
              const Color.fromRGBO(2, 242, 248, 1), // Center cyan
              const Color.fromRGBO(0, 96, 99, 1), // darker cyan
            ],
            stops: [0.2, 1.0],
          )
        )
        : BoxDecoration(
          color: Color.fromRGBO(46, 46, 46, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(3.0)
          ),
        ),
        child:Center(
          child:Text(
            state.text,
            style: TextStyle(
              fontSize: 14,
              color: state.isEnable
                ? Colors.black
                : Color.fromRGBO(112, 112, 112, 1),
            )
          ),
        )
      )
    );
}
