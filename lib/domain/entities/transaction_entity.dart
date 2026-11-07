// ============================================================
// transaction_entity.dart
// ============================================================
import 'transaction_type.dart';

class TransactionEntity {
  const TransactionEntity({
    this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.type,
    required this.date,
  });

  final int? id;
  final String title;
  final double amount;
  final String category;
  final TransactionType type;
  final DateTime date;

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

  @override
  bool operator ==(Object other) {
    return other is TransactionEntity &&
        other.id == id &&
        other.title == title &&
        other.amount == amount &&
        other.category == category &&
        other.type == type &&
        other.date == date;
  }

  @override
  int get hashCode => Object.hash(id, title, amount, category, type, date);
}
