// ============================================================
// summary_cards_section.dart
// তিনটি summary card: Total Income, Total Expense, Current Balance।
// summaryProvider watch করে, তাই add/edit/delete হলে নিজে update হয়।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../providers/summary_providers.dart';
import 'summary_card.dart';

class SummaryCardsSection extends ConsumerWidget {
  const SummaryCardsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(summaryProvider);

    return Column(
      children: [
        SummaryCard(
          label: 'Total Income',
          value: CurrencyFormatter.format(summary.totalIncome),
          icon: Icons.account_balance_wallet_rounded,
          iconColor: AppColors.income,
          gradient: const [Color(0xFFE9F9EE), Color(0xFFD2F3DC)],
        ),
        const SizedBox(height: 12),
        SummaryCard(
          label: 'Total Expense',
          value: CurrencyFormatter.format(summary.totalExpense),
          icon: Icons.account_balance_wallet_rounded,
          iconColor: AppColors.expense,
          gradient: const [Color(0xFFFDEDED), Color(0xFFF9D5D5)],
        ),
        const SizedBox(height: 12),
        SummaryCard(
          label: 'Current Balance',
          value: CurrencyFormatter.format(summary.balance),
          icon: Icons.account_balance_rounded,
          iconColor: AppColors.primary,
          gradient: const [Color(0xFFE8F0FE), Color(0xFFD3E2FB)],
        ),
      ],
    );
  }
}
