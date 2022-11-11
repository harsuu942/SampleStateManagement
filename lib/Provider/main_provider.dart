

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter with ChangeNotifier{
  int count = 0;
  int get countV => count;
  void increment(){
    count++;
    notifyListeners();
  }
  void decrement(){
    count--;
    notifyListeners();
  }
}

class FlutterProviderApp extends StatefulWidget {
  const FlutterProviderApp({Key? key}) : super(key: key);


  @override
  State<FlutterProviderApp> createState() => _FlutterProviderAppState();
}

class _FlutterProviderAppState extends State<FlutterProviderApp> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times  ',style: TextStyle(fontSize: 18),
            ),
            Text(
                '${context.watch<Counter>().count}',
                style: const TextStyle(color: Colors.white,fontSize: 16)
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
              context.read<Counter>().increment();
            },
            heroTag: "Provider Increment",
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<Counter>().decrement();
            },
            heroTag: "Provider Decrement",
          ),
        ],
      ),
    );
  }
}

