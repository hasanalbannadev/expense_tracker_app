// ============================================================
// delete_transaction_usecase.dart
// ============================================================
import '../repositories/transaction_repository.dart';

class DeleteTransactionUseCase {
  const DeleteTransactionUseCase(this._repository);

  final TransactionRepository _repository;

  Future<void> call(int id) => _repository.deleteTransaction(id);
}
