// ============================================================
// stats_legend.dart
// চার্টের উপরের ছোট চিহ্ন: ● Income  ● Expense
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class StatsLegend extends StatelessWidget {
  const StatsLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _LegendItem(color: AppColors.income, label: 'Income'),
        SizedBox(width: 24),
        _LegendItem(color: AppColors.expense, label: 'Expense'),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
        ),
      ],
    );
  }
}
