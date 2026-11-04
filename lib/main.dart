// ============================================================
// main.dart
// অ্যাপের এন্ট্রি পয়েন্ট। ProviderScope দিয়ে পুরো অ্যাপ মোড়ানো হয়েছে
// যাতে Riverpod provider গুলো সব জায়গা থেকে ব্যবহার করা যায়।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/main_shell.dart';

void main() {
  runApp(const ProviderScope(child: ExpenseTrackerApp()));
}

/// Root widget - MaterialApp এখানে সেট করা হয়েছে।
class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const MainShell(),
    );
  }
}
