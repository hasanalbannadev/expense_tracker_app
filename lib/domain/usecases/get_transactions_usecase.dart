// ============================================================
// get_transactions_usecase.dart
// সব লেনদেন ডাটাবেস থেকে আনার use case (নতুন আগে)।
// ============================================================
import '../entities/transaction_entity.dart';
import '../repositories/transaction_repository.dart';

class GetTransactionsUseCase {
  const GetTransactionsUseCase(this._repository);

  final TransactionRepository _repository;

  Future<List<TransactionEntity>> call() => _repository.getAllTransactions();
}
