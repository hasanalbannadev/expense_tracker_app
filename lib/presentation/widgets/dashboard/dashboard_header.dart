// ============================================================
// dashboard_header.dart
// উপরের অংশ: লোগো আইকন + "Expense Tracker" + ডানে stats আইকন।
// stats আইকন চাপলে Statistics tab খোলে।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../providers/bottom_nav_provider.dart';

class DashboardHeader extends ConsumerWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Icon(Icons.eco_rounded, size: 34, color: AppColors.income),
        const SizedBox(width: 10),
        // Expanded: ছোট স্ক্রিনে লেখা দরকারে পরের লাইনে যাবে
        const Expanded(
          child: Text(
            AppConstants.appName,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        IconButton(
          tooltip: 'Statistics',
          icon: const Icon(
            Icons.bar_chart_rounded,
            size: 28,
            color: AppColors.textSecondary,
          ),
          onPressed: () => ref.read(bottomNavIndexProvider.notifier).setIndex(2),
        ),
      ],
    );
  }
}
