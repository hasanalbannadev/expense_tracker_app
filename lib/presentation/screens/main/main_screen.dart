// ============================================================
// main_screen.dart
// অ্যাপের মূল কাঠামো: IndexedStack (৪টি ট্যাব) + Bottom Navigation + FAB।
// FAB (+) শুধু Home ট্যাবে দেখায় এবং Add Transaction স্ক্রিনে নিয়ে যায়।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../navigation/app_navigator.dart';
import '../../providers/navigation_provider.dart';
import '../../widgets/navigation/app_bottom_nav.dart';
import '../dashboard/dashboard_screen.dart';
import '../profile/profile_screen.dart';
import '../statistics/statistics_screen.dart';
import '../transaction_list/transaction_list_screen.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  static const List<Widget> _pages = [
    DashboardScreen(),
    TransactionListScreen(),
    StatisticsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: IndexedStack(index: currentIndex, children: _pages),
      ),
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
              onPressed: () => AppNavigator.toAddTransaction(context),
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              elevation: 4,
              shape: const CircleBorder(),
              child: const Icon(Icons.add_rounded, size: 32),
            )
          : null,
      bottomNavigationBar: AppBottomNav(
        currentIndex: currentIndex,
        onTap: (index) =>
            ref.read(bottomNavIndexProvider.notifier).setIndex(index),
      ),
    );
  }
}
