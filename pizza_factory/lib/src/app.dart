import "package:flutter/material.dart";

import 'pizza_house.dart';
import 'blocs/provider.dart';


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        home: PizzaHouse(),
      )
    );
  }  
}