// ============================================================
// calculate_summary_usecase.dart
// লেনদেনের তালিকা থেকে মোট আয়, মোট খরচ ও ব্যালেন্স হিসাব করে।
// Add/Edit/Delete এর পর তালিকা বদলালেই এটি নতুন করে হিসাব করে (dynamic)।
// ============================================================
import '../entities/transaction_entity.dart';
import '../entities/transaction_summary.dart';

class CalculateSummaryUseCase {
  const CalculateSummaryUseCase();

  TransactionSummary call(List<TransactionEntity> transactions) {
    var income = 0.0;
    var expense = 0.0;

    for (final transaction in transactions) {
      if (transaction.type.isIncome) {
        income += transaction.amount;
      } else {
        expense += transaction.amount;
      }
    }

    return TransactionSummary(totalIncome: income, totalExpense: expense);
  }
}
