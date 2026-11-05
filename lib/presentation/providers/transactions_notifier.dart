// ============================================================
// transactions_notifier.dart
// অ্যাপের মূল state: সব লেনদেনের তালিকা (AsyncNotifier)।
// প্রতিটি add/update/delete এর পর ডাটাবেস থেকে নতুন তালিকা এনে state বদলায়,
// ফলে Dashboard, List, Statistics সব নিজে নিজে আপডেট হয়।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/transaction_entity.dart';
import 'usecase_providers.dart';

class TransactionsNotifier extends AsyncNotifier<List<TransactionEntity>> {
  /// অ্যাপ চালু হলে ডাটাবেস থেকে প্রথমবার লোড
  @override
  Future<List<TransactionEntity>> build() {
    return ref.read(getTransactionsUseCaseProvider).call();
  }

  Future<void> addTransaction(TransactionEntity transaction) async {
    await ref.read(addTransactionUseCaseProvider).call(transaction);
    await _reload();
  }

  Future<void> updateTransaction(TransactionEntity transaction) async {
    await ref.read(updateTransactionUseCaseProvider).call(transaction);
    await _reload();
  }

  Future<void> deleteTransaction(int id) async {
    await ref.read(deleteTransactionUseCaseProvider).call(id);
    await _reload();
  }

  Future<void> clearAll() async {
    await ref.read(clearAllTransactionsUseCaseProvider).call();
    await _reload();
  }

  // ডাটাবেস থেকে নতুন তালিকা এনে state সেট
  Future<void> _reload() async {
    final list = await ref.read(getTransactionsUseCaseProvider).call();
    state = AsyncData(list);
  }
}

final transactionsProvider =
    AsyncNotifierProvider<TransactionsNotifier, List<TransactionEntity>>(
  TransactionsNotifier.new,
);
