// ============================================================
// form_label.dart
// ফিল্ডের উপরের লেবেল; লাল * মানে ফিল্ডটি বাধ্যতামূলক।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class FormLabel extends StatelessWidget {
  const FormLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text.rich(
        TextSpan(
          text: text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
          children: const [
            TextSpan(
              text: ' *',
              style: TextStyle(color: AppColors.expense),
            ),
          ],
        ),
      ),
    );
  }
}
