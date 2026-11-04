// ============================================================
// calculate_summary_usecase.dart  (Domain layer)
// transaction এর তালিকা থেকে Total Income ও Total Expense হিসাব করে।
// Balance = Income - Expense (ExpenseSummary এ আছে)।
// ============================================================
import '../entities/expense_summary.dart';
import '../entities/transaction_entity.dart';

class CalculateSummaryUseCase {
  const CalculateSummaryUseCase();

  ExpenseSummary call(List<TransactionEntity> transactions) {
    double income = 0;
    double expense = 0;

    for (final transaction in transactions) {
      if (transaction.isIncome) {
        income += transaction.amount;
      } else {
        expense += transaction.amount;
      }
    }

    return ExpenseSummary(totalIncome: income, totalExpense: expense);
  }
}
