// ============================================================
// category_dropdown.dart
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_categories.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_input_decoration.dart';
import '../../../core/utils/validators.dart';

class CategoryDropdown extends FormField<String> {
  CategoryDropdown({
    super.key,
    super.initialValue,
    required ValueChanged<String?> onChanged,
  }) : super(
          validator: Validators.category,
          builder: (state) {
            return InputDecorator(
              isEmpty: state.value == null,
              decoration: AppInputDecoration.build(
                hint: AppStrings.selectCategory,
                prefixIcon: const Icon(
                  Icons.grid_view_rounded,
                  color: AppColors.textSecondary,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              ).copyWith(errorText: state.errorText),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: state.value,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(14),
                  dropdownColor: Colors.white,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.textPrimary,
                  ),
                  onChanged: (value) {
                    state.didChange(value);
                    onChanged(value);
                  },
                  items: AppCategories.all.map((category) {
                    return DropdownMenuItem<String>(
                      value: category.name,
                      child: Row(
                        children: [
                          Icon(category.icon, size: 20, color: category.color),
                          const SizedBox(width: 10),
                          Text(category.name),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        );
}
