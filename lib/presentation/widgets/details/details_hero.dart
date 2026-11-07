// ============================================================
// details_hero.dart
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_categories.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../domain/entities/transaction_entity.dart';

class DetailsHero extends StatelessWidget {
  const DetailsHero({super.key, required this.transaction});

  final TransactionEntity transaction;

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type.isIncome;
    final color = isIncome ? AppColors.income : AppColors.expense;
    final background = isIncome ? AppColors.incomeLight : AppColors.expenseLight;
    final category = AppCategories.byName(transaction.category);

    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(color: background, shape: BoxShape.circle),
          child: Icon(category.icon, size: 48, color: color),
        ),
        const SizedBox(height: 16),
        Text(
          transaction.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          CurrencyFormatter.format(transaction.amount),
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
      ],
    );
  }
}
