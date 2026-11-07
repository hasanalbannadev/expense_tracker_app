// ============================================================
// transaction_summary.dart

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

  /// present balance = income - cost
  double get balance => totalIncome - totalExpense;
}
