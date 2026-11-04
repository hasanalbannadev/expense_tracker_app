// ============================================================
// confirm_dialog.dart
// "Delete Transaction?" এর মতো নিশ্চিতকরণ AlertDialog।
// Cancel চাপলে false, Confirm চাপলে true ফেরত দেয়।
// (Delete এবং Clear Data দুই জায়গায় ব্যবহার হয়)
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ConfirmDialog {
  ConfirmDialog._();

  static Future<bool> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Delete',
    IconData icon = Icons.delete_rounded,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          icon: Icon(icon, color: AppColors.expense, size: 44),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  // Cancel বাটন
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.muted,
                        foregroundColor: AppColors.textPrimary,
                        minimumSize: const Size(0, 48),
                      ),
                      onPressed: () => Navigator.of(dialogContext).pop(false),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Confirm (লাল) বাটন
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.expense,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 48),
                      ),
                      onPressed: () => Navigator.of(dialogContext).pop(true),
                      child: Text(confirmLabel),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );

    // বাইরে ট্যাপ করে বন্ধ করলে null আসে => false ধরা হয়
    return result ?? false;
  }
}
