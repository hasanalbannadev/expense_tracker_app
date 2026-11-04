// ============================================================
// transaction_local_datasource.dart  (Data layer)
// transactions table এ সরাসরি CRUD (Create, Read, Update, Delete)।
// ============================================================
import '../../core/constants/app_constants.dart';
import '../models/transaction_model.dart';
import 'app_database.dart';

class TransactionLocalDataSource {
  final AppDatabase appDatabase;

  const TransactionLocalDataSource(this.appDatabase);

  /// সব transaction: নতুন তারিখ আগে, একই তারিখে নতুন id আগে
  Future<List<TransactionModel>> getTransactions() async {
    final db = await appDatabase.database;
    final rows = await db.query(
      AppConstants.tableName,
      orderBy: 'date DESC, id DESC',
    );
    return rows.map(TransactionModel.fromMap).toList();
  }

  /// নতুন row যোগ করে, নতুন id ফেরত দেয়
  Future<int> insert(TransactionModel model) async {
    final db = await appDatabase.database;
    return db.insert(AppConstants.tableName, model.toMap());
  }

  /// id অনুযায়ী row আপডেট
  Future<void> update(TransactionModel model) async {
    final db = await appDatabase.database;
    await db.update(
      AppConstants.tableName,
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  /// id অনুযায়ী row মুছে ফেলা
  Future<void> delete(int id) async {
    final db = await appDatabase.database;
    await db.delete(AppConstants.tableName, where: 'id = ?', whereArgs: [id]);
  }

  /// table এর সব row মুছে ফেলা
  Future<void> deleteAll() async {
    final db = await appDatabase.database;
    await db.delete(AppConstants.tableName);
  }
}
