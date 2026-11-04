// ============================================================
// details_header.dart
// Details স্ক্রিনের উপরের অংশ: বড় গোল আইকন, title, বড় amount।
// Income হলে সবুজ, Expense হলে লাল।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_categories.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../domain/entities/transaction_entity.dart';

class DetailsHeader extends StatelessWidget {
  final TransactionEntity transaction;

  const DetailsHeader({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.isIncome;
    final color = AppColors.typeColor(isIncome);
    final icon = AppCategories.byName(transaction.category).icon;

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: AppColors.typeBackground(isIncome),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 48, color: color),
          ),
          const SizedBox(height: 14),
          Text(
            transaction.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              CurrencyFormatter.format(transaction.amount),
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
