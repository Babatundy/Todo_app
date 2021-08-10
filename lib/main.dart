import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/tasks_list.dart';
import 'first_screen.dart';
import 'models/tasks_list.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "main_screen",
      routes: {
        "main_screen": (context) => Main_screen(),
      },
    ),
  );
}
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>data())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  int counter = 50;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>data(),
      builder: (context,child){
        return Scaffold(
          appBar: AppBar(
            title: Text("zeez"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${Provider.of<data>(context).counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Provider.of<data>(context,listen: false).increment(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class data with ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}*/
