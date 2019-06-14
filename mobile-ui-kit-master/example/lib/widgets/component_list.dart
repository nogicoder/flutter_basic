import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:uikit_bycn_example/bloc/component_bloc.dart';
import 'package:uikit_bycn_example/providers/component_provider.dart';
import 'package:uikit_bycn_example/models/component_model.dart';

class ComponentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ComponentBloc componentBloc = ComponentProvider.of(context);
    return new StreamBuilder<List<ComponentModel>>(
      stream: componentBloc.components,
      initialData: new List<ComponentModel>(),
      builder: (context, snapshot) {
        if (snapshot.data.isEmpty) return Center(child: Container());
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(snapshot.data[index].routeName);
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Column(
                        children: <Widget>[Icon(snapshot.data[index].icon)],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          snapshot.data[index].title,
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          snapshot.data[index].subtitle,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
