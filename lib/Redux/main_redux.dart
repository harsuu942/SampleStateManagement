import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// One simple action: Increment
enum Actions { Increment,Decrement }

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
int counterReducer(int state, dynamic action) {
  return action == Actions.Increment ? state + 1 : action ==
      Actions.Decrement ? state -1 : state;
}

// void main() {
//   // Create your store as a final variable in the main function or inside a
//   // State object. This works better with Hot Reload than creating it directly
//   // in the `build` function.
//   final store = Store<int>(counterReducer, initialState: 0);
//
//   runApp(FlutterReduxApp(
//     title: 'Flutter Redux Demo',
//     store: store,
//   ));
// }

class FlutterReduxApp extends StatefulWidget {
  const FlutterReduxApp({Key? key}) : super(key: key);

  @override
  State<FlutterReduxApp> createState() => _FlutterReduxAppState();
}

class _FlutterReduxAppState extends State<FlutterReduxApp> {

  Store<int> store = Store<int>(counterReducer,initialState: 0);


  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
      // Widgets will find and use this value as the `Store`.
      store: store,
      child: Scaffold(
        appBar: AppBar(title: const Text("Redux")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have pushed the button this many times  ',style: TextStyle(fontSize: 18),
              ),
              StoreConnector<int, String>(
                converter: (store) => store.state.toString(),
                builder: (context, count) {
                  return Text(
                      count,
                      style: TextStyle(color: Colors.white,fontSize: 16)
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton:
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            StoreConnector<int, VoidCallback>(
              converter: (store) {
                // Return a `VoidCallback`, which is a fancy name for a function
                // with no parameters and no return value.
                // It only dispatches an Increment action.
                return () => store.dispatch(Actions.Increment);
              },
              builder: (context, callback) {
                return FloatingActionButton(
                  // Attach the `callback` to the `onPressed` attribute
                  onPressed: callback,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                  heroTag: "Redux Increment",
                );
              },
            ),
            const SizedBox(height: 4),
            StoreConnector<int, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(Actions.Decrement);
              },
              builder: (context, callback) {
                return FloatingActionButton(
                  // Attach the `callback` to the `onPressed` attribute
                  onPressed: callback,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                  heroTag: "Redux Decrement",
                );
              },
            ),
          ],
        ),

      ),
    );
  }
}