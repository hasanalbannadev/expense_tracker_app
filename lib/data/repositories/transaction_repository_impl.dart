// ============================================================
// transaction_repository_impl.dart  (Data layer)
// Domain এর TransactionRepository contract টি এখানে implement করা হয়েছে।
// ============================================================
import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction_local_datasource.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionLocalDataSource dataSource;

  const TransactionRepositoryImpl(this.dataSource);

  @override
  Future<List<TransactionEntity>> getTransactions() {
    return dataSource.getTransactions();
  }

  @override
  Future<int> addTransaction(TransactionEntity transaction) {
    return dataSource.insert(TransactionModel.fromEntity(transaction));
  }

  @override
  Future<void> updateTransaction(TransactionEntity transaction) {
    return dataSource.update(TransactionModel.fromEntity(transaction));
  }

  @override
  Future<void> deleteTransaction(int id) => dataSource.delete(id);

  @override
  Future<void> clearAll() => dataSource.deleteAll();
}
