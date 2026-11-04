// ============================================================
// type_selector.dart
// Transaction Type বাছাই (Income / Expense)।
// কিছু সিলেক্ট না করলে "Please select a transaction type" error আসে।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/validators.dart';
import '../../../domain/entities/transaction_type.dart';
import 'type_option.dart';

class TypeSelector extends StatelessWidget {
  final TransactionType? initialValue;
  final ValueChanged<TransactionType?> onChanged;

  const TypeSelector({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<TransactionType>(
      initialValue: initialValue,
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
                  child: TypeOption(
                    type: TransactionType.income,
                    selected: state.value == TransactionType.income,
                    onTap: () => select(TransactionType.income),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TypeOption(
                    type: TransactionType.expense,
                    selected: state.value == TransactionType.expense,
                    onTap: () => select(TransactionType.expense),
                  ),
                ),
              ],
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 12),
                child: Text(
                  state.errorText ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.expense,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
