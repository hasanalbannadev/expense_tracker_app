// ============================================================
// transaction_summary.dart
// মোট আয়, মোট খরচ ও বর্তমান ব্যালেন্স। Dashboard ও Statistics এ ব্যবহার হয়।
// ============================================================
class TransactionSummary {
  const TransactionSummary({
    required this.totalIncome,
    required this.totalExpense,
  });

  static const TransactionSummary empty =
      TransactionSummary(totalIncome: 0, totalExpense: 0);

  final double totalIncome;
  final double totalExpense;

  /// বর্তমান ব্যালেন্স = আয় - খরচ
  double get balance => totalIncome - totalExpense;
}
