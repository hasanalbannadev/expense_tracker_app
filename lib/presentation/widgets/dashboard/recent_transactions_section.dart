// ============================================================
// recent_transactions_section.dart
// "Recent Transactions" হেডার + "See All" লিংক + সর্বশেষ লেনদেনের তালিকা।
// লোডিং / এরর / খালি — তিন অবস্থাই সামলানো হয়েছে।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../navigation/app_navigator.dart';
import '../../providers/navigation_provider.dart';
import '../../providers/recent_transactions_provider.dart';
import '../../providers/transactions_notifier.dart';
import '../common/empty_state_view.dart';
import 'recent_transaction_tile.dart';

class RecentTransactionsSection extends ConsumerWidget {
  const RecentTransactionsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTransactions = ref.watch(transactionsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                AppStrings.recentTransactions,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            // "See All" চাপলে List ট্যাবে যায়
            TextButton(
              onPressed: () =>
                  ref.read(bottomNavIndexProvider.notifier).setIndex(1),
              child: const Row(
                children: [
                  Text(
                    AppStrings.seeAll,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward_rounded,
                      size: 16, color: AppColors.primary),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        asyncTransactions.when(
          loading: () => const Padding(
            padding: EdgeInsets.all(32),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (error, stack) => const EmptyStateView(
            icon: Icons.error_outline_rounded,
            title: 'Could not load transactions',
          ),
          data: (_) {
            final recent = ref.watch(recentTransactionsProvider);

            if (recent.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: EmptyStateView(
                  icon: Icons.receipt_long_rounded,
                  title: AppStrings.noTransactions,
                  message: AppStrings.noTransactionsHint,
                ),
              );
            }

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  for (var i = 0; i < recent.length; i++) ...[
                    RecentTransactionTile(
                      transaction: recent[i],
                      onTap: () =>
                          AppNavigator.toDetails(context, recent[i].id!),
                    ),
                    if (i != recent.length - 1)
                      const Divider(height: 1, color: AppColors.divider),
                  ],
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
