// ============================================================
// utils_test.dart
// Validators, CurrencyFormatter, ChartScale ও summary হিসাবের unit test।
// চালাতে: flutter test
// ============================================================
import 'package:expense_tracker/core/utils/chart_scale.dart';
import 'package:expense_tracker/core/utils/currency_formatter.dart';
import 'package:expense_tracker/core/utils/validators.dart';
import 'package:expense_tracker/domain/entities/transaction_entity.dart';
import 'package:expense_tracker/domain/entities/transaction_type.dart';
import 'package:expense_tracker/domain/usecases/calculate_summary_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validators', () {
    test('title cannot be empty', () {
      expect(Validators.title(''), isNotNull);
      expect(Validators.title('   '), isNotNull);
      expect(Validators.title('Lunch'), isNull);
    });

    test('amount must be a valid positive number', () {
      expect(Validators.amount(''), isNotNull);
      expect(Validators.amount('abc'), isNotNull);
      expect(Validators.amount('0'), isNotNull);
      expect(Validators.amount('-5'), isNotNull);
      expect(Validators.amount('250'), isNull);
      expect(Validators.amount('99.5'), isNull);
    });

    test('category and type must be selected', () {
      expect(Validators.category(null), isNotNull);
      expect(Validators.category('Food'), isNull);
      expect(Validators.type(null), isNotNull);
      expect(Validators.type(TransactionType.income), isNull);
    });
  });

  group('CurrencyFormatter', () {
    test('formats with comma and symbol', () {
      expect(CurrencyFormatter.format(50000), '৳50,000');
      expect(CurrencyFormatter.format(800), '৳800');
      expect(CurrencyFormatter.format(99.5), '৳99.50');
      expect(CurrencyFormatter.format(-500), '-৳500');
    });
  });

  group('ChartScale', () {
    test('creates nice axis values', () {
      final scale = ChartScale.from(3500);
      expect(scale.max, 4000);
      expect(scale.step, 1000);
      expect(ChartScale.label(4000), '4k');
      expect(ChartScale.label(500), '500');
    });

    test('handles zero', () {
      expect(ChartScale.from(0).max, 4000);
    });
  });

  group('CalculateSummaryUseCase', () {
    test('calculates income, expense and balance', () {
      final transactions = [
        TransactionEntity(
          id: 1,
          title: 'Salary',
          amount: 50000,
          category: 'Salary',
          type: TransactionType.income,
          date: DateTime(2025, 6, 16),
        ),
        TransactionEntity(
          id: 2,
          title: 'Food',
          amount: 800,
          category: 'Food',
          type: TransactionType.expense,
          date: DateTime(2025, 6, 14),
        ),
      ];

      final summary = const CalculateSummaryUseCase().call(transactions);

      expect(summary.totalIncome, 50000);
      expect(summary.totalExpense, 800);
      expect(summary.balance, 49200);
    });
  });
}
