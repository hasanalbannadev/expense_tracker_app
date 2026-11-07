// ============================================================
// transaction_repository.dart
// ============================================================
import '../entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<List<TransactionEntity>> getAllTransactions();

  Future<int> addTransaction(TransactionEntity transaction);

  Future<void> updateTransaction(TransactionEntity transaction);

  Future<void> deleteTransaction(int id);

  Future<void> clearAllTransactions();
}
