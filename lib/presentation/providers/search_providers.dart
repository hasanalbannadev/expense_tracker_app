// ============================================================
// search_providers.dart  (Presentation layer)
// All Transactions স্ক্রিনের search: title বা category দিয়ে ফিল্টার।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/transaction_entity.dart';
import 'transaction_notifier.dart';

/// search বক্সে যা লেখা হয়েছে
class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void setQuery(String value) => state = value;
}

final searchQueryProvider = NotifierProvider<SearchQueryNotifier, String>(
  SearchQueryNotifier.new,
);

/// search অনুযায়ী ফিল্টার করা তালিকা
final filteredTransactionsProvider = Provider<List<TransactionEntity>>((ref) {
  final query = ref.watch(searchQueryProvider).trim().toLowerCase();
  final transactions =
      ref.watch(transactionListProvider).value ?? const <TransactionEntity>[];

  if (query.isEmpty) return transactions;

  return transactions.where((t) {
    return t.title.toLowerCase().contains(query) ||
        t.category.toLowerCase().contains(query);
  }).toList();
});
