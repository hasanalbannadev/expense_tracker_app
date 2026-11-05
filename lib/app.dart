// ============================================================
// app.dart
// MaterialApp এখানে সেট করা হয়েছে: থিম, টাইটেল ও প্রথম স্ক্রিন (MainScreen)।
// ============================================================
import 'package:flutter/material.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/main/main_screen.dart';

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const MainScreen(),
    );
  }
}
