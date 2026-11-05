// ============================================================
// danger_outline_button.dart
// লাল বর্ডারের Delete বাটন (হালকা লাল ব্যাকগ্রাউন্ড)।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class DangerOutlineButton extends StatelessWidget {
  const DangerOutlineButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.expense,
          backgroundColor: const Color(0xFFFFF1F1),
          side: const BorderSide(color: AppColors.expense, width: 1.4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}
