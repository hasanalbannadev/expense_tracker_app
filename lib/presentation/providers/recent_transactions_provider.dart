// ============================================================
// recent_transactions_provider.dart  (Presentation layer)
// Dashboard এর "Recent Transactions" - সর্বশেষ কয়েকটি transaction।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/entities/transaction_entity.dart';
import 'transaction_notifier.dart';

final recentTransactionsProvider = Provider<List<TransactionEntity>>((ref) {
  final transactions =
      ref.watch(transactionListProvider).value ?? const <TransactionEntity>[];
  return transactions.take(AppConstants.recentLimit).toList();
});
