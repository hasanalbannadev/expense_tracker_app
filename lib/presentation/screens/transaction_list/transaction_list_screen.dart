// ============================================================
// transaction_list_screen.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_strings.dart';
import '../../navigation/app_navigator.dart';
import '../../providers/search_provider.dart';
import '../../providers/transactions_notifier.dart';
import '../../widgets/common/empty_state_view.dart';
import '../../widgets/transaction/transaction_card.dart';
import '../../widgets/transaction/transaction_list_header.dart';

class TransactionListScreen extends ConsumerWidget {
  const TransactionListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTransactions = ref.watch(transactionsProvider);
    final transactions = ref.watch(filteredTransactionsProvider);
    final hasQuery = ref.watch(searchQueryProvider).trim().isNotEmpty;

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TransactionListHeader(),
        ),
        Expanded(
          child: asyncTransactions.isLoading && !asyncTransactions.hasValue
              ? const Center(child: CircularProgressIndicator())
              : transactions.isEmpty
                  ? EmptyStateView(
                      icon: hasQuery
                          ? Icons.search_off_rounded
                          : Icons.receipt_long_rounded,
                      title: hasQuery
                          ? AppStrings.noSearchResult
                          : AppStrings.noTransactions,
                      message:
                          hasQuery ? null : AppStrings.noTransactionsHint,
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];
                        return TransactionCard(
                          transaction: transaction,
                          onTap: () =>
                              AppNavigator.toDetails(context, transaction.id!),
                        );
                      },
                    ),
        ),
      ],
    );
  }
}
