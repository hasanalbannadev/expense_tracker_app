// ============================================================
// currency_formatter.dart
// টাকার অংক সুন্দর করে দেখানোর জন্য: 50000 -> ৳50,000
// ============================================================
import 'package:intl/intl.dart';

import '../constants/app_constants.dart';

class CurrencyFormatter {
  CurrencyFormatter._();

  static final NumberFormat _whole = NumberFormat('#,##0', 'en_US');
  static final NumberFormat _decimal = NumberFormat('#,##0.00', 'en_US');

  /// পূর্ণ সংখ্যা হলে দশমিক ছাড়া, নাহলে ২ ঘর দশমিকসহ।
  static String format(double amount) {
    final value = (amount.abs() * 100).round() / 100;
    final isWhole = value == value.roundToDouble();
    final text = isWhole ? _whole.format(value) : _decimal.format(value);
    final sign = amount < 0 ? '-' : '';
    return '$sign${AppConstants.currencySymbol}$text';
  }

  /// চার্টের Y-axis এর জন্য ছোট রূপ: 3000 -> 3k, 0 -> 0k
  static String compact(double value) {
    if (value == 0) return '0k';
    if (value >= 1000) {
      final k = value / 1000;
      return k == k.roundToDouble()
          ? '${k.toInt()}k'
          : '${k.toStringAsFixed(1)}k';
    }
    return value.toInt().toString();
  }
}
