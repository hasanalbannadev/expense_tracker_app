// ============================================================
// statistics_provider.dart
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/transaction_entity.dart';
import '../../domain/entities/transaction_summary.dart';
import 'transactions_notifier.dart';
import 'usecase_providers.dart';

enum StatsPeriod { thisMonth, lastMonth }

class StatsPeriodNotifier extends Notifier<StatsPeriod> {
  @override
  StatsPeriod build() => StatsPeriod.thisMonth;

  void select(StatsPeriod period) => state = period;
}

final statsPeriodProvider =
    NotifierProvider<StatsPeriodNotifier, StatsPeriod>(StatsPeriodNotifier.new);

final monthlyStatsProvider = Provider<TransactionSummary>((ref) {
  final all =
      ref.watch(transactionsProvider).value ?? const <TransactionEntity>[];
  final period = ref.watch(statsPeriodProvider);

  final now = DateTime.now();
  // DateTime(year, 0) নিজে আগের বছরের ডিসেম্বর ধরে নেয়
  final month = period == StatsPeriod.thisMonth
      ? DateTime(now.year, now.month)
      : DateTime(now.year, now.month - 1);

  final monthly = ref.read(getMonthlyTransactionsUseCaseProvider).call(all, month);
  return ref.read(calculateSummaryUseCaseProvider).call(monthly);
});
