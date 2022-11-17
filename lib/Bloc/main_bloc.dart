

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleapp/Bloc/Bloc_API/bloc_api.dart';

/// Event being processed by [CounterBloc].
abstract class CounterEvent {}

/// Notifies bloc to increment state.
class CounterIncrementPressed extends CounterEvent {}

/// Notifies bloc to decrement state.
class CounterDecrementPressed extends CounterEvent {}

/// {@template counter_bloc}
/// A simple [Bloc] that manages an `int` as its state.
/// {@endtemplate}
class CounterBloc extends Bloc<CounterEvent, int> {
  /// {@macro counter_bloc}
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }
}


// void main() {
//   runApp(const CounterPage());
// }

class FlutterBlocApp extends StatefulWidget {
  const FlutterBlocApp({Key? key}) : super(key: key);

  @override
  State<FlutterBlocApp> createState() => _FlutterBlocAppState();
}

class _FlutterBlocAppState extends State<FlutterBlocApp> {

  /// {@macro counter_page}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const CounterView(),
    );
  }
}

/// {@template counter_view}
/// A [StatelessWidget] that:
/// * demonstrates how to consume and interact with a [CounterBloc].
/// {@endtemplate}
class CounterView extends StatelessWidget {
  /// {@macro counter_view}
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times  ',style: TextStyle(fontSize: 18),
            ),
            BlocBuilder<CounterBloc, int>(
              builder: (context, count) {
                return Text(count.toString(),
                    style: const TextStyle(color: Colors.white,fontSize: 16));
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BlocAPI()));

                  },
                  child: const Text('Bloc API',style: TextStyle(fontSize: 16),)),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncrementPressed());
            },
            heroTag: "Bloc Increment",
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecrementPressed());
            },
            heroTag: "Bloc Decrement",
          ),
        ],
      ),
    );
  }
}