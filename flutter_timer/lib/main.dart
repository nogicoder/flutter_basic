import "package:flutter/material.dart";
import "package:bloc/bloc.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:equatable/equatable.dart";
import "package:wave/wave.dart";


// Define a model to represent state mutation
class Ticker {

  /* 
  Since x starts with 0, if we starts with ticks, the first returned value 
  of (ticks - x) is unchanged (ticks)
  -> we starts with ticks - 1 so the first return value is ticks - 1
  */
  Stream<int> tick({int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - 1 - x)
      .take(ticks);
  }
}