// ============================================================
// details_info_card.dart
// Category, Type ও Date এর তথ্য একটি হালকা কার্ডে।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../domain/entities/transaction_entity.dart';
import 'details_info_row.dart';

class DetailsInfoCard extends StatelessWidget {
  final TransactionEntity transaction;

  const DetailsInfoCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.isIncome;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.muted,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          DetailsInfoRow(
            icon: Icons.label_outline_rounded,
            label: 'Category',
            value: transaction.category,
          ),
          DetailsInfoRow(
            icon: isIncome
                ? Icons.south_west_rounded
                : Icons.north_east_rounded,
            iconColor: AppColors.typeColor(isIncome),
            label: 'Type',
            value: transaction.type.label,
          ),
          DetailsInfoRow(
            icon: Icons.calendar_today_outlined,
            label: 'Date',
            value: DateFormatter.short(transaction.date),
          ),
        ],
      ),
    );
  }
}
