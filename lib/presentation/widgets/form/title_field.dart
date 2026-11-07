// ============================================================
// title_field.dart
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_input_decoration.dart';
import '../../../core/utils/validators.dart';

class TitleField extends StatelessWidget {
  const TitleField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.next,
      maxLength: 60,
      validator: Validators.title,
      decoration: AppInputDecoration.build(
        hint: AppStrings.enterTitle,
        prefixIcon: const Icon(
          Icons.sell_outlined,
          color: AppColors.textSecondary,
        ),
      ).copyWith(counterText: ''),
    );
  }
}
