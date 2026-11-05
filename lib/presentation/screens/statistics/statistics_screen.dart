// ============================================================
// statistics_screen.dart
// This Month / Last Month এর আয়-ব্যয়ের বার চার্ট ও ব্যালেন্স।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/statistics_provider.dart';
import '../../widgets/statistics/balance_summary_card.dart';
import '../../widgets/statistics/chart_legend.dart';
import '../../widgets/statistics/period_toggle.dart';
import '../../widgets/statistics/stats_bar_chart.dart';
import '../../widgets/statistics/stats_header.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(monthlyStatsProvider);

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      children: [
        const StatsHeader(),
        const SizedBox(height: 18),
        const PeriodToggle(),
        const SizedBox(height: 18),
        const ChartLegend(),
        const SizedBox(height: 12),
        // key দেওয়ায় মাস বদলালে চার্ট আবার অ্যানিমেট হয়
        StatsBarChart(
          key: ValueKey('${summary.totalIncome}-${summary.totalExpense}'),
          income: summary.totalIncome,
          expense: summary.totalExpense,
        ),
        const SizedBox(height: 18),
        BalanceSummaryCard(balance: summary.balance),
      ],
    );
  }
}
