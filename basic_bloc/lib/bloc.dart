import 'dart:async';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';


/// This class handle the Business Logic of the App using Stream.
/// Initial value of the State is a list with 2 items:
/// + _counter: The value of the counter
/// + _color: The background color of the app
/// These value will be changed based on the 2 methods: incrementCounter and decrementCounter.
class CounterBloc {
  int _counter = 0;
  Color _color;
  List<dynamic> _stateList;

  RandomColor _randomColor = RandomColor();

  /// Initiate a controller for the Stream
  StreamController _controller = StreamController<List<dynamic>>(); //NOTE

  /// A getter for the Stream object, providing for the StreamBuilder in the UI component
  Stream<List<dynamic>> get getStream => _controller.stream;

  /// A method to increase the value of the counter by 1 and set a random color for the background.
  /// Add the next State to the Stream.
  void incrementCounter() {
    _counter++;
    _color = _randomColor.randomColor();
    _stateList = [_counter, _color];
    _controller.sink.add(_stateList);
  }

  /// A method to decrease the value of the counter by 1 and set a random color for the background.
  /// Only decrease if the counter is bigger than 0, setting the minimum value of counter equals 0.
  /// Add the next State to the Stream.
  void decrementCounter() {
    if (_counter > 0) {
      _counter--;
      _color = _randomColor.randomColor();
    }
    _stateList = [_counter, _color];
    _controller.sink.add(_stateList);
  }

  /// A method to close the controller when it is no longer needed
  void dispose(){
    _controller.close();
  }
}