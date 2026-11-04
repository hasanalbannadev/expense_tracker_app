// ============================================================
// category_dropdown.dart
// Category বাছাই করার DropdownButton (Assignment requirement)।
// FormField দিয়ে মোড়ানো, তাই সিলেক্ট না করলে error দেখানো যায়।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_categories.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/validators.dart';

class CategoryDropdown extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String?> onChanged;

  const CategoryDropdown({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: initialValue,
      validator: Validators.category,
      builder: (state) {
        return InputDecorator(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.grid_view_rounded),
            errorText: state.errorText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: state.value,
              isExpanded: true,
              borderRadius: BorderRadius.circular(14),
              dropdownColor: Colors.white,
              hint: const Text(
                'Select category',
                style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 17),
              ),
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              items: [
                for (final category in AppCategories.all)
                  DropdownMenuItem<String>(
                    value: category.name,
                    child: Row(
                      children: [
                        Icon(category.icon, color: category.color, size: 20),
                        const SizedBox(width: 10),
                        Text(
                          category.name,
                          style: const TextStyle(
                            fontSize: 17,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
              onChanged: (value) {
                state.didChange(value); // FormField কে জানানো
                onChanged(value); // parent কে জানানো
              },
            ),
          ),
        );
      },
    );
  }
}
