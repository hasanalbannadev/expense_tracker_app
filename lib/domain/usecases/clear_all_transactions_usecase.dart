// ============================================================
// clear_all_transactions_usecase.dart
// ============================================================
import '../repositories/transaction_repository.dart';

class ClearAllTransactionsUseCase {
  const ClearAllTransactionsUseCase(this._repository);

  final TransactionRepository _repository;

  Future<void> call() => _repository.clearAllTransactions();
}
