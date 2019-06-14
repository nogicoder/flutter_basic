import 'package:flutter/material.dart';
import 'package:flutter_app/pages/cart_page.dart';
import 'package:flutter_app/providers/app_provider.dart';
import 'package:flutter_app/providers/cart_provider.dart';
import 'package:flutter_app/widgets/appbar_action_button.dart';
import 'package:flutter_app/widgets/construction_sites_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: CartProvider(
        child: new MaterialApp(
          title: 'My Construction Sites',
          theme: new ThemeData(
            primarySwatch: Colors.deepOrange,
          ),
          home: new MyHomePage(title: 'Construction Sites'),               
          routes: <String, WidgetBuilder>{"cart": (context) => CartPage()},
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        //title: new Text(widget.title),
        title: Text('${MediaQuery.of(context).size.width.toStringAsFixed(0)} X ${MediaQuery.of(context).size.height.toStringAsFixed(0)}'),
        actions: <Widget>[
          new AppBarActionButton(),
        ],
      ),
      body: new ConstructionSitesList(),
    );
  }
}
