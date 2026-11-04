// ============================================================
// delete_transaction_usecase.dart  (Domain layer)
// id দিয়ে একটি transaction মুছে ফেলার কাজ।
// ============================================================
import '../repositories/transaction_repository.dart';

class DeleteTransactionUseCase {
  final TransactionRepository repository;

  const DeleteTransactionUseCase(this.repository);

  Future<void> call(int id) => repository.deleteTransaction(id);
}
