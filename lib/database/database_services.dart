import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseServices{
  static final DatabaseServices instance = DatabaseServices._constructor();

  final String _UserTableName = "User";
  final String _UserID = "ID";
  final String _UserName = "Name";
  final String _UserHeight = "Height";

  DatabaseServices._constructor();

  Future<Database> getDatabase() async{
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "masterDB.db");
    final database = await openDatabase(
        databasePath,
      onCreate: (db,version){
          db.execute('CREATE TABLE $_UserTableName($_UserID INTEGER PRIMARY KEY, $_UserName TEXT NOT NULL, $_UserHeight REAL)');
      }
    );
  }
}