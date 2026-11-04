// ============================================================
// date_formatter.dart
// তারিখ দেখানোর ফরম্যাট: "Jun 16, 2025" (intl প্যাকেজ ছাড়াই)
// ============================================================
class DateFormatter {
  DateFormatter._();

  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  /// DateTime -> "Jun 16, 2025"
  static String short(DateTime date) {
    return '${_months[date.month - 1]} ${date.day}, ${date.year}';
  }

  /// দুটি তারিখ একই মাসের কিনা (Statistics এ লাগে)
  static bool isSameMonth(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month;
  }
}
