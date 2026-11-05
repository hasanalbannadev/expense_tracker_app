// ============================================================
// transaction_local_datasource.dart
// সরাসরি Sqflite এর সাথে কথা বলে (CRUD query এখানেই)।
// ============================================================
import 'package:sqflite/sqflite.dart';

import '../../core/constants/db_constants.dart';
import '../../core/database/database_helper.dart';
import '../models/transaction_model.dart';

class TransactionLocalDataSource {
  const TransactionLocalDataSource(this._dbHelper);

  final DatabaseHelper _dbHelper;

  /// সব লেনদেন: তারিখ অনুযায়ী নতুন আগে
  Future<List<TransactionModel>> getAll() async {
    final db = await _dbHelper.database;
    final rows = await db.query(
      DbConstants.tableTransactions,
      orderBy: '${DbConstants.colDate} DESC, ${DbConstants.colId} DESC',
    );
    return rows.map(TransactionModel.fromMap).toList();
  }

  Future<int> insert(TransactionModel model) async {
    final db = await _dbHelper.database;
    return db.insert(
      DbConstants.tableTransactions,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> update(TransactionModel model) async {
    final db = await _dbHelper.database;
    return db.update(
      DbConstants.tableTransactions,
      model.toMap(),
      where: '${DbConstants.colId} = ?',
      whereArgs: [model.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await _dbHelper.database;
    return db.delete(
      DbConstants.tableTransactions,
      where: '${DbConstants.colId} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAll() async {
    final db = await _dbHelper.database;
    return db.delete(DbConstants.tableTransactions);
  }
}
