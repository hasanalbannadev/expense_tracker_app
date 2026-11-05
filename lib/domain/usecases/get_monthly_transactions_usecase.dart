// ============================================================
// get_monthly_transactions_usecase.dart
// নির্দিষ্ট মাসের লেনদেন ফিল্টার করে (Statistics: This Month / Last Month)।
// ============================================================
import '../entities/transaction_entity.dart';

class GetMonthlyTransactionsUseCase {
  const GetMonthlyTransactionsUseCase();

  List<TransactionEntity> call(List<TransactionEntity> all, DateTime month) {
    return all
        .where((t) => t.date.year == month.year && t.date.month == month.month)
        .toList();
  }
}
