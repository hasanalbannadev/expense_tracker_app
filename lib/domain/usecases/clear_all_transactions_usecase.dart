// ============================================================
// clear_all_transactions_usecase.dart
// Profile স্ক্রিনের "Clear Data" এর জন্য: সব লেনদেন মুছে ফেলে।
// ============================================================
import '../repositories/transaction_repository.dart';

class ClearAllTransactionsUseCase {
  const ClearAllTransactionsUseCase(this._repository);

  final TransactionRepository _repository;

  Future<void> call() => _repository.clearAllTransactions();
}
