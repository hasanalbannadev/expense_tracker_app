// ============================================================
// Entity <-> Model <-> Map রূপান্তরের test
// ============================================================
import 'package:expense_tracker/data/models/transaction_model.dart';
import 'package:expense_tracker/domain/entities/transaction_entity.dart';
import 'package:expense_tracker/domain/entities/transaction_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final entity = TransactionEntity(
    id: 1,
    title: 'Shopping',
    amount: 2500,
    category: 'Shopping',
    type: TransactionType.expense,
    date: DateTime(2025, 6, 13),
  );

  test('entity -> model -> map -> model -> entity keeps all data', () {
    final map = TransactionModel.fromEntity(entity).toMap();

    expect(map['type'], 'expense');
    expect(map['amount'], 2500.0);

    final restored = TransactionModel.fromMap(map).toEntity();
    expect(restored, entity);
  });

  test('new transaction map has no id', () {
    final fresh = TransactionEntity(
      title: 'Food',
      amount: 800,
      category: 'Food',
      type: TransactionType.expense,
      date: DateTime(2025, 6, 14),
    );
    final map = TransactionModel.fromEntity(fresh).toMap();
    expect(map.containsKey('id'), isFalse);
  });
}
