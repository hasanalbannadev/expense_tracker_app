// ============================================================
// clear_all_transactions_usecase.dart  (Domain layer)
// সব transaction একসাথে মুছে ফেলা (Profile > Clear Data)।
// ============================================================
import '../repositories/transaction_repository.dart';

class ClearAllTransactionsUseCase {
  final TransactionRepository repository;

  const ClearAllTransactionsUseCase(this.repository);

  Future<void> call() => repository.clearAll();
}
