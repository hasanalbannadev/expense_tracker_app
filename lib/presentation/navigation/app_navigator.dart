// ============================================================
// app_navigator.dart
// ============================================================
import 'package:flutter/material.dart';

import '../../domain/entities/transaction_entity.dart';
import '../screens/add_transaction/add_transaction_screen.dart';
import '../screens/edit_transaction/edit_transaction_screen.dart';
import '../screens/transaction_details/transaction_details_screen.dart';

class AppNavigator {
  AppNavigator._();

  static Future<void> toAddTransaction(BuildContext context) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute<void>(builder: (_) => const AddTransactionScreen()),
    );
  }

  static Future<void> toDetails(BuildContext context, int transactionId) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => TransactionDetailsScreen(transactionId: transactionId),
      ),
    );
  }

  static Future<void> toEdit(
    BuildContext context,
    TransactionEntity transaction,
  ) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => EditTransactionScreen(transaction: transaction),
      ),
    );
  }
}
