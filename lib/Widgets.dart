import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/DB_helper.dart';
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
  int index;
  B_Sheet();
  int id=1;
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
            onPressed: () async{

              await DB_helper.instnace.insertt({
                "${DB_helper.task_checking}":0,
                "${DB_helper.task_text}":task_text
              });
              print(await DB_helper.instnace.Query_all());
              Provider.of<List_data>(context, listen: false).add_to_list(task_text);
              if(Provider.of<List_data>(context, listen: false).tasks.length==0)
                {
                  id=1;
                }
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
