// ============================================================
// fake_transaction_repository.dart  (test helper)
// Test এ আসল SQLite এর বদলে মেমরির একটি নকল repository ব্যবহার হয়।
// ============================================================
import 'package:expense_tracker/domain/entities/transaction_entity.dart';
import 'package:expense_tracker/domain/repositories/transaction_repository.dart';

class FakeTransactionRepository implements TransactionRepository {
  final List<TransactionEntity> items = [];
  int _nextId = 1;

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    // নতুন আগে
    return List<TransactionEntity>.from(items.reversed);
  }

  @override
  Future<int> addTransaction(TransactionEntity transaction) async {
    final id = _nextId++;
    items.add(transaction.copyWith(id: id));
    return id;
  }

  @override
  Future<void> updateTransaction(TransactionEntity transaction) async {
    final index = items.indexWhere((t) => t.id == transaction.id);
    if (index != -1) items[index] = transaction;
  }

  @override
  Future<void> deleteTransaction(int id) async {
    items.removeWhere((t) => t.id == id);
  }

  @override
  Future<void> clearAll() async => items.clear();
}
