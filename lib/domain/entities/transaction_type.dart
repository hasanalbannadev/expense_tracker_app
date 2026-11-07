// ============================================================
// transaction_type.dart
// ============================================================
enum TransactionType {
  income,
  expense;

  /// database save
  String get value => name;

  /// UI to display
  String get label => this == TransactionType.income ? 'Income' : 'Expense';

  bool get isIncome => this == TransactionType.income;

  /// database text enum create
  static TransactionType fromValue(String value) {
    return TransactionType.values.firstWhere(
      (type) => type.name == value.toLowerCase(),
      orElse: () => TransactionType.expense,
    );
  }
}
