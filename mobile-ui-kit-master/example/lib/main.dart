import 'package:flutter/material.dart';
import 'package:uikit_bycn_example/providers/component_provider.dart';
import 'routes.dart';
import 'widgets/component_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: routes, home: ComponentProvider(child: Homepage()));
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool disabled = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BYCN Mobile App DEMO'),
        ),
        body: new ComponentList());
  }
}
