import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Task extends StatelessWidget {
  String text;
  bool valuee = false;
 Function callback;
  Task({this.text,this.callback});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>changes(),
      builder: (context,child){
        return Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          color: Colors.cyan,
          child: Row(
            children: [
              Checkbox(
                value: Provider.of<changes>(context).fuck,
                onChanged: (b){
                  Provider.of<changes>(context,listen: false).done(b);
                },
              ),
              Text(text)
            ],
          ),
        );
      },

    );
  }
}
class changes with ChangeNotifier{
  bool fuck=false;
  void done(bool value){
    print(fuck);
    fuck=value;
    notifyListeners();
  }
}
