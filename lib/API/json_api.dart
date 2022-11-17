
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sampleapp/Model/json.dart';

import '../Redux/main_redux.dart';

Future<List<JSONModel>> fetchLists(store) async {

  List<JSONModel> models = [];
  final response =
  await http.Client().get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var responseData = json.decode(response.body);
  for (var model in responseData) {
    JSONModel user = JSONModel(
        id: model["id"],
        userId: model["userId"],
        title: model["title"],
        body: model["body"]);

    models.add(user);
  }
  if(store != null) {
    store.dispatch(AppState(count: 0, models: models));
  }
  return models;
}