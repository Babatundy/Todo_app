import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/tasks_list.dart';
import 'styles.dart';
import 'first_screen.dart';

//////////////////////////////** for drawer **/////////////////////////////////////////////////////////////
class Drawer_Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            List_item(
              icon_data: Icons.favorite,
              text: "Favorits",
            ),
            List_item(
              icon_data: Icons.info,
              text: "About us",
            ),
            List_item(
              icon_data: Icons.feedback,
              text: "Feedback",
            ),
            List_item(
              icon_data: Icons.settings,
              text: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}

class List_item extends StatelessWidget {
  List_item({this.icon_data, this.text});

  String text;
  IconData icon_data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Icon(
          icon_data,
          color: Colors.white,
        ),
        title: Text(
          text,
          style: textStyle_for_drawer_elements,
        ),
        onTap: () => print("fuck"),
      ),
    );
  }
}

//////////////////////////////** for bottom sheet **/////////////////////////////////////////////////////////////
class B_Sheet {
  String task_text;

  @override
  Widget B_s(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            onChanged: (s) {
              task_text = s;
            },
          ),
          RaisedButton(
            child: Text("add task"),
            onPressed: () {
              Provider.of<List_data>(context, listen: false).add_to_list(task_text);
              print(Provider.of<List_data>(context, listen: false).tasks);
            },
          )
        ],
      ),
    );
  }
}
