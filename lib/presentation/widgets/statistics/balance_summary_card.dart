// ============================================================
// balance_summary_card.dart
// নির্বাচিত মাসের ব্যালেন্স (আয় - খরচ) দেখানোর কার্ড।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/currency_formatter.dart';

class BalanceSummaryCard extends StatelessWidget {
  const BalanceSummaryCard({super.key, required this.balance});

  final double balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.balance, size: 40, color: AppColors.primary),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Balance',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                CurrencyFormatter.format(balance),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
