// ============================================================
// app_theme.dart
// পুরো অ্যাপের Material 3 থিম। কালার স্কিম seed color থেকে তৈরি।
// ============================================================
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.surface,
      ),
      scaffoldBackgroundColor: AppColors.background,
    );
  }
}
