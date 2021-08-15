import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class DB_helper {
  static const task_id = "id";
  static const task_text = "text";
  static const task_checking = "checking";
  static final DB_helper instnace = new DB_helper.internal();

  //factory DB_helper() => instnace;

  DB_helper.internal();

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await creat();
      return _db;
    }
  }

  creat() async {
    var direcroty = await getApplicationDocumentsDirectory();
    String path = join(direcroty.path, "main_db.db");
    var my_db = await openDatabase(path, version: 1, onCreate: oncreate);
  }

  oncreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE Tasks("
      "$task_id INTEGER PRIMARY KEY"
      "$task_checking INTEGER"
      "$task_text TEXT"
      ")",
    );
  }
  Future<int> insertt(Map<String, dynamic> row) async {
    Database dbb = await DB_helper.instnace.db;

    return await dbb.insert("Tasks", row);
  }

  Future<List<Map<String, dynamic>>> Query_all() async {
    Database db = await DB_helper.instnace.db;
    return await db.query("data");
  }

  Future update(Map<String, dynamic> row) async {
    Database db = await DB_helper.instnace.db;
  }
}



////////////////////////////////////////////////////
/*
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Db_helper {
  static final Db_helper instance = Db_helper.named();

  Db_helper.named();

  static final db_name = "data";
  static int id;
  static int age;
  static String name;

  static Database database;

  Future<Database> get db async {
    if (database != null) {
      return database;
    } else {
      database = await creat_db();
      return database;
    }
  }

  creat_db() async {
    String path = await getDatabasesPath();
    String final_path = join(path, "ast.db");
    print(final_path);
    return await openDatabase(final_path, version: 1, onCreate: oncreate);
  }

  oncreate(Database db, int version) async {
    await db.execute('''
     CREATE TABLE data(
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     name TEXT,
     age INTEGER
     )
     ''');
  }


}

*/