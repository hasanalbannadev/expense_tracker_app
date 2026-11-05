// ============================================================
// transaction_repository.dart
// Repository এর "চুক্তি" (abstract class)। Domain লেয়ার শুধু এটাই চেনে।
// আসল কাজ data লেয়ারের TransactionRepositoryImpl এ হয়।
// ============================================================
import '../entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<List<TransactionEntity>> getAllTransactions();

  Future<int> addTransaction(TransactionEntity transaction);

  Future<void> updateTransaction(TransactionEntity transaction);

  Future<void> deleteTransaction(int id);

  Future<void> clearAllTransactions();
}
