import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseServices{
  static final DatabaseServices instance = DatabaseServices._constructor();

  DatabaseServices._constructor();

  Future<Database> getDatabase() async{
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "masterDB.db");
    final database = await openDatabase(
        databasePath,
    );
  }
}