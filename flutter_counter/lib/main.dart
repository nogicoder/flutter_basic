import "package:flutter/material.dart";
import "package:bloc/bloc.dart";
import "package:flutter_bloc/flutter_bloc.dart";


// Main App
void main() => runApp(MyApp());

// BLoC Layer:

// Counter event
enum CounterEvent { increment, decrement }

// Counter State: Represent by an int -> no class needed

// Counter Bloc: Extends the Bloc class with event as input and int as output
class CounterBloc extends Bloc<CounterEvent, int> {
  // Overriding the initialState of the class
  @override
  int get initialState => 0;

  /* 
  Overriding the mapEventToState method of the class.
  Taking in an event to return a Stream object of int value.
  */
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield currentState + 1;
        break;
      case CounterEvent.decrement:
        if (currentState > 0) {
          yield currentState - 1;
        } else {
          yield currentState;
        }
        break;
    }
  }
}

// Representation Layer:

// Main App Widget
class MyApp extends StatelessWidget {
  // Rendering the App
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Counter App",

        // Mapping a CounterBloc instance to the subtree using BlocProvider
        // Handling the event with dispose() -> no need for StatefulWidget
        home: BlocProvider<CounterBloc>(
            builder: (context) => CounterBloc(), child: CounterScreen()));
  }
}

// CounterScreen Widget
class CounterScreen extends StatelessWidget {
  
  // Rendering the interface
  @override
  Widget build(BuildContext context) {
    
    // Define the Bloc instance
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      
      // Using the BlocBuilder to provide the state to the rendered widget
      body: BlocBuilder<CounterEvent, int>(
        
        // Map the Bloc instance to the BlocBuilder
        bloc: _counterBloc,

        // Render the widget, passing in the state and name it "count"
        builder: (BuildContext context, int count) {
          
          // Access through $ notation
          return Center(child: Text("$count", style: TextStyle(fontSize: 30, color: Colors.black)));
        },
      ),

      // Set the widget for the user to interact, thus dispatching an event
      floatingActionButton: Row(

        // Align the widgets
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          SizedBox(width: 50),
          
          // Increment widget
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              _counterBloc.dispatch(CounterEvent.decrement);
            },
          ),
          
          // Add space between the widgets
          SizedBox(width: 10),

          // Decrement widget
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _counterBloc.dispatch(CounterEvent.increment);
            },
          ),
          
        ],
      )
    );
  }
}
