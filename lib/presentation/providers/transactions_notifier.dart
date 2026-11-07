// ============================================================
// transactions_notifier.dart
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/transaction_entity.dart';
import 'usecase_providers.dart';

class TransactionsNotifier extends AsyncNotifier<List<TransactionEntity>> {

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


  Future<void> _reload() async {
    final list = await ref.read(getTransactionsUseCaseProvider).call();
    state = AsyncData(list);
  }
}

final transactionsProvider =
    AsyncNotifierProvider<TransactionsNotifier, List<TransactionEntity>>(
  TransactionsNotifier.new,
);
