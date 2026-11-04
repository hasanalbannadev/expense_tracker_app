// ============================================================
// transaction_model.dart  (Data layer)
// TransactionEntity কে extend করে। Database Map <-> Model রূপান্তর এখানে।
//
// Table: transactions
//   id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, amount REAL,
//   category TEXT, type TEXT, date TEXT
// ============================================================
import '../../domain/entities/transaction_entity.dart';
import '../../domain/entities/transaction_type.dart';

class TransactionModel extends TransactionEntity {
  const TransactionModel({
    super.id,
    required super.title,
    required super.amount,
    required super.category,
    required super.type,
    required super.date,
  });

  /// Domain entity থেকে Data model বানানো
  factory TransactionModel.fromEntity(TransactionEntity entity) {
    return TransactionModel(
      id: entity.id,
      title: entity.title,
      amount: entity.amount,
      category: entity.category,
      type: entity.type,
      date: entity.date,
    );
  }

  /// Database এর row (Map) থেকে model বানানো
  factory TransactionModel.fromMap(Map<String, Object?> map) {
    return TransactionModel(
      id: map['id'] as int,
      title: map['title'] as String,
      amount: (map['amount'] as num).toDouble(),
      category: map['category'] as String,
      type: TransactionType.fromName(map['type'] as String),
      date: DateTime.parse(map['date'] as String),
    );
  }

  /// Database এ লেখার জন্য Map। id null হলে AUTOINCREMENT নিজে বসাবে।
  Map<String, Object?> toMap() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'amount': amount,
      'category': category,
      'type': type.name, // "income" / "expense"
      'date': date.toIso8601String(), // TEXT হিসেবে সেভ হয়
    };
  }
}
