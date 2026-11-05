// ============================================================
// chart_axis.dart
// বার চার্টের Y-axis এর "সুন্দর" সর্বোচ্চ মান ও ধাপ হিসাব করে।
// যেমন সর্বোচ্চ ডাটা 3500 হলে -> 0, 1k, 2k, 3k, 4k
// ============================================================
import 'dart:math' as math;

class ChartAxis {
  const ChartAxis({required this.maxValue, required this.step});

  final double maxValue;
  final double step;

  /// Y-axis এ কয়টি ধাপ থাকবে (0 ছাড়া)
  static const int tickCount = 4;

  factory ChartAxis.fromMax(double dataMax) {
    if (dataMax <= 0) {
      return const ChartAxis(maxValue: 4000, step: 1000);
    }

    final rawStep = dataMax / tickCount;
    final magnitude =
        math.pow(10, (math.log(rawStep) / math.ln10).floor()).toDouble();
    final normalized = rawStep / magnitude;

    double nice;
    if (normalized <= 1) {
      nice = 1;
    } else if (normalized <= 2) {
      nice = 2;
    } else if (normalized <= 2.5) {
      nice = 2.5;
    } else if (normalized <= 5) {
      nice = 5;
    } else {
      nice = 10;
    }

    final step = nice * magnitude;
    return ChartAxis(maxValue: step * tickCount, step: step);
  }

  /// [0, step, 2*step, ... maxValue]
  List<double> get tickValues =>
      List<double>.generate(tickCount + 1, (i) => step * i);
}
