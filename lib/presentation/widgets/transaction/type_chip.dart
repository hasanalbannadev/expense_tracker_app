// ============================================================
// type_chip.dart
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../domain/entities/transaction_type.dart';

class TypeChip extends StatelessWidget {
  const TypeChip({super.key, required this.type});

  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    final isIncome = type.isIncome;
    final color = isIncome ? AppColors.income : AppColors.expense;
    final background = isIncome ? AppColors.incomeLight : AppColors.expenseLight;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        type.label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
