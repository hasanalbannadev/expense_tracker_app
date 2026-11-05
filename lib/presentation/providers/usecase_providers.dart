// ============================================================
// usecase_providers.dart
// সব use case এর provider। Notifier গুলো এখান থেকে use case নেয়।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/add_transaction_usecase.dart';
import '../../domain/usecases/calculate_summary_usecase.dart';
import '../../domain/usecases/clear_all_transactions_usecase.dart';
import '../../domain/usecases/delete_transaction_usecase.dart';
import '../../domain/usecases/get_monthly_transactions_usecase.dart';
import '../../domain/usecases/get_transactions_usecase.dart';
import '../../domain/usecases/update_transaction_usecase.dart';
import 'core_providers.dart';

final getTransactionsUseCaseProvider = Provider<GetTransactionsUseCase>((ref) {
  return GetTransactionsUseCase(ref.watch(transactionRepositoryProvider));
});

final addTransactionUseCaseProvider = Provider<AddTransactionUseCase>((ref) {
  return AddTransactionUseCase(ref.watch(transactionRepositoryProvider));
});

final updateTransactionUseCaseProvider =
    Provider<UpdateTransactionUseCase>((ref) {
  return UpdateTransactionUseCase(ref.watch(transactionRepositoryProvider));
});

final deleteTransactionUseCaseProvider =
    Provider<DeleteTransactionUseCase>((ref) {
  return DeleteTransactionUseCase(ref.watch(transactionRepositoryProvider));
});

final clearAllTransactionsUseCaseProvider =
    Provider<ClearAllTransactionsUseCase>((ref) {
  return ClearAllTransactionsUseCase(ref.watch(transactionRepositoryProvider));
});

final calculateSummaryUseCaseProvider =
    Provider<CalculateSummaryUseCase>((ref) {
  return const CalculateSummaryUseCase();
});

final getMonthlyTransactionsUseCaseProvider =
    Provider<GetMonthlyTransactionsUseCase>((ref) {
  return const GetMonthlyTransactionsUseCase();
});
