// ============================================================
// transaction_entity.dart  (Domain layer)
// একটি transaction এর মূল ডাটা। কোনো Flutter/Package এর উপর নির্ভর করে না।
// id null থাকলে বুঝতে হবে এটি এখনো database এ সেভ হয়নি।
// ============================================================
import 'transaction_type.dart';

class TransactionEntity {
  final int? id;
  final String title;
  final double amount;
  final String category;
  final TransactionType type;
  final DateTime date;

  const TransactionEntity({
    this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.type,
    required this.date,
  });

  bool get isIncome => type == TransactionType.income;

  TransactionEntity copyWith({
    int? id,
    String? title,
    double? amount,
    String? category,
    TransactionType? type,
    DateTime? date,
  }) {
    return TransactionEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      type: type ?? this.type,
      date: date ?? this.date,
    );
  }
}
