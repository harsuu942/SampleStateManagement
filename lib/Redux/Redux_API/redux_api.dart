
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sampleapp/Model/json.dart';
import 'package:sampleapp/Redux/main_redux.dart';

import '../../API/json_api.dart';




class ReduxAPI extends StatefulWidget{
  const ReduxAPI({Key? key}) : super(key: key);

  @override
  State<ReduxAPI> createState() => _ReduxAPIState();
}
class _ReduxAPIState extends State<ReduxAPI> {

  Store<AppState> store = Store<AppState>(counterReducer,initialState: AppState.initial());

  /*void handleInitialBuild(PostsScreenProps props) {
    props.getPosts();
  }*/

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
        // Widgets will find and use this value as the `Store`.
        store: store,
        child:Scaffold(
      appBar: AppBar(title: const Text("Redux API")),
      body: Center(
        child: StoreConnector<AppState, List<JSONModel>>(
          converter: (store) => store.state.models,
          onInit: (store) => fetchLists(store),
       //   onInitialBuild: (props) => handleInitialBuild(props),
          builder: (context, props) {
            List<JSONModel> data = props;
            return ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: data.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, i) {
                  JSONModel model = data[i];

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
          },
        ),
      ),)

    );
  }

}



