// ============================================================
// summary_cards_section.dart
// Total Income, Total Expense ও Current Balance — তিনটি কার্ড।
// summaryProvider বদলালে নিজে নিজে আপডেট হয় (dynamic calculation)।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../providers/summary_provider.dart';
import 'summary_card.dart';

class SummaryCardsSection extends ConsumerWidget {
  const SummaryCardsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(summaryProvider);

    return Column(
      children: [
        SummaryCard(
          label: AppStrings.totalIncome,
          value: CurrencyFormatter.format(summary.totalIncome),
          icon: Icons.account_balance_wallet_rounded,
          iconColor: AppColors.income,
          gradient: AppColors.incomeGradient,
        ),
        const SizedBox(height: 14),
        SummaryCard(
          label: AppStrings.totalExpense,
          value: CurrencyFormatter.format(summary.totalExpense),
          icon: Icons.account_balance_wallet_rounded,
          iconColor: AppColors.expense,
          gradient: AppColors.expenseGradient,
        ),
        const SizedBox(height: 14),
        SummaryCard(
          label: AppStrings.currentBalance,
          value: CurrencyFormatter.format(summary.balance),
          icon: Icons.balance,
          iconColor: AppColors.primary,
          gradient: AppColors.balanceGradient,
        ),
      ],
    );
  }
}
