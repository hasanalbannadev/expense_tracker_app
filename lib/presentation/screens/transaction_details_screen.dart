// ============================================================
// transaction_details_screen.dart  (Presentation layer)
// একটি transaction এর পূর্ণ তথ্য + Edit ও Delete বাটন।
// Edit করে ফিরে এলে নতুন তথ্য নিজে নিজেই দেখায় (Riverpod)।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/transaction_by_id_provider.dart';
import '../widgets/common/responsive_body.dart';
import '../widgets/details/details_actions.dart';
import '../widgets/details/details_header.dart';
import '../widgets/details/details_info_card.dart';

class TransactionDetailsScreen extends ConsumerWidget {
  final int transactionId;

  const TransactionDetailsScreen({super.key, required this.transactionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transaction = ref.watch(transactionByIdProvider(transactionId));

    return Scaffold(
      appBar: AppBar(title: const Text('Transaction Details')),
      body: SafeArea(
        child: transaction == null
            // মুছে ফেলা হলে এক মুহূর্তের জন্য এটি দেখায়, তারপর স্ক্রিন বন্ধ হয়
            ? const Center(child: Text('Transaction not found'))
            : ResponsiveBody(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: Column(
                    children: [
                      DetailsHeader(transaction: transaction),
                      const SizedBox(height: 24),
                      DetailsInfoCard(transaction: transaction),
                      const SizedBox(height: 24),
                      DetailsActions(transaction: transaction),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
