import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/first_screen.dart';

class Task extends StatelessWidget {
  String text = '';
  int index;
  bool valuee = false;
  Function callback;

  Task({this.text, this.index});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => changes(),
      builder: (context, child) {
        return ListTile(
          leading: Checkbox(
            value: Provider.of<changes>(context).fuck,
            onChanged: (b) {
              Provider.of<changes>(context, listen: false).done(b);
            },
          ),
          title: Text(text),
          onLongPress: (){

            Provider.of<List_data>(context,listen: false).remove_item(index);
          },

        );
      },
    );
  }
}

class changes with ChangeNotifier {
  bool fuck = false;

  void done(bool value) {
    print(fuck);
    fuck = value;
    notifyListeners();
  }
}
