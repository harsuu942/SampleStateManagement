
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sampleapp/API/json_api.dart';
import 'package:sampleapp/Model/json.dart';

class DataController extends GetxController {
  var models = [].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}


  getApi() async {
    models.value = [];
    var jsonData = await fetchLists(null);
    models.addAll(jsonData);
  }
}
