// ============================================================
// expense_flow_test.dart
// Widget test: Dashboard দেখানো, form validation, নতুন transaction যোগ করা।
// আসল database এর বদলে FakeTransactionRepository ব্যবহার হয়।
// চালাতে: flutter test
// ============================================================
import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/presentation/providers/transaction_providers.dart';
import 'package:expense_tracker/presentation/widgets/form/date_picker_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_transaction_repository.dart';

Future<FakeTransactionRepository> pumpApp(WidgetTester tester) async {
  // বড় স্ক্রিন (600x1200 logical) যাতে পুরো ফর্ম দেখা যায়
  tester.view.physicalSize = const Size(1200, 2400);
  tester.view.devicePixelRatio = 2.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  final repository = FakeTransactionRepository();

  await tester.pumpWidget(
    ProviderScope(
      overrides: [transactionRepositoryProvider.overrideWithValue(repository)],
      child: const ExpenseTrackerApp(),
    ),
  );
  await tester.pumpAndSettle();
  return repository;
}

void main() {
  testWidgets('Dashboard shows title and three summary cards', (tester) async {
    await pumpApp(tester);

    expect(find.text('Expense Tracker'), findsOneWidget);
    expect(find.text('Total Income'), findsOneWidget);
    expect(find.text('Total Expense'), findsOneWidget);
    expect(find.text('Current Balance'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Empty form shows validation errors', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ElevatedButton, 'Save Transaction'));
    await tester.pumpAndSettle();

    expect(find.text('Title is required'), findsOneWidget);
    expect(find.text('Amount is required'), findsOneWidget);
    expect(find.text('Please select a category'), findsOneWidget);
    expect(find.text('Please select a transaction type'), findsOneWidget);
    expect(find.text('Please select a date'), findsOneWidget);
  });

  testWidgets('Can add a transaction', (tester) async {
    final repository = await pumpApp(tester);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).at(0), 'Lunch');
    await tester.enterText(find.byType(TextFormField).at(1), '250');

    // Category dropdown
    await tester.tap(find.text('Select category'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Food').last);
    await tester.pumpAndSettle();

    // Type
    await tester.tap(find.text('Expense'));
    await tester.pumpAndSettle();

    // Date picker -> OK (আজকের তারিখ)
    await tester.tap(find.byType(DatePickerField));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ElevatedButton, 'Save Transaction'));
    await tester.pumpAndSettle();

    expect(repository.items.length, 1);
    expect(repository.items.first.title, 'Lunch');
    expect(find.text('Lunch'), findsOneWidget);
  });
}
