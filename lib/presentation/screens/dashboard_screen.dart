// ============================================================
// dashboard_screen.dart  (Presentation layer)
// Dashboard: অ্যাপের নাম, ৩টি summary card, Recent Transactions।
// পুরো পেজ একসাথে স্ক্রল হয়। নিচে FAB এর জন্য ফাঁকা জায়গা রাখা আছে।
// ============================================================
import 'package:flutter/material.dart';

import '../widgets/common/responsive_body.dart';
import '../widgets/dashboard/dashboard_header.dart';
import '../widgets/dashboard/recent_transactions_section.dart';
import '../widgets/dashboard/summary_cards_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBody(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 12, 16, 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardHeader(),
            SizedBox(height: 16),
            SummaryCardsSection(),
            SizedBox(height: 20),
            RecentTransactionsSection(),
          ],
        ),
      ),
    );
  }
}
