// ============================================================
// update_transaction_usecase.dart
// ============================================================
import '../entities/transaction_entity.dart';
import '../repositories/transaction_repository.dart';

class UpdateTransactionUseCase {
  const UpdateTransactionUseCase(this._repository);

  final TransactionRepository _repository;

  Future<void> call(TransactionEntity transaction) {
    if (transaction.id == null) {
      throw ArgumentError('Transaction id is required for update');
    }
    return _repository.updateTransaction(transaction);
  }
}
