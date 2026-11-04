// ============================================================
// summary_providers.dart  (Presentation layer)
// Dashboard এর Total Income / Total Expense / Balance।
// transaction list বদলালে এটি অটোমেটিক নতুন করে হিসাব হয়।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/expense_summary.dart';
import '../../domain/entities/transaction_entity.dart';
import 'transaction_notifier.dart';
import 'transaction_providers.dart';

final summaryProvider = Provider<ExpenseSummary>((ref) {
  // লোড হওয়ার আগে খালি list ধরা হয় (সব 0 দেখাবে)
  final transactions =
      ref.watch(transactionListProvider).value ?? const <TransactionEntity>[];
  return ref.watch(calculateSummaryUseCaseProvider).call(transactions);
});
