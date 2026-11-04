// ============================================================
// main_shell.dart  (Presentation layer)
// অ্যাপের মূল কাঠামো: নিচে Bottom Navigation, মাঝে ৪টি স্ক্রিন।
//   Home | List | Stats | Profile
// FAB (+) শুধু Home এ দেখায়।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/bottom_nav_provider.dart';
import '../widgets/navigation/add_transaction_fab.dart';
import '../widgets/navigation/app_bottom_nav.dart';
import 'all_transactions_screen.dart';
import 'dashboard_screen.dart';
import 'profile_screen.dart';
import 'statistics_screen.dart';

class MainShell extends ConsumerWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      body: SafeArea(
        // IndexedStack: tab বদলালেও প্রতিটি স্ক্রিনের অবস্থা (scroll, search) থাকে
        child: IndexedStack(
          index: index,
          children: const [
            DashboardScreen(),
            AllTransactionsScreen(),
            StatisticsScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      floatingActionButton: index == 0 ? const AddTransactionFab() : null,
      bottomNavigationBar: AppBottomNav(
        currentIndex: index,
        onTap: (value) =>
            ref.read(bottomNavIndexProvider.notifier).setIndex(value),
      ),
    );
  }
}
