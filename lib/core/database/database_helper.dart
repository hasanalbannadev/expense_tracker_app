// ============================================================
// database_helper.dart
// ============================================================
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/db_constants.dart';

class DatabaseHelper {
  DatabaseHelper._internal();

  static final DatabaseHelper instance = DatabaseHelper._internal();

  Future<Database>? _databaseFuture;

  Future<Database> get database => _databaseFuture ??= _open();

  Future<Database> _open() async {
    final dbFolder = await getDatabasesPath();
    final dbPath = join(dbFolder, DbConstants.dbName);

    return openDatabase(
      dbPath,
      version: DbConstants.dbVersion,
      onCreate: _onCreate,
    );
  }


  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${DbConstants.tableTransactions} (
        ${DbConstants.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${DbConstants.colTitle} TEXT NOT NULL,
        ${DbConstants.colAmount} REAL NOT NULL,
        ${DbConstants.colCategory} TEXT NOT NULL,
        ${DbConstants.colType} TEXT NOT NULL,
        ${DbConstants.colDate} TEXT NOT NULL
      )
    ''');
  }
}
