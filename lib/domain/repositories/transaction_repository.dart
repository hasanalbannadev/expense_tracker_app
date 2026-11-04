// ============================================================
// transaction_repository.dart  (Domain layer)
// Repository এর contract (abstract class)। Data layer এটা implement করবে।
// ============================================================
import '../entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<List<TransactionEntity>> getTransactions();
  Future<int> addTransaction(TransactionEntity transaction);
  Future<void> updateTransaction(TransactionEntity transaction);
  Future<void> deleteTransaction(int id);
  Future<void> clearAll();
}
