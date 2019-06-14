import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/app_bloc.dart';
import 'package:flutter_app/providers/app_provider.dart';

class DisplayCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppBloc bloc = AppProvider.of(context);
    return StreamBuilder<int>(
      stream: bloc.selConstructionSitesCount,
      builder: (context, snapshot) => Text("Class 3 : ${snapshot.data}",),
    );
  }
}