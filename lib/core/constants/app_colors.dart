// ============================================================
// app_colors.dart
// ============================================================
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand
  static const Color primary = Color(0xFF2E3192);
  static const Color primaryLight = Color(0xFFE8E9FA);

  // Background / surface
  static const Color background = Color(0xFFF5F6FB);
  static const Color surface = Colors.white;
  static const Color infoCard = Color(0xFFF0F1FA);

  // Text
  static const Color textPrimary = Color(0xFF1B1D3A);
  static const Color textSecondary = Color(0xFF7A7F9A);

  // Border / divider
  static const Color border = Color(0xFFDDE0F0);
  static const Color divider = Color(0xFFEDEEF6);

  // Income / Expense
  static const Color income = Color(0xFF16A34A);
  static const Color incomeLight = Color(0xFFDDF5E6);
  static const Color expense = Color(0xFFEF4444);
  static const Color expenseLight = Color(0xFFFDE4E4);

  // Dashboard summary card gradients
  static const LinearGradient incomeGradient = LinearGradient(
    colors: [Color(0xFFE6F8EC), Color(0xFFD0F0DC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient expenseGradient = LinearGradient(
    colors: [Color(0xFFFDEAEA), Color(0xFFFAD4D4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient balanceGradient = LinearGradient(
    colors: [Color(0xFFE8F0FF), Color(0xFFD3E3FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
