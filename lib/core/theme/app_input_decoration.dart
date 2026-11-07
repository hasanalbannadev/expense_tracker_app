// ============================================================
// app_input_decoration.dart
// TextField ও Dropdown
// ============================================================
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppInputDecoration {
  AppInputDecoration._();

  static OutlineInputBorder _border(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  static InputDecoration build({
    required String hint,
    Widget? prefixIcon,
    Widget? suffixIcon,
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 15),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      contentPadding: contentPadding,
      border: _border(AppColors.border),
      enabledBorder: _border(AppColors.border),
      focusedBorder: _border(AppColors.primary, width: 1.6),
      errorBorder: _border(AppColors.expense),
      focusedErrorBorder: _border(AppColors.expense, width: 1.6),
    );
  }
}
