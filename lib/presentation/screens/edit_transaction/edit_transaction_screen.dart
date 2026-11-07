// ============================================================
// edit_transaction_screen.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_strings.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../../providers/transactions_notifier.dart';
import '../../widgets/common/app_snackbar.dart';
import '../../widgets/common/app_top_bar.dart';
import '../../widgets/form/transaction_form.dart';

class EditTransactionScreen extends ConsumerWidget {
  const EditTransactionScreen({super.key, required this.transaction});

  final TransactionEntity transaction;

  Future<void> _update(
    BuildContext context,
    WidgetRef ref,
    TransactionEntity updated,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final notifier = ref.read(transactionsProvider.notifier);

    try {
      await notifier.updateTransaction(updated);
      navigator.pop();
      AppSnackBar.show(messenger, AppStrings.updated);
    } catch (_) {
      AppSnackBar.show(messenger, AppStrings.saveFailed, isError: true);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppTopBar(title: AppStrings.editTransaction),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          child: TransactionForm(
            initial: transaction,
            submitLabel: AppStrings.updateTransaction,
            submitIcon: Icons.save_as_outlined,
            onSubmit: (updated) => _update(context, ref, updated),
          ),
        ),
      ),
    );
  }
}
