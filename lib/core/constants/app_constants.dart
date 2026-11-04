// ============================================================
// app_constants.dart
// অ্যাপের সব fixed মান (নাম, টাকার চিহ্ন, database এর নাম) এক জায়গায়।
// ============================================================
class AppConstants {
  AppConstants._(); // object বানানো যাবে না

  static const String appName = 'Expense Tracker';
  static const String currencySymbol = '৳';
  static const String profileName = 'Hasan Al Banna';
  static const String appVersion = '1.0.0';

  // ---- Database (Assignment: expense_tracker.db / transactions) ----
  static const String dbName = 'expense_tracker.db';
  static const String tableName = 'transactions';
  static const int dbVersion = 1;

  /// Dashboard এ সর্বশেষ কয়টি transaction দেখাবে
  static const int recentLimit = 4;
}
