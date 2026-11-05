// ============================================================
// app_snackbar.dart
// সফল / ব্যর্থ মেসেজ দেখানোর SnackBar।
// স্ক্রিন pop হওয়ার পরও দেখানোর জন্য ScaffoldMessengerState আগেই ধরে রাখা হয়।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class AppSnackBar {
  AppSnackBar._();

  static void show(
    ScaffoldMessengerState messenger,
    String message, {
    bool isError = false,
  }) {
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isError ? AppColors.expense : AppColors.textPrimary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
  }
}
