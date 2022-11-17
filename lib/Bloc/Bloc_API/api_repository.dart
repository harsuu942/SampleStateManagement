
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleapp/API/json_api.dart';
import 'package:sampleapp/Model/json.dart';

class DataRepository {
  DataRepository() {
    getData();
  }


  List<JSONModel> jsonData = [];
  final _controller = StreamController<List<JSONModel>>();

  Future<void> getData() async {
    jsonData = [];
    var models = await fetchLists(null);
    jsonData.addAll(models);
    _controller.add(models);
  }

  Stream<List<JSONModel>> data() async* {
    yield* _controller.stream;
  }

  void dispose() => _controller.close();
}


class DataListState   {
  const DataListState(this.data);

  final List<JSONModel> data;

  DataListState copyWith({
    List<JSONModel>? data,
  }) {
    return DataListState(
      data ?? this.data,
    );
  }
}

class DataListCubit extends Cubit<DataListState> {
  DataListCubit(this.dataRepository) : super(const DataListState([])) {
    loadList();
  }
  final DataRepository dataRepository;

  loadList() {
    dataRepository.data().listen((event) {
      if (event.isNotEmpty) {
        emit(state.copyWith(data: dataRepository.jsonData));
      }
    });
  }
}

