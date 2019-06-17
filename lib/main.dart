import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(title: "Sample App", home: CustomForm());
  }
}

class CustomForm extends StatefulWidget {
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  Text _platform() {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return Text('iOS');
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      return Text('android');
    } else if (Theme.of(context).platform == TargetPlatform.fuchsia) {
      return Text('fuchsia');
    } else {
      return Text('not recognised ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Retrieve Text Input'),
        ),
        body: Center(child: _platform()));
  }
}