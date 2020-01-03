import 'package:flutter/material.dart';

class VisibilityState extends InheritedWidget {

  VisibilityState({Key key, this.visibleOne, this.visibleTwo, this.changeVisibilityOne, this.changeVisibilityTwo, Widget child})
      : super(key: key, child: child);

  final bool visibleOne;
  final bool visibleTwo;
  final Function changeVisibilityOne;
  final Function changeVisibilityTwo;

  @override
  bool updateShouldNotify(VisibilityState oldWidget) {
    return visibleOne != oldWidget.visibleOne && visibleTwo != oldWidget.visibleTwo;

  }

  static of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(VisibilityState);
  }
}