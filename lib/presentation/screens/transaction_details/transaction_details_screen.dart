// ============================================================
// transaction_details_screen.dart
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_strings.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../../navigation/app_navigator.dart';
import '../../providers/transaction_by_id_provider.dart';
import '../../providers/transactions_notifier.dart';
import '../../widgets/common/app_snackbar.dart';
import '../../widgets/common/app_top_bar.dart';
import '../../widgets/common/confirm_dialog.dart';
import '../../widgets/common/danger_outline_button.dart';
import '../../widgets/common/primary_button.dart';
import '../../widgets/details/details_hero.dart';
import '../../widgets/details/details_info_card.dart';

class TransactionDetailsScreen extends ConsumerWidget {
  const TransactionDetailsScreen({super.key, required this.transactionId});

  final int transactionId;

  Future<void> _onDelete(
    BuildContext context,
    WidgetRef ref,
    TransactionEntity transaction,
  ) async {
    final confirmed = await showDeleteConfirmDialog(context);
    if (!confirmed || !context.mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final notifier = ref.read(transactionsProvider.notifier);

    navigator.pop();
    try {
      await notifier.deleteTransaction(transaction.id!);
      AppSnackBar.show(messenger, AppStrings.deleted);
    } catch (_) {
      AppSnackBar.show(messenger, AppStrings.saveFailed, isError: true);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transaction = ref.watch(transactionByIdProvider(transactionId));

    return Scaffold(
      appBar: const AppTopBar(title: AppStrings.transactionDetails),
      body: transaction == null
          ? const SizedBox.shrink()
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              children: [
                DetailsHero(transaction: transaction),
                const SizedBox(height: 24),
                DetailsInfoCard(transaction: transaction),
                const SizedBox(height: 24),
                PrimaryButton(
                  label: AppStrings.edit,
                  icon: Icons.edit_rounded,
                  onPressed: () => AppNavigator.toEdit(context, transaction),
                ),
                const SizedBox(height: 12),
                DangerOutlineButton(
                  label: AppStrings.delete,
                  icon: Icons.delete_rounded,
                  onPressed: () => _onDelete(context, ref, transaction),
                ),
              ],
            ),
    );
  }
}
