// ============================================================
// transaction_type.dart
// লেনদেনের ধরন: Income (আয়) অথবা Expense (খরচ)।
// ডাটাবেসে "income" / "expense" টেক্সট হিসেবে সেভ হয়।
// ============================================================
enum TransactionType {
  income,
  expense;

  /// ডাটাবেসে সেভ করার মান
  String get value => name;

  /// UI তে দেখানোর নাম
  String get label => this == TransactionType.income ? 'Income' : 'Expense';

  bool get isIncome => this == TransactionType.income;

  /// ডাটাবেসের টেক্সট থেকে enum বানানো
  static TransactionType fromValue(String value) {
    return TransactionType.values.firstWhere(
      (type) => type.name == value.toLowerCase(),
      orElse: () => TransactionType.expense,
    );
  }
}
