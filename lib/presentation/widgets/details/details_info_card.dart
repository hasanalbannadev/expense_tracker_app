// ============================================================
// details_info_card.dart
// লেনদেনের সম্পূর্ণ তথ্য: Category, Type, Date (assignment এর Details অংশ)।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_categories.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../domain/entities/transaction_entity.dart';
import 'detail_info_row.dart';

class DetailsInfoCard extends StatelessWidget {
  const DetailsInfoCard({super.key, required this.transaction});

  final TransactionEntity transaction;

  @override
  Widget build(BuildContext context) {
    final category = AppCategories.byName(transaction.category);
    final isIncome = transaction.type.isIncome;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.infoCard,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          DetailInfoRow(
            icon: category.icon,
            iconColor: category.color,
            label: 'Category',
            value: transaction.category,
          ),
          DetailInfoRow(
            icon: isIncome ? Icons.trending_up_rounded : Icons.trending_down_rounded,
            iconColor: isIncome ? AppColors.income : AppColors.expense,
            label: 'Type',
            value: transaction.type.label,
          ),
          DetailInfoRow(
            icon: Icons.calendar_month_rounded,
            label: 'Date',
            value: DateFormatter.display(transaction.date),
          ),
        ],
      ),
    );
  }
}
