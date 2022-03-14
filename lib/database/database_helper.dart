// ignore_for_file: avoid_print

import 'package:simply_tasking/model/task_data.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  static const int _version = 1;
  static const String _tableName = "tasks";

  static Future<void> initDatabase() async {
    if (_database != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + "tasks.db";
      _database = await openDatabase(_path, version: _version,
          onCreate: (database, version) {
        print("Creating a new database...");
        return database.execute(
          "CREATE TABLE $_tableName("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "title STRING, note TEXT, date STRING,"
          "isCompleted INTEGER)",
        );
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(TaskData? task) async {
    print("Inserting a new task...");
    return await _database?.insert(_tableName, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("Query function called.");
    return await _database!.query(_tableName);
  }
}
