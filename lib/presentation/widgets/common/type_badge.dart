// ============================================================
// type_badge.dart
// "Income" (সবুজ) / "Expense" (লাল) ছোট ক্যাপসুল ব্যাজ।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../domain/entities/transaction_type.dart';

class TypeBadge extends StatelessWidget {
  final TransactionType type;

  const TypeBadge({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final isIncome = type == TransactionType.income;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.typeBackground(isIncome),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        type.label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AppColors.typeColor(isIncome),
        ),
      ),
    );
  }
}
