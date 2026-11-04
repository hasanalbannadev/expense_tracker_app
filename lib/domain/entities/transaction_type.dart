// ============================================================
// transaction_type.dart  (Domain layer)
// Transaction এর ধরন: Income অথবা Expense
// ============================================================
enum TransactionType {
  income('Income'),
  expense('Expense');

  final String label; // UI তে দেখানোর নাম
  const TransactionType(this.label);

  /// Database এর TEXT ("income"/"expense") থেকে enum বানানো
  static TransactionType fromName(String name) {
    return TransactionType.values.firstWhere(
      (type) => type.name == name,
      orElse: () => TransactionType.expense,
    );
  }
}
