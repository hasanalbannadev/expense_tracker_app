// ============================================================
// date_picker_field.dart
// তারিখ বাছাই: ফিল্ডে চাপলে Date Picker (ক্যালেন্ডার) খোলে।
// লেখা যায় না (readOnly), শুধু picker থেকে বাছাই করতে হয়।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/utils/validators.dart';

class DatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;

  const DatePickerField({
    super.key,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      style: const TextStyle(fontSize: 17),
      decoration: const InputDecoration(
        hintText: 'Select date',
        prefixIcon: Icon(Icons.calendar_today_outlined),
        suffixIcon: Icon(Icons.calendar_month_outlined),
      ),
      validator: Validators.date,
    );
  }
}
