// ============================================================
// Income / Expense / Balance হিসাবের unit test
// ============================================================
import 'package:expense_tracker/domain/entities/transaction_entity.dart';
import 'package:expense_tracker/domain/entities/transaction_type.dart';
import 'package:expense_tracker/domain/usecases/calculate_summary_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const useCase = CalculateSummaryUseCase();

  TransactionEntity make(double amount, TransactionType type) {
    return TransactionEntity(
      title: 't',
      amount: amount,
      category: 'Other',
      type: type,
      date: DateTime(2025, 6, 13),
    );
  }

  test('empty list gives zero summary', () {
    final summary = useCase.call(const []);
    expect(summary.totalIncome, 0);
    expect(summary.totalExpense, 0);
    expect(summary.balance, 0);
  });

  test('calculates income, expense and balance', () {
    final summary = useCase.call([
      make(50000, TransactionType.income),
      make(800, TransactionType.expense),
      make(2500, TransactionType.expense),
      make(1000, TransactionType.expense),
    ]);
    expect(summary.totalIncome, 50000);
    expect(summary.totalExpense, 4300);
    expect(summary.balance, 45700);
  });
}
