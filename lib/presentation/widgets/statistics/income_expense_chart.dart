// ============================================================
// income_expense_chart.dart
// Income ও Expense এর বার চার্ট (কোনো extra package ছাড়া নিজে আঁকা)।
//   - বাম পাশে Y-axis এর মান (0, 1k, 2k ...)
//   - হালকা grid line
//   - সবুজ (Income) ও লাল (Expense) বার, উপরে পরিমাণ
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/chart_scale.dart';
import '../../../core/utils/currency_formatter.dart';

class IncomeExpenseChart extends StatelessWidget {
  final double income;
  final double expense;

  const IncomeExpenseChart({
    super.key,
    required this.income,
    required this.expense,
  });

  static const double _axisWidth = 44; // Y-axis লেখার জায়গা
  static const double _plotHeight = 190; // বারের সর্বোচ্চ উচ্চতা
  static const double _topPad = 28; // বারের উপরের লেখার জায়গা
  static const double _basePad = 10; // নিচের ফাঁকা জায়গা

  @override
  Widget build(BuildContext context) {
    final scale = ChartScale.from(income > expense ? income : expense);
    const totalHeight = _plotHeight + _topPad + _basePad;

    return Column(
      children: [
        SizedBox(
          height: totalHeight,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final plotWidth = constraints.maxWidth - _axisWidth;
              final half = plotWidth / 2; // প্রতিটি বারের জন্য অর্ধেক জায়গা
              final barWidth = half * 0.55 > 90 ? 90.0 : half * 0.55;

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  for (var i = 0; i <= scale.ticks; i++)
                    ..._gridLine(i, scale),
                  ..._bar(
                    index: 0,
                    value: income,
                    color: AppColors.income,
                    half: half,
                    barWidth: barWidth,
                    scale: scale,
                  ),
                  ..._bar(
                    index: 1,
                    value: expense,
                    color: AppColors.expense,
                    half: half,
                    barWidth: barWidth,
                    scale: scale,
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 4),
        // নিচের লেখা: Income | Expense
        const Row(
          children: [
            SizedBox(width: _axisWidth),
            Expanded(
              child: Center(
                child: Text(
                  'Income',
                  style: TextStyle(fontSize: 14, color: AppColors.textPrimary),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Expense',
                  style: TextStyle(fontSize: 14, color: AppColors.textPrimary),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// একটি আনুভূমিক grid line + বামের Y-axis লেখা
  List<Widget> _gridLine(int i, ChartScale scale) {
    final y = _basePad + _plotHeight * i / scale.ticks;

    return [
      Positioned(
        left: 0,
        width: _axisWidth - 8,
        bottom: y - 8,
        height: 16,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            ChartScale.label(scale.step * i),
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
        ),
      ),
      Positioned(
        left: _axisWidth,
        right: 0,
        bottom: y,
        height: 1,
        child: const ColoredBox(color: AppColors.border),
      ),
    ];
  }

  /// একটি বার + তার উপরের পরিমাণ লেখা
  List<Widget> _bar({
    required int index,
    required double value,
    required Color color,
    required double half,
    required double barWidth,
    required ChartScale scale,
  }) {
    final fraction = scale.max <= 0 ? 0.0 : (value / scale.max).clamp(0.0, 1.0);
    final barHeight = _plotHeight * fraction;
    final slotLeft = _axisWidth + half * index;

    return [
      Positioned(
        left: slotLeft + (half - barWidth) / 2,
        bottom: _basePad,
        width: barWidth,
        height: barHeight,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
        ),
      ),
      Positioned(
        left: slotLeft,
        width: half,
        bottom: _basePad + barHeight + 4,
        child: Center(
          child: Text(
            CurrencyFormatter.format(value),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ),
    ];
  }
}
