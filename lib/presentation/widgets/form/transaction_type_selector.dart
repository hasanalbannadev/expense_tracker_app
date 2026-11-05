// ============================================================
// transaction_type_selector.dart
// Income / Expense বাছাইয়ের দুটি বাটন।
// FormField হওয়ায় সিলেক্ট না করলে নিচে লাল error লেখা দেখায়।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/validators.dart';
import '../../../domain/entities/transaction_type.dart';

class TransactionTypeSelector extends FormField<TransactionType> {
  TransactionTypeSelector({
    super.key,
    super.initialValue,
    required ValueChanged<TransactionType> onChanged,
  }) : super(
          validator: Validators.type,
          builder: (state) {
            void select(TransactionType type) {
              state.didChange(type);
              onChanged(type);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _TypeOption(
                        type: TransactionType.income,
                        isSelected: state.value == TransactionType.income,
                        onTap: () => select(TransactionType.income),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _TypeOption(
                        type: TransactionType.expense,
                        isSelected: state.value == TransactionType.expense,
                        onTap: () => select(TransactionType.expense),
                      ),
                    ),
                  ],
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 12),
                    child: Text(
                      state.errorText!,
                      style: const TextStyle(
                        color: AppColors.expense,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            );
          },
        );
}

class _TypeOption extends StatelessWidget {
  const _TypeOption({
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  final TransactionType type;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isIncome = type.isIncome;
    final color = isIncome ? AppColors.income : AppColors.expense;
    final lightColor = isIncome ? AppColors.incomeLight : AppColors.expenseLight;
    final icon = isIncome
        ? Icons.arrow_circle_up_outlined
        : Icons.arrow_circle_down_outlined;

    // সিলেক্ট হলে পুরো রঙিন, না হলে হালকা রঙ
    final background = isSelected ? color : lightColor;
    final foreground = isSelected ? Colors.white : color;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      height: 50,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: isSelected ? color : lightColor),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: foreground, size: 22),
              const SizedBox(width: 8),
              Text(
                type.label,
                style: TextStyle(
                  color: foreground,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
