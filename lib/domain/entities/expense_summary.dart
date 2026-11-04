// ============================================================
// expense_summary.dart  (Domain layer)
// Dashboard এর তিনটি মান: Total Income, Total Expense, Current Balance
// ============================================================
class ExpenseSummary {
  final double totalIncome;
  final double totalExpense;

  const ExpenseSummary({
    required this.totalIncome,
    required this.totalExpense,
  });

  static const ExpenseSummary empty = ExpenseSummary(
    totalIncome: 0,
    totalExpense: 0,
  );

  /// Current Balance = Income - Expense
  double get balance => totalIncome - totalExpense;
}
