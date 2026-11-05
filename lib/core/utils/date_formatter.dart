// ============================================================
// date_formatter.dart
// তারিখ দেখানো (Jun 13, 2025) এবং ডাটাবেসে সেভ/লোড করার কনভার্টার।
// ============================================================
import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static final DateFormat _display = DateFormat('MMM d, yyyy');

  /// UI তে দেখানোর জন্য
  static String display(DateTime date) => _display.format(date);

  /// ডাটাবেসে TEXT হিসেবে সেভ করার জন্য (ISO-8601)
  static String toStorage(DateTime date) => date.toIso8601String();

  /// ডাটাবেস থেকে TEXT পড়ে DateTime বানানো
  static DateTime fromStorage(String value) => DateTime.parse(value);
}
