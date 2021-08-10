import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Widgets.dart';
import 'models/tasks_list.dart';

class List_data with ChangeNotifier {
  int item_index = 1;
  List<Task> tasks = [
    Task(
      text: "dz",
      index: 0,
    ),
  ];

  void add_to_list(String text) {
    tasks.add(
      Task(
        text: text,
        index: item_index,
      ),
    );
    item_index++;
    notifyListeners();
  }
  void remove_item(int index)
  {
    tasks.removeAt(index);
    notifyListeners();
  }
}

class Main_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => List_data(),
      builder: (contextt, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Todo"),
            backgroundColor: Colors.black26,
            elevation: 40,
          ),
          drawer: Drawer(
            child: Drawer_Widget(),
          ),
          body: Center(
            child: Container(
              child: ListView.builder(
                itemCount: Provider.of<List_data>(contextt).tasks.length,
                itemBuilder: (context, i) {
                  int index=i;
                  return Task(text: Provider.of<List_data>(contextt).tasks[i].text,index: index,);
                },
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return B_Sheet().B_s(contextt);
                },
              );
            },
          ),
        );
      },
    );
  }
}
