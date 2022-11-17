import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sampleapp/Model/json.dart';
import 'package:sampleapp/Redux/Redux_API/redux_api.dart';

// One simple action: Increment
enum Actions { Increment,Decrement }

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
AppState counterReducer(AppState state, dynamic action) {
  return AppState(count: action == Actions.Increment ? state.count + 1 : action ==
      Actions.Decrement ? state.count -1 : state.count,models: (action == Actions.Increment || action == Actions.Decrement)?[]:
  jsonModels(state.models,action));
}

jsonModels(state,action) {
  if (action is AppState) {
    return action.models;
  }
}

class AppState {
  final int count;
  final List<JSONModel> models;

  AppState({required this.count, required this.models});

  factory AppState.initial() {
    return AppState(count: 0, models: []);
  }
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

  Store<AppState> store = Store<AppState>(counterReducer,initialState: AppState.initial());


  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
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
              StoreConnector<AppState, String>(
                converter: (store) => store.state.count.toString(),
                builder: (context, count) {
                  return Text(
                      count,
                      style: TextStyle(color: Colors.white,fontSize: 16)
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width-100,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 14, color: Colors.white))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ReduxAPI()));

                    },
                    child: const Text('Redux API',style: TextStyle(fontSize: 16),)),
              ),
            ],
          ),
        ),
        floatingActionButton:
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            StoreConnector<AppState, VoidCallback>(
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
            StoreConnector<AppState, VoidCallback>(
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