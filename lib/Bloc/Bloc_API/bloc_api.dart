
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleapp/Bloc/Bloc_API/api_repository.dart';

import '../../Model/json.dart';

class BlocAPI extends StatefulWidget {
  const BlocAPI({Key? key}) : super(key: key);

  @override
  State<BlocAPI> createState() => _BlocAPIState();
}

class _BlocAPIState extends State<BlocAPI> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider<DataListCubit>(
      create: (context) => DataListCubit(DataRepository()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Bloc API")),
        body: BlocBuilder<DataListCubit,DataListState>(
          builder: (context,state){
            return ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: state.data.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, i) {
                  JSONModel model = state.data[i];

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
            );
          }
        )
      ),
    );
  }

}