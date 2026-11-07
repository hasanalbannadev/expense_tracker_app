// ============================================================
// dashboard_screen.dart
// FAB (+) MainScreen
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
