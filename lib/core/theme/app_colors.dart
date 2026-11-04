// ============================================================
// app_colors.dart
// UI ডিজাইনের সব রং এক জায়গায়।
// ============================================================
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF3730A3); // গাঢ় indigo (বাটন, FAB)
  static const Color background = Color(0xFFF6F7FB);
  static const Color surface = Colors.white;
  static const Color border = Color(0xFFE5E7EB);
  static const Color muted = Color(0xFFEEF0F8); // details card এর হালকা ব্যাকগ্রাউন্ড

  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);

  static const Color income = Color(0xFF16A34A); // সবুজ
  static const Color incomeBg = Color(0xFFDCFCE7);
  static const Color expense = Color(0xFFEF4444); // লাল
  static const Color expenseBg = Color(0xFFFEE2E2);
  static const Color balanceBg = Color(0xFFDBEAFE);

  /// Income হলে সবুজ, Expense হলে লাল
  static Color typeColor(bool isIncome) => isIncome ? income : expense;

  static Color typeBackground(bool isIncome) =>
      isIncome ? incomeBg : expenseBg;
}
