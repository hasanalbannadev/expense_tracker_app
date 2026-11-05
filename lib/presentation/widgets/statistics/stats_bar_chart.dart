// ============================================================
// stats_bar_chart.dart
// কোনো বাইরের প্যাকেজ ছাড়া নিজে বানানো বার চার্ট (Income vs Expense)।
//  - Y-axis ও গ্রিড লাইন ChartAxis দিয়ে "সুন্দর" ধাপে ভাগ করা
//  - বার ওঠার অ্যানিমেশন (TweenAnimationBuilder)
// ============================================================
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/chart_axis.dart';
import '../../../core/utils/currency_formatter.dart';

class StatsBarChart extends StatelessWidget {
  const StatsBarChart({
    super.key,
    required this.income,
    required this.expense,
  });

  final double income;
  final double expense;

  static const double _chartHeight = 220;
  static const double _axisWidth = 40;

  @override
  Widget build(BuildContext context) {
    final axis = ChartAxis.fromMax(math.max(income, expense));
    final ticks = axis.tickValues;

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 34, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(
            height: _chartHeight,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // গ্রিড লাইন ও Y-axis লেবেল
                for (var i = 0; i < ticks.length; i++)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: _chartHeight * i / (ticks.length - 1) - 8,
                    height: 16,
                    child: Row(
                      children: [
                        SizedBox(
                          width: _axisWidth,
                          child: Text(
                            CurrencyFormatter.compact(ticks[i]),
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(height: 1, color: AppColors.divider),
                        ),
                      ],
                    ),
                  ),
                // বার দুটি
                Positioned(
                  left: _axisWidth,
                  right: 0,
                  bottom: 0,
                  height: _chartHeight,
                  child: Row(
                    children: [
                      Expanded(
                        child: _AnimatedBar(
                          value: income,
                          maxValue: axis.maxValue,
                          chartHeight: _chartHeight,
                          color: AppColors.income,
                        ),
                      ),
                      Expanded(
                        child: _AnimatedBar(
                          value: expense,
                          maxValue: axis.maxValue,
                          chartHeight: _chartHeight,
                          color: AppColors.expense,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          // বারের নিচের লেবেল
          const Padding(
            padding: EdgeInsets.only(left: _axisWidth),
            child: Row(
              children: [
                Expanded(child: _BarLabel('Income')),
                Expanded(child: _BarLabel('Expense')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedBar extends StatelessWidget {
  const _AnimatedBar({
    required this.value,
    required this.maxValue,
    required this.chartHeight,
    required this.color,
  });

  final double value;
  final double maxValue;
  final double chartHeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final targetHeight = maxValue == 0 ? 0.0 : value / maxValue * chartHeight;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: targetHeight),
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutCubic,
      builder: (context, height, _) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: 68,
                height: height,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                ),
              ),
            ),
            // পরিমাণের লেখা বারের মাথার ঠিক উপরে
            Positioned(
              bottom: height + 4,
              child: Text(
                CurrencyFormatter.format(value),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _BarLabel extends StatelessWidget {
  const _BarLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 13, color: AppColors.textPrimary),
      ),
    );
  }
}
