// ============================================================
// chart_scale.dart
// Statistics bar chart এর Y-axis এর "সুন্দর" মান হিসাব করে।
// যেমন সর্বোচ্চ মান 3,500 হলে -> 0, 1k, 2k, 3k, 4k
// ============================================================
import 'dart:math';

class ChartScale {
  final double max; // Y-axis এর সর্বোচ্চ মান
  final double step; // প্রতি ধাপের মান
  final int ticks; // কয়টি ধাপ

  const ChartScale({
    required this.max,
    required this.step,
    required this.ticks,
  });

  factory ChartScale.from(double maxValue) {
    const tickCount = 4;
    if (maxValue <= 0) {
      return const ChartScale(max: 4000, step: 1000, ticks: tickCount);
    }
    final rough = maxValue / tickCount;
    final magnitude = pow(10, (log(rough) / ln10).floor()).toDouble();
    final residual = rough / magnitude;

    double nice;
    if (residual <= 1) {
      nice = 1;
    } else if (residual <= 2) {
      nice = 2;
    } else if (residual <= 5) {
      nice = 5;
    } else {
      nice = 10;
    }

    final step = nice * magnitude;
    return ChartScale(max: step * tickCount, step: step, ticks: tickCount);
  }

  /// 4000 -> "4k", 2500 -> "2.5k", 500 -> "500"
  static String label(double value) {
    if (value >= 1000) {
      final k = value / 1000;
      return k == k.truncateToDouble()
          ? '${k.toInt()}k'
          : '${k.toStringAsFixed(1)}k';
    }
    return value.toStringAsFixed(0);
  }
}
