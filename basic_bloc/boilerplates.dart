// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:basic_bloc/bloc.dart';

// void main() => runApp(Counter());

// class Counter extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {

//     return MaterialApp(
//       title: "Counter App",
//       home: CounterWidget()
//     );

//   }
// }

// class CounterWidget extends StatefulWidget {

//   @override
//   _CounterWidgetState createState() => new _CounterWidgetState();
// }

// class _CounterWidgetState extends State<CounterWidget> {

//   static const initialState = 0;
//   int _counter = 0;

//   CounterBloc _bloc = CounterBloc(initialState);

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _bloc.getStream.listen((counter) => _counter = counter);
//   }

//   @override
//   void dispose() {
//     _bloc.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Basic Counter App Using BLoC"),
//       ),
//       body: Column(
//         children: <Widget>[
//           Text("$_counter"),
//           FlatButton(
//             child: Icon(Icons.add),
//             onPressed: _bloc.incrementCounter
//           ),
//           FlatButton(
//             child: Icon(Icons.remove),
//             onPressed: _bloc.decrementCounter
//           ),
//         ],
//       )
//     );
//   }
// }