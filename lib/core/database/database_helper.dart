// ============================================================
// database_helper.dart
// Sqflite ডাটাবেস খোলা ও টেবিল তৈরির কাজ এখানে।
// Singleton: পুরো অ্যাপে একটাই ডাটাবেস কানেকশন ব্যবহার হয়।
// অ্যাপ বন্ধ করে আবার খুললেও ডাটা থাকবে, কারণ ডাটা ফাইলে সেভ হয়।
// ============================================================
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/db_constants.dart';

class DatabaseHelper {
  DatabaseHelper._internal();

  static final DatabaseHelper instance = DatabaseHelper._internal();

  // Future রাখা হয়েছে যাতে একসাথে দুইবার ডাটাবেস না খোলে
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

  // প্রথমবার ডাটাবেস তৈরির সময় টেবিল বানানো হয়
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
