// ============================================================
// transaction_model.dart
// ============================================================
import '../../core/constants/db_constants.dart';
import '../../core/utils/date_formatter.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/entities/transaction_type.dart';

class TransactionModel {
  const TransactionModel({
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
  final String type;
  final String date;

  /// database row (Map) from model
  factory TransactionModel.fromMap(Map<String, Object?> map) {
    return TransactionModel(
      id: map[DbConstants.colId] as int?,
      title: map[DbConstants.colTitle] as String,
      amount: (map[DbConstants.colAmount] as num).toDouble(),
      category: map[DbConstants.colCategory] as String,
      type: map[DbConstants.colType] as String,
      date: map[DbConstants.colDate] as String,
    );
  }

  /// Entity from model
  factory TransactionModel.fromEntity(TransactionEntity entity) {
    return TransactionModel(
      id: entity.id,
      title: entity.title,
      amount: entity.amount,
      category: entity.category,
      type: entity.type.value,
      date: DateFormatter.toStorage(entity.date),
    );
  }

  /// database display Map। if new  id  (AUTOINCREMENT)।
  Map<String, Object?> toMap() {
    return {
      if (id != null) DbConstants.colId: id,
      DbConstants.colTitle: title,
      DbConstants.colAmount: amount,
      DbConstants.colCategory: category,
      DbConstants.colType: type,
      DbConstants.colDate: date,
    };
  }

  TransactionEntity toEntity() {
    return TransactionEntity(
      id: id,
      title: title,
      amount: amount,
      category: category,
      type: TransactionType.fromValue(type),
      date: DateFormatter.fromStorage(date),
    );
  }
}
