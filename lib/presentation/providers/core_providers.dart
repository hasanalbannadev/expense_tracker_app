// ============================================================
// core_providers.dart
// Dependency Injection: Database -> DataSource -> Repository।
// Riverpod দিয়ে একটার ওপর আরেকটা তৈরি হয়।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/database/database_helper.dart';
import '../../data/datasources/transaction_local_datasource.dart';
import '../../data/repositories/transaction_repository_impl.dart';
import '../../domain/repositories/transaction_repository.dart';

final databaseHelperProvider = Provider<DatabaseHelper>((ref) {
  return DatabaseHelper.instance;
});

final transactionLocalDataSourceProvider =
    Provider<TransactionLocalDataSource>((ref) {
  return TransactionLocalDataSource(ref.watch(databaseHelperProvider));
});

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepositoryImpl(
    ref.watch(transactionLocalDataSourceProvider),
  );
});
