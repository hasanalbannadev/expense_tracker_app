// ============================================================
// transaction_by_id_provider.dart
// id দিয়ে একটি লেনদেন খোঁজে। Details স্ক্রিন এটি watch করে,
// তাই Edit করে ফিরে এলে নতুন তথ্য নিজে নিজে দেখায়।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/transaction_entity.dart';
import 'transactions_notifier.dart';

final transactionByIdProvider =
    Provider.family<TransactionEntity?, int>((ref, id) {
  final list =
      ref.watch(transactionsProvider).value ?? const <TransactionEntity>[];
  for (final transaction in list) {
    if (transaction.id == id) return transaction;
  }
  return null;
});
