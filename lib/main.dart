import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sampleapp/Bloc/main_bloc.dart';
import 'package:sampleapp/GetX/main_get_x.dart';
import 'package:sampleapp/Provider/main_provider.dart';
import 'package:sampleapp/Redux/main_redux.dart';

void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Counter()),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter State',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter StateManagement'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             width: MediaQuery.of(context).size.width-100,
             child: ElevatedButton(
                 style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(Colors.green),
                     padding:
                     MaterialStateProperty.all(const EdgeInsets.all(20)),
                     textStyle: MaterialStateProperty.all(
                         const TextStyle(fontSize: 14, color: Colors.white))),
                 onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FlutterProviderApp()));

                 },
                 child: const Text('Provider')),
           ),

           const SizedBox(height: 10,),
           Container(
             width: MediaQuery.of(context).size.width-100,
             child: ElevatedButton(
                 style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(Colors.green),
                     padding:
                     MaterialStateProperty.all(const EdgeInsets.all(20)),
                     textStyle: MaterialStateProperty.all(
                         const TextStyle(fontSize: 14, color: Colors.white))),
                 onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FlutterBlocApp()));

                 },
                 child: const Text('Bloc')),
           ),
           const SizedBox(height: 10,),
           Container(
             width: MediaQuery.of(context).size.width-100,
             child: ElevatedButton(
                 style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(Colors.green),
                     padding:
                     MaterialStateProperty.all(const EdgeInsets.all(20)),
                     textStyle: MaterialStateProperty.all(
                         const TextStyle(fontSize: 14, color: Colors.white))),
                 onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FlutterReduxApp()));

                 },
                 child: const Text('Redux')),
           ),
           const SizedBox(height: 10,),
           Container(
             width: MediaQuery.of(context).size.width-100,
             child: ElevatedButton(
                 style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(Colors.green),
                     padding:
                     MaterialStateProperty.all(const EdgeInsets.all(20)),
                     textStyle: MaterialStateProperty.all(
                         const TextStyle(fontSize: 14, color: Colors.white))),
                 onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FlutterGetApp()));
                 },
                 child: const Text('GetX')),
           ),
         ],

        ),
      ),

    );
  }
}
