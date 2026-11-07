// ============================================================
// add_transaction_screen.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_strings.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../../providers/transactions_notifier.dart';
import '../../widgets/common/app_snackbar.dart';
import '../../widgets/common/app_top_bar.dart';
import '../../widgets/form/transaction_form.dart';

class AddTransactionScreen extends ConsumerWidget {
  const AddTransactionScreen({super.key});

  Future<void> _save(
    BuildContext context,
    WidgetRef ref,
    TransactionEntity transaction,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final notifier = ref.read(transactionsProvider.notifier);

    try {
      await notifier.addTransaction(transaction);
      navigator.pop();
      AppSnackBar.show(messenger, AppStrings.added);
    } catch (_) {
      AppSnackBar.show(messenger, AppStrings.saveFailed, isError: true);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppTopBar(title: AppStrings.addTransaction),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          child: TransactionForm(
            submitLabel: AppStrings.saveTransaction,
            submitIcon: Icons.save_outlined,
            onSubmit: (transaction) => _save(context, ref, transaction),
          ),
        ),
      ),
    );
  }
}
