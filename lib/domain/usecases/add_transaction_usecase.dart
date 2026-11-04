// ============================================================
// add_transaction_usecase.dart  (Domain layer)
// নতুন transaction যোগ করার কাজ।
// ============================================================
import '../entities/transaction_entity.dart';
import '../repositories/transaction_repository.dart';

class AddTransactionUseCase {
  final TransactionRepository repository;

  const AddTransactionUseCase(this.repository);

  Future<int> call(TransactionEntity transaction) {
    return repository.addTransaction(transaction);
  }
}
