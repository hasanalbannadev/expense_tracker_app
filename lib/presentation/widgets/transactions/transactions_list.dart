// ============================================================
// transactions_list.dart
// সব transaction ListView.builder দিয়ে দেখায় (Assignment requirement)।
// প্রতিটি কার্ড চাপলে Details স্ক্রিন খোলে।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../navigation/app_navigator.dart';
import '../../providers/search_providers.dart';
import '../../providers/transaction_notifier.dart';
import '../common/empty_state.dart';
import 'transaction_card.dart';

class TransactionsList extends ConsumerWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTransactions = ref.watch(transactionListProvider);
    final items = ref.watch(filteredTransactionsProvider);
    final query = ref.watch(searchQueryProvider).trim();

    return asyncTransactions.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => const Center(
        child: EmptyState(
          icon: Icons.error_outline_rounded,
          title: 'Something went wrong',
          message: 'Could not load transactions.',
        ),
      ),
      data: (_) {
        if (items.isEmpty) {
          return Center(
            child: SingleChildScrollView(
              child: EmptyState(
                icon: query.isEmpty
                    ? Icons.receipt_long_rounded
                    : Icons.search_off_rounded,
                title: query.isEmpty
                    ? 'No transactions yet'
                    : 'No matching transactions',
                message: query.isEmpty
                    ? 'Tap + on Home to add your first transaction.'
                    : 'Try a different title or category.',
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final transaction = items[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TransactionCard(
                key: ValueKey(transaction.id),
                transaction: transaction,
                onTap: () => AppNavigator.openDetails(context, transaction.id!),
              ),
            );
          },
        );
      },
    );
  }
}
