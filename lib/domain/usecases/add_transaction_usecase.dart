// ============================================================
// add_transaction_usecase.dart
// ============================================================
import '../entities/transaction_entity.dart';
import '../repositories/transaction_repository.dart';

class AddTransactionUseCase {
  const AddTransactionUseCase(this._repository);

  final TransactionRepository _repository;

  Future<int> call(TransactionEntity transaction) {
    return _repository.addTransaction(transaction);
  }
}
