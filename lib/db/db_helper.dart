import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import '../models/task.dart';

class DBHelper {
  // Properties
  Database? _db;
  final int _version = 1;
  final String _tableName = 'tasks';
  final String _usersTable = 'users';

  // Getter for database instance
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    } else {
      return _db;
    }
  }

  // Method to initialize database
  Future<Database?> initDb() async {
    try {
      final String path = '${await getDatabasesPath()}tasks.db';
      // Open database and create tables if they do not exist
      _db = await openDatabase(path, version: _version, onCreate: _onCreate);
    } catch (e) {
      // Handle any errors encountered during database initialization
      debugPrint('Error encountered ${e.toString()}');
    }
    return _db;
  }

  // Method to create tables
  Future<void> _onCreate(Database db, int version) async {
    // Create users table
    await db.execute('CREATE TABLE $_usersTable(id INTEGER PRIMARY KEY, email TEXT, password TEXT');
    // Create tasks table
    await db.execute(
        'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY,title TEXT,note TEXT,date TEXT,startTime TEXT,endTime TEXT,remind INTEGER,repeat TEXT,color INTEGER,isCompleted INTEGER);');
  }

  // Method to insert a new task into the tasks table
  Future<int> insert(Task? task) async {
    // Get database instance
    Database? appDB = await db;
    // Insert task into table
    return await appDB!.insert(_tableName, task!.toMap());
  }

  // Method to delete a task from the tasks table
  Future<int> delete(int id) async {
    // Get database instance
    Database? appDB = await db;
    // Delete task from table where id matches
    return await appDB!.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  // Method to delete all tasks from the tasks table
  Future<int> deleteAll() async {
    // Get database instance
    Database? appDB = await db;
    // Delete all tasks from table
    return await appDB!.delete(_tableName);
  }

  // Method to update a task in the tasks table
  Future<int> update(int id) async {
    // Get database instance
    Database? appDB = await db;
    // Update isCompleted flag for task where id matches
    return await appDB!.rawUpdate(
        'UPDATE $_tableName SET isCompleted = ? WHERE id = ?', [1, id]);
  }

  // Method to retrieve all tasks from the tasks table
  Future<List<Map<String, Object?>>> query() async {
    // Get database instance
    Database? appDB = await db;
    // Retrieve all tasks from table
    return await appDB!.query(_tableName);
  }
}
