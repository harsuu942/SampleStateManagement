import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;
  decrement() => count--;
}

class FlutterGetApp extends StatefulWidget {
  const FlutterGetApp({Key? key}) : super(key: key);

  @override
  State<FlutterGetApp> createState() => _FlutterGetAppState();
}

class _FlutterGetAppState extends State<FlutterGetApp> {


  @override
  Widget build(context) {

    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final c = Get.put(Controller());

    return Scaffold(

      appBar: AppBar(title: const Text("GetX")),


      body: GetX<Controller>(
          builder: (_) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times  ',style: TextStyle(fontSize: 18),
                ),
                Text(
                    '${c.count}',
                    style: const TextStyle(color: Colors.white,fontSize: 16)
                ),
              ],
            ),
          )),
      floatingActionButton:
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              c.increment();
            },
            heroTag: "Getx Increment",
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              c.decrement();
            },
            heroTag: "Getx Decrement",
          ),
        ],
      ),);
  }
}
