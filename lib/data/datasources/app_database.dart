// ============================================================
// app_database.dart  (Data layer)
// Sqflite database খোলা ও table বানানো।
//   Database name : expense_tracker.db
//   Table name    : transactions
// অ্যাপ বন্ধ করে খুললেও ডাটা থেকে যায় (ফোনের storage এ থাকে)।
// ============================================================
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../core/constants/app_constants.dart';

class AppDatabase {
  // একবারই database খোলা হবে (পরের বার একই Future ব্যবহার হবে)
  Future<Database>? _database;

  Future<Database> get database => _database ??= _open();

  Future<Database> _open() async {
    final dbFolder = await getDatabasesPath();
    final path = join(dbFolder, AppConstants.dbName);

    return openDatabase(
      path,
      version: AppConstants.dbVersion,
      onCreate: (db, version) async {
        // table প্রথমবার বানানো হয়
        await db.execute('''
          CREATE TABLE ${AppConstants.tableName} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            amount REAL NOT NULL,
            category TEXT NOT NULL,
            type TEXT NOT NULL,
            date TEXT NOT NULL
          )
        ''');
      },
    );
  }
}
