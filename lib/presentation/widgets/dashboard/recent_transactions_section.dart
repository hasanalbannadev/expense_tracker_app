// ============================================================
// recent_transactions_section.dart
// "Recent Transactions" শিরোনাম + "See All" + সর্বশেষ কয়েকটি transaction।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../navigation/app_navigator.dart';
import '../../providers/bottom_nav_provider.dart';
import '../../providers/recent_transactions_provider.dart';
import '../../providers/transaction_notifier.dart';
import '../common/empty_state.dart';
import 'recent_transaction_item.dart';

class RecentTransactionsSection extends ConsumerWidget {
  const RecentTransactionsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTransactions = ref.watch(transactionListProvider);
    final recent = ref.watch(recentTransactionsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            // "See All" চাপলে List tab খোলে
            TextButton(
              onPressed: () =>
                  ref.read(bottomNavIndexProvider.notifier).setIndex(1),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'See All',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward, size: 16, color: AppColors.primary),
                ],
              ),
            ),
          ],
        ),
        asyncTransactions.when(
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (error, stack) => const EmptyState(
            icon: Icons.error_outline_rounded,
            title: 'Something went wrong',
            message: 'Could not load transactions.',
          ),
          data: (_) {
            if (recent.isEmpty) {
              return const EmptyState(
                icon: Icons.receipt_long_rounded,
                title: 'No transactions yet',
                message: 'Tap + to add your first transaction.',
              );
            }
            // Recent list ও ListView.builder দিয়ে (স্ক্রল করে পুরো পেজ)
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: recent.length,
              itemBuilder: (context, index) {
                final transaction = recent[index];
                return RecentTransactionItem(
                  key: ValueKey(transaction.id),
                  transaction: transaction,
                  onTap: () =>
                      AppNavigator.openDetails(context, transaction.id!),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
