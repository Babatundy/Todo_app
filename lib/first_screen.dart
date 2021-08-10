import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Widgets.dart';
import 'models/tasks_list.dart';

List<Task> tasks = [
  Task(
    text: "dz",
    callback: changes().done,
  ),
  Task(
    text: "dz",
    callback: changes().done,
  ),
  Task(
    text: "dz",
    callback: changes().done,
  ),
];

class Main_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            itemCount: tasks.length,
            itemBuilder: (context, i) {
              return tasks[i];
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context){});
        },
      ),
    );
  }
}

class changes with ChangeNotifier {
  bool fuck = false;

  void done(bool value) {
    print(value);
    value = !value;
    notifyListeners();
  }
}
