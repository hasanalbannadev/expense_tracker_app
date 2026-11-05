// ============================================================
// dashboard_screen.dart
// প্রথম স্ক্রিন: অ্যাপের নাম, তিনটি summary কার্ড ও সাম্প্রতিক লেনদেন।
// FAB (+) MainScreen এ আছে।
// ============================================================
import 'package:flutter/material.dart';

import '../../widgets/dashboard/dashboard_header.dart';
import '../../widgets/dashboard/recent_transactions_section.dart';
import '../../widgets/dashboard/summary_cards_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // নিচে বাড়তি জায়গা, যাতে FAB শেষ আইটেম ঢেকে না ফেলে
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
      children: const [
        DashboardHeader(),
        SizedBox(height: 18),
        SummaryCardsSection(),
        SizedBox(height: 24),
        RecentTransactionsSection(),
      ],
    );
  }
}
