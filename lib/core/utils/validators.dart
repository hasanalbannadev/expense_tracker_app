// ============================================================
// validators.dart
// Add/Edit ফর্মের validation (Assignment অনুযায়ী):
//  - Title খালি থাকতে পারবে না
//  - Amount অবশ্যই valid positive number
//  - Category সিলেক্ট করতে হবে
//  - Transaction type সিলেক্ট করতে হবে
// ============================================================
class Validators {
  Validators._();

  static String? title(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Title is required';
    }
    return null; // null মানে valid
  }

  static String? amount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Amount is required';
    }
    final number = double.tryParse(value.trim());
    if (number == null || !number.isFinite) {
      return 'Enter a valid number';
    }
    if (number <= 0) {
      return 'Amount must be greater than 0';
    }
    return null;
  }

  static String? category(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a category';
    }
    return null;
  }

  /// type এর জন্য Object? নেওয়া হয়েছে যাতে core layer domain এর উপর নির্ভর না করে
  static String? type(Object? value) {
    if (value == null) {
      return 'Please select a transaction type';
    }
    return null;
  }

  static String? date(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please select a date';
    }
    return null;
  }
}
