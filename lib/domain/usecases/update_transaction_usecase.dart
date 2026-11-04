// ============================================================
// update_transaction_usecase.dart  (Domain layer)
// আগের transaction এর তথ্য বদলানোর কাজ।
// ============================================================
import '../entities/transaction_entity.dart';
import '../repositories/transaction_repository.dart';

class UpdateTransactionUseCase {
  final TransactionRepository repository;

  const UpdateTransactionUseCase(this.repository);

  Future<void> call(TransactionEntity transaction) {
    return repository.updateTransaction(transaction);
  }
}
