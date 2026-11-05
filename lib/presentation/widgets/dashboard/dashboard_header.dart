// ============================================================
// dashboard_header.dart
// Dashboard এর উপরের অংশ: লোগো + "Expense Tracker" নাম + Statistics আইকন।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../providers/navigation_provider.dart';

class DashboardHeader extends ConsumerWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Icon(Icons.eco_rounded, size: 34, color: AppColors.income),
        const SizedBox(width: 10),
        const Expanded(
          child: Text(
            AppConstants.appName,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        IconButton(
          tooltip: 'Statistics',
          onPressed: () => ref.read(bottomNavIndexProvider.notifier).setIndex(2),
          icon: const Icon(
            Icons.bar_chart_rounded,
            size: 28,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
