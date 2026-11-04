// ============================================================
// transaction_by_id_provider.dart  (Presentation layer)
// Details স্ক্রিনের জন্য id দিয়ে একটি transaction খোঁজে।
// Edit করলে এটি নিজে update হয়, তাই Details স্ক্রিনে নতুন তথ্য দেখায়।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/transaction_entity.dart';
import 'transaction_notifier.dart';

final transactionByIdProvider =
    Provider.family<TransactionEntity?, int>((ref, id) {
  final transactions =
      ref.watch(transactionListProvider).value ?? const <TransactionEntity>[];
  for (final transaction in transactions) {
    if (transaction.id == id) return transaction;
  }
  return null; // মুছে ফেলা হলে null
});
