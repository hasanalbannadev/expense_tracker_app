// ============================================================
// form_label.dart
// ফর্মের ফিল্ডের উপরের লেখা, যেমন: "Title *"
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class FormLabel extends StatelessWidget {
  final String text;

  const FormLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: text),
            // লাল * মানে ফিল্ডটি বাধ্যতামূলক
            const TextSpan(
              text: ' *',
              style: TextStyle(color: AppColors.expense),
            ),
          ],
        ),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
