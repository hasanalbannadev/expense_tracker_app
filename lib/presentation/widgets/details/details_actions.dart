// ============================================================
// details_actions.dart
// "Edit" ও "Delete" বাটন।
//  - Edit   : আগের তথ্যসহ Edit ফর্ম খোলে
//  - Delete : AlertDialog এ নিশ্চিত করার পর মুছে ফেলে
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../../navigation/app_navigator.dart';
import '../../providers/transaction_notifier.dart';
import '../common/confirm_dialog.dart';

class DetailsActions extends ConsumerWidget {
  final TransactionEntity transaction;

  const DetailsActions({super.key, required this.transaction});

  Future<void> _delete(BuildContext context, WidgetRef ref) async {
    final confirmed = await ConfirmDialog.show(
      context,
      title: 'Delete Transaction?',
      message: 'Are you sure you want to delete this transaction?',
    );
    if (!confirmed || !context.mounted) return;

    // widget বন্ধ হওয়ার আগেই দরকারি জিনিস হাতে রাখা হলো
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final notifier = ref.read(transactionListProvider.notifier);

    navigator.pop(); // আগে Details স্ক্রিন বন্ধ
    await notifier.deleteTransaction(transaction.id!);
    messenger.showSnackBar(const SnackBar(content: Text('Transaction deleted')));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        // Edit বাটন (ইন্ডিগো)
        ElevatedButton(
          onPressed: () =>
              AppNavigator.openForm(context, transaction: transaction),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.edit_rounded, size: 22),
              SizedBox(width: 10),
              Text(
                'Edit',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Delete বাটন (হালকা লাল, লাল বর্ডার)
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.expenseBg,
            foregroundColor: AppColors.expense,
            side: const BorderSide(color: AppColors.expense, width: 1.2),
            minimumSize: const Size.fromHeight(54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: () => _delete(context, ref),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.delete_rounded, size: 22),
              SizedBox(width: 10),
              Text(
                'Delete',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
