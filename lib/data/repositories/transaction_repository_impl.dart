// ============================================================
// transaction_repository_impl.dart
// ============================================================
import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction_local_datasource.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  const TransactionRepositoryImpl(this._dataSource);

  final TransactionLocalDataSource _dataSource;

  @override
  Future<List<TransactionEntity>> getAllTransactions() async {
    final models = await _dataSource.getAll();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<int> addTransaction(TransactionEntity transaction) {
    return _dataSource.insert(TransactionModel.fromEntity(transaction));
  }

  @override
  Future<void> updateTransaction(TransactionEntity transaction) async {
    await _dataSource.update(TransactionModel.fromEntity(transaction));
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await _dataSource.delete(id);
  }

  @override
  Future<void> clearAllTransactions() async {
    await _dataSource.deleteAll();
  }
}
