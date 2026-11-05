// ============================================================
// search_provider.dart
// All Transactions স্ক্রিনের সার্চ: টাইটেল / ক্যাটাগরি / টাইপ দিয়ে ফিল্টার।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/transaction_entity.dart';
import 'transactions_notifier.dart';

class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void setQuery(String value) => state = value;

  void clear() => state = '';
}

final searchQueryProvider =
    NotifierProvider<SearchQueryNotifier, String>(SearchQueryNotifier.new);

final filteredTransactionsProvider = Provider<List<TransactionEntity>>((ref) {
  final all =
      ref.watch(transactionsProvider).value ?? const <TransactionEntity>[];
  final query = ref.watch(searchQueryProvider).trim().toLowerCase();

  if (query.isEmpty) return all;

  return all.where((t) {
    return t.title.toLowerCase().contains(query) ||
        t.category.toLowerCase().contains(query) ||
        t.type.label.toLowerCase().contains(query);
  }).toList();
});
