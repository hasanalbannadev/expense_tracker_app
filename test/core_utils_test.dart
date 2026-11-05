// ============================================================
// Validator, Formatter ও ChartAxis এর test
// ============================================================
import 'package:expense_tracker/core/utils/chart_axis.dart';
import 'package:expense_tracker/core/utils/currency_formatter.dart';
import 'package:expense_tracker/core/utils/validators.dart';
import 'package:expense_tracker/domain/entities/transaction_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validators', () {
    test('title cannot be empty', () {
      expect(Validators.title(''), isNotNull);
      expect(Validators.title('   '), isNotNull);
      expect(Validators.title('Food'), isNull);
    });

    test('amount must be valid positive number', () {
      expect(Validators.amount(''), isNotNull);
      expect(Validators.amount('abc'), isNotNull);
      expect(Validators.amount('0'), isNotNull);
      expect(Validators.amount('-5'), isNotNull);
      expect(Validators.amount('NaN'), isNotNull);
      expect(Validators.amount('1,200.50'), isNull);
      expect(Validators.amount('2500'), isNull);
    });

    test('category and type must be selected', () {
      expect(Validators.category(null), isNotNull);
      expect(Validators.category('Food'), isNull);
      expect(Validators.type(null), isNotNull);
      expect(Validators.type(TransactionType.income), isNull);
    });
  });

  group('CurrencyFormatter', () {
    test('formats whole and decimal amounts', () {
      expect(CurrencyFormatter.format(50000), '৳50,000');
      expect(CurrencyFormatter.format(99.5), '৳99.50');
      expect(CurrencyFormatter.format(-500), '-৳500');
    });
  });

  group('ChartAxis', () {
    test('rounds max to a nice number', () {
      final axis = ChartAxis.fromMax(3500);
      expect(axis.step, 1000);
      expect(axis.maxValue, 4000);
    });

    test('empty data falls back to default axis', () {
      expect(ChartAxis.fromMax(0).maxValue, 4000);
    });
  });
}
