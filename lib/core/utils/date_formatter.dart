// ============================================================
// date_formatter.dart
// ============================================================
import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static final DateFormat _display = DateFormat('MMM d, yyyy');


  static String display(DateTime date) => _display.format(date);


  static String toStorage(DateTime date) => date.toIso8601String();

  static DateTime fromStorage(String value) => DateTime.parse(value);
}
