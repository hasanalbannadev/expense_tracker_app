// ============================================================
// date_picker_field.dart
// Date বাছাইয়ের ফিল্ড: চাপ দিলে Material DatePicker খোলে।
// ফিল্ডে টাইপ করা যায় না (readOnly), শুধু picker দিয়ে তারিখ বসে।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_input_decoration.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/utils/validators.dart';

class DatePickerField extends StatelessWidget {
  const DatePickerField({
    super.key,
    required this.controller,
    required this.selectedDate,
    required this.onPicked,
  });

  final TextEditingController controller;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onPicked;

  Future<void> _pickDate(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final now = DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      controller.text = DateFormatter.display(picked);
      onPicked(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: () => _pickDate(context),
      validator: Validators.date,
      decoration: AppInputDecoration.build(
        hint: AppStrings.selectDate,
        prefixIcon: const Icon(
          Icons.calendar_month_outlined,
          color: AppColors.textPrimary,
        ),
        suffixIcon: const Icon(
          Icons.calendar_today_outlined,
          size: 20,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
