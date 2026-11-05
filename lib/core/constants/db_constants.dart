// ============================================================
// db_constants.dart
// Assignment অনুযায়ী ডাটাবেস ও টেবিলের নাম + কলামের নাম।
// নামগুলো এক জায়গায় থাকলে বানান ভুলের সম্ভাবনা থাকে না।
// ============================================================
class DbConstants {
  DbConstants._();

  static const String dbName = 'expense_tracker.db';
  static const int dbVersion = 1;

  static const String tableTransactions = 'transactions';

  static const String colId = 'id';
  static const String colTitle = 'title';
  static const String colAmount = 'amount';
  static const String colCategory = 'category';
  static const String colType = 'type';
  static const String colDate = 'date';
}
