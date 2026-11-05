// ============================================================
// validators.dart
// Assignment এর সব Validation rule এক জায়গায়:
//  - Title খালি থাকা যাবে না
//  - Amount অবশ্যই valid positive number
//  - Category সিলেক্ট করতে হবে
//  - Transaction type সিলেক্ট করতে হবে
//  - Date সিলেক্ট করতে হবে
// ============================================================
import '../../domain/entities/transaction_type.dart';

class Validators {
  Validators._();

  static String? title(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Title cannot be empty';
    }
    return null;
  }

  static String? amount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Amount is required';
    }
    final parsed = double.tryParse(value.trim().replaceAll(',', ''));
    if (parsed == null || !parsed.isFinite) {
      return 'Enter a valid number';
    }
    if (parsed <= 0) {
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

  static String? type(TransactionType? value) {
    if (value == null) {
      return 'Please select income or expense';
    }
    return null;
  }

  static String? date(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a date';
    }
    return null;
  }
}
