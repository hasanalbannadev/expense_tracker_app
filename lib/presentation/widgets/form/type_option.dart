// ============================================================
// type_option.dart
// Income / Expense এর একটি বাটন।
// নির্বাচিত হলে গাঢ় রং (সবুজ/লাল), না হলে হালকা রং।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../domain/entities/transaction_type.dart';

class TypeOption extends StatelessWidget {
  final TransactionType type;
  final bool selected;
  final VoidCallback onTap;

  const TypeOption({
    super.key,
    required this.type,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = type == TransactionType.income;
    final baseColor = AppColors.typeColor(isIncome);
    final background =
        selected ? baseColor : AppColors.typeBackground(isIncome);
    final foreground = selected ? Colors.white : baseColor;

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isIncome
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                color: foreground,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                type.label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: foreground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
