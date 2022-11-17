
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../Model/json.dart';
import 'get_controller.dart';

class GetXAPI extends StatefulWidget {
  const GetXAPI({Key? key}) : super(key: key);

  @override
  State<GetXAPI> createState() => _GetXAPIState();
}

class _GetXAPIState extends State<GetXAPI> {

  DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("GetX API")),
      body: Obx(() => ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: dataController.models.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, i) {
            JSONModel model = dataController.models[i];

            return Card(
              child: ListTile(
                title: Text(
                    model.title!
                ),
                subtitle: Text(
                    model.body!
                ),
              ),
            );
          }
      )),
    );
  }

}