// ============================================================
// add_transaction_fab.dart
// Dashboard এর FloatingActionButton (+)। চাপলে Add Transaction ফর্ম খোলে।
// ============================================================
import 'package:flutter/material.dart';

import '../../navigation/app_navigator.dart';

class AddTransactionFab extends StatelessWidget {
  const AddTransactionFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Add Transaction',
      onPressed: () => AppNavigator.openForm(context),
      child: const Icon(Icons.add, size: 32),
    );
  }
}
