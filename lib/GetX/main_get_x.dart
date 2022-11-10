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

void main() {
  // Create your store as a final variable in the main function or inside a
  // State object. This works better with Hot Reload than creating it directly
  // in the `build` function.


  runApp(Home());
}

class Home extends StatelessWidget {


  @override
  Widget build(context) {

    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final c = Get.put(Controller());

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
          appBar: AppBar(title: Text("Flutter GetX Demo")),

          // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
          body: GetBuilder<Controller>(
              builder: (_) => Center(
                child: Text(
                    'You have pushed the button this many times:${c.count}',
                    style: const TextStyle(color: Colors.white,fontSize: 16)
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
              ),
              const SizedBox(height: 4),
              FloatingActionButton(
                child: const Icon(Icons.remove),
                onPressed: () {
                  c.decrement();
                },
              ),
            ],
          ),),
    );
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context){
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}