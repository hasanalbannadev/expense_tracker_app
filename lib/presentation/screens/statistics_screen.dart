// ============================================================
// statistics_screen.dart  (Presentation layer)
// Statistics: This Month / Last Month বাছাই, Income-Expense বার চার্ট, Balance।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../providers/stats_providers.dart';
import '../widgets/common/responsive_body.dart';
import '../widgets/statistics/balance_card.dart';
import '../widgets/statistics/income_expense_chart.dart';
import '../widgets/statistics/period_toggle.dart';
import '../widgets/statistics/stats_legend.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(periodSummaryProvider);

    return ResponsiveBody(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.bar_chart_rounded, size: 30, color: AppColors.primary),
                SizedBox(width: 10),
                Text(
                  'Statistics',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const PeriodToggle(),
            const SizedBox(height: 16),
            const StatsLegend(),
            const SizedBox(height: 12),
            IncomeExpenseChart(
              income: summary.totalIncome,
              expense: summary.totalExpense,
            ),
            const SizedBox(height: 16),
            BalanceCard(balance: summary.balance),
          ],
        ),
      ),
    );
  }
}
