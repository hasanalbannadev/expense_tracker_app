// ============================================================
// app_navigator.dart  (Presentation layer)
// স্ক্রিন খোলার কাজ এক জায়গায় - যাতে widget গুলো ছোট ও পরিষ্কার থাকে।
// ============================================================
import 'package:flutter/material.dart';

import '../../domain/entities/transaction_entity.dart';
import '../screens/transaction_details_screen.dart';
import '../screens/transaction_form_screen.dart';

class AppNavigator {
  AppNavigator._();

  /// Add (transaction = null) অথবা Edit (transaction দিলে) ফর্ম খোলে
  static Future<void> openForm(
    BuildContext context, {
    TransactionEntity? transaction,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => TransactionFormScreen(transaction: transaction),
      ),
    );
  }

  /// Transaction Details স্ক্রিন খোলে
  static Future<void> openDetails(BuildContext context, int id) {
    return Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => TransactionDetailsScreen(transactionId: id),
      ),
    );
  }
}
