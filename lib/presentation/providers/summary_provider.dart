// ============================================================
// summary_provider.dart
// Dashboard card (Income / Expense / Balance)।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/transaction_entity.dart';
import '../../domain/entities/transaction_summary.dart';
import 'transactions_notifier.dart';
import 'usecase_providers.dart';

final summaryProvider = Provider<TransactionSummary>((ref) {
  final list =
      ref.watch(transactionsProvider).value ?? const <TransactionEntity>[];
  return ref.read(calculateSummaryUseCaseProvider).call(list);
});
