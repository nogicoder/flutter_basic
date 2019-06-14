import 'package:flutter/material.dart';

import 'package:uikit_bycn_example/bloc/component_bloc.dart';

class ComponentProvider extends InheritedWidget {
  ComponentProvider({
    Key key,
    ComponentBloc componentBloc,
    Widget child,
  })  : _componentBloc = componentBloc ?? new ComponentBloc(),
        super(key: key, child: child);

  final ComponentBloc _componentBloc;

  static ComponentBloc of(BuildContext context) {
    return ((context).inheritFromWidgetOfExactType(ComponentProvider)
            as ComponentProvider)
        ._componentBloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
