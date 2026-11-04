// ============================================================
// transaction_notifier.dart  (Presentation layer)
// সব transaction এর state এখানে থাকে (database থেকে async লোড হয়)।
// add / update / delete করলে database বদলায় এবং তারপর list নতুন করে লোড হয়,
// ফলে Dashboard, List, Statistics সব স্ক্রিন নিজে নিজেই update হয়।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/transaction_entity.dart';
import 'transaction_providers.dart';

class TransactionNotifier extends AsyncNotifier<List<TransactionEntity>> {
  @override
  Future<List<TransactionEntity>> build() => _load();

  /// database থেকে সর্বশেষ তালিকা আনা
  Future<List<TransactionEntity>> _load() {
    return ref.read(getTransactionsUseCaseProvider).call();
  }

  /// নতুন transaction সেভ করা
  Future<void> addTransaction(TransactionEntity transaction) async {
    await ref.read(addTransactionUseCaseProvider).call(transaction);
    state = AsyncData(await _load());
  }

  /// আগের transaction আপডেট করা
  Future<void> updateTransaction(TransactionEntity transaction) async {
    await ref.read(updateTransactionUseCaseProvider).call(transaction);
    state = AsyncData(await _load());
  }

  /// id দিয়ে মুছে ফেলা
  Future<void> deleteTransaction(int id) async {
    await ref.read(deleteTransactionUseCaseProvider).call(id);
    state = AsyncData(await _load());
  }

  /// সব ডাটা মুছে ফেলা
  Future<void> clearAll() async {
    await ref.read(clearAllTransactionsUseCaseProvider).call();
    state = AsyncData(await _load());
  }
}

final transactionListProvider =
    AsyncNotifierProvider<TransactionNotifier, List<TransactionEntity>>(
  TransactionNotifier.new,
);
