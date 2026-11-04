// ============================================================
// stats_providers.dart  (Presentation layer)
// Statistics স্ক্রিন: "This Month" / "Last Month" এর income-expense হিসাব।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/date_formatter.dart';
import '../../domain/entities/expense_summary.dart';
import '../../domain/entities/transaction_entity.dart';
import 'transaction_notifier.dart';
import 'transaction_providers.dart';

enum StatsPeriod {
  thisMonth('This Month'),
  lastMonth('Last Month');

  final String label;
  const StatsPeriod(this.label);
}

class StatsPeriodNotifier extends Notifier<StatsPeriod> {
  @override
  StatsPeriod build() => StatsPeriod.thisMonth;

  void setPeriod(StatsPeriod period) => state = period;
}

final statsPeriodProvider = NotifierProvider<StatsPeriodNotifier, StatsPeriod>(
  StatsPeriodNotifier.new,
);

/// নির্বাচিত মাসের summary
final periodSummaryProvider = Provider<ExpenseSummary>((ref) {
  final period = ref.watch(statsPeriodProvider);
  final transactions =
      ref.watch(transactionListProvider).value ?? const <TransactionEntity>[];

  final now = DateTime.now();
  // month - 1 = 0 হলে Dart নিজে আগের বছরের ডিসেম্বর ধরে নেয়
  final target = period == StatsPeriod.thisMonth
      ? DateTime(now.year, now.month)
      : DateTime(now.year, now.month - 1);

  final filtered = transactions
      .where((t) => DateFormatter.isSameMonth(t.date, target))
      .toList();

  return ref.watch(calculateSummaryUseCaseProvider).call(filtered);
});
