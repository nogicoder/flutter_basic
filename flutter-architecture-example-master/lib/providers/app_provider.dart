import 'package:flutter/material.dart';

import 'package:flutter_app/bloc/app_bloc.dart';

class AppProvider extends InheritedWidget {
  AppProvider({
    Key key,
    AppBloc appBloc,
    Widget child,
  }) :  _appBloc = appBloc ?? new AppBloc(),
        super(key: key, child: child);
  
  final AppBloc _appBloc;

  static AppBloc of(BuildContext context){
    return ((context).inheritFromWidgetOfExactType(AppProvider) as AppProvider)._appBloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}