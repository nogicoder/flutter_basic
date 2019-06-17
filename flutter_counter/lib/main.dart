import "package:flutter/material.dart";
import "package:bloc/bloc.dart";
import "package:flutter_bloc/flutter_bloc.dart";


// Main App
void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    BlocProviderTree(
      blocProviders: [
        BlocProvider<ThemeBloc>(
          builder: (context) => ThemeBloc()
        ),
        BlocProvider<CounterBloc>(
          builder: (context) => CounterBloc()
        )
      ],
      child: MyApp()
    )
  );
}

// -----------------------------BLoC Layer-----------------------------

// Theme Event
enum ThemeEvent { changeTheme }

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  
  // Set initial Theme
  @override
  ThemeData get initialState => ThemeData.light();

  // Map state to an event
  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    switch(event) {
      case ThemeEvent.changeTheme:
      yield currentState == ThemeData.dark()
        ? ThemeData.light()
        : ThemeData.dark();
      break;
    }
  }
}

// Counter Event
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
        yield currentState > 0
          ? currentState - 1
          : currentState;
        break;
    }
  }
}

// Bloc Delegate
class SimpleBlocDelegate extends BlocDelegate {
  
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}


// --------------------------Representation Layer--------------------------

// Main App Widget
class MyApp extends StatelessWidget {
  // Rendering the App
  @override
  Widget build(BuildContext context) {
    final ThemeBloc _themeBloc = BlocProvider.of<ThemeBloc>(context);

    return BlocBuilder(
      bloc: _themeBloc,
      builder: (_, ThemeData theme) {
        return MaterialApp(
          title: "Counter App",
          theme: theme,
          // Mapping a CounterBloc instance to the subtree using BlocProvider
          // Handling the event with dispose() -> no need for StatefulWidget
          home: CounterScreen()
        );
      }
    );
  }
}

// CounterScreen Widget
class CounterScreen extends StatelessWidget {
  
  // Rendering the interface
  @override
  Widget build(BuildContext context) {

    // Define the Bloc instance
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    final ThemeBloc _themeBloc = BlocProvider.of<ThemeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        actions: <Widget>[
          // Change theme of the App
          FlatButton(
            child: Icon(Icons.tab),
            onPressed: () {_themeBloc.dispatch(ThemeEvent.changeTheme);
            },
          )
        ],
      ),
      
      // Using the BlocBuilder to provide the state to the rendered widget
      body: BlocBuilder<CounterEvent, int>(
        
        // Map the Bloc instance to the BlocBuilder
        bloc: _counterBloc,

        // Render the widget, passing in the state and name it "count"
        builder: (BuildContext context, int count) {
          
          // Access through $ notation
          return Center(child: Text("$count", style: TextStyle(fontSize: 30)));
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
          )
        ],
      )
    );
  }
}
