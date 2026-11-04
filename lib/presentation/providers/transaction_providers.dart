// ============================================================
// transaction_providers.dart  (Presentation layer)
// Dependency Injection - Database -> DataSource -> Repository -> UseCase
// এক ধাপে একটা করে provider দিয়ে জোড়া লাগানো হয়েছে।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/app_database.dart';
import '../../data/datasources/transaction_local_datasource.dart';
import '../../data/repositories/transaction_repository_impl.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/usecases/add_transaction_usecase.dart';
import '../../domain/usecases/calculate_summary_usecase.dart';
import '../../domain/usecases/clear_all_transactions_usecase.dart';
import '../../domain/usecases/delete_transaction_usecase.dart';
import '../../domain/usecases/get_transactions_usecase.dart';
import '../../domain/usecases/update_transaction_usecase.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

final transactionLocalDataSourceProvider =
    Provider<TransactionLocalDataSource>(
  (ref) => TransactionLocalDataSource(ref.watch(appDatabaseProvider)),
);

final transactionRepositoryProvider = Provider<TransactionRepository>(
  (ref) => TransactionRepositoryImpl(
    ref.watch(transactionLocalDataSourceProvider),
  ),
);

final getTransactionsUseCaseProvider = Provider<GetTransactionsUseCase>(
  (ref) => GetTransactionsUseCase(ref.watch(transactionRepositoryProvider)),
);

final addTransactionUseCaseProvider = Provider<AddTransactionUseCase>(
  (ref) => AddTransactionUseCase(ref.watch(transactionRepositoryProvider)),
);

final updateTransactionUseCaseProvider = Provider<UpdateTransactionUseCase>(
  (ref) => UpdateTransactionUseCase(ref.watch(transactionRepositoryProvider)),
);

final deleteTransactionUseCaseProvider = Provider<DeleteTransactionUseCase>(
  (ref) => DeleteTransactionUseCase(ref.watch(transactionRepositoryProvider)),
);

final clearAllTransactionsUseCaseProvider =
    Provider<ClearAllTransactionsUseCase>(
  (ref) =>
      ClearAllTransactionsUseCase(ref.watch(transactionRepositoryProvider)),
);

final calculateSummaryUseCaseProvider = Provider<CalculateSummaryUseCase>(
  (ref) => const CalculateSummaryUseCase(),
);
