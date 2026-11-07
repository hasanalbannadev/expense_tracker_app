// ============================================================
// app_snackbar.dart
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
