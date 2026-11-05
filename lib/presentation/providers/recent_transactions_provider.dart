// ============================================================
// recent_transactions_provider.dart
// Dashboard এ দেখানোর জন্য সর্বশেষ কয়েকটি লেনদেন।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/entities/transaction_entity.dart';
import 'transactions_notifier.dart';

final recentTransactionsProvider = Provider<List<TransactionEntity>>((ref) {
  final list =
      ref.watch(transactionsProvider).value ?? const <TransactionEntity>[];
  return list.take(AppConstants.recentTransactionLimit).toList();
});
