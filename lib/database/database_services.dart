import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:async';

class DatabaseServices {
  static final DatabaseServices instance = DatabaseServices._constructor();

  static Database? _db;
  final String _UserTableName = "User";
  final String _UserID = "ID";
  final String _UserName = "Name";
  final String _UserHeight = "Height";

  DatabaseServices._constructor();

  Future<Database?> get database async {
    if (_db != null)
      return _db;
    else {
      _db = await getDatabase();
    }
    return _db;
  }

  Future<Database?> getDatabase() async {
    print("demo getDatabase--");
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "masterDB.db");
    final Database database =
        await openDatabase(databasePath, version: 1, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE $_UserTableName($_UserID INTEGER PRIMARY KEY, $_UserName TEXT NOT NULL, $_UserHeight REAL)');
    });

    return database;
  }

  void addUser(String name) async {
    print("demo addUser--");
    final db = await database;
    print("demo addUser-- db $db");
    await db?.insert(
        _UserTableName, {_UserID: 0, _UserName: name, _UserHeight: 0.8});
  }
}
