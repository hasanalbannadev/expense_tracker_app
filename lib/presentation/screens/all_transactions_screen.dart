// ============================================================
// all_transactions_screen.dart  (Presentation layer)
// সব transaction এর তালিকা (ListView.builder) + search সুবিধা।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/search_providers.dart';
import '../widgets/common/responsive_body.dart';
import '../widgets/transactions/transactions_header.dart';
import '../widgets/transactions/transactions_list.dart';

class AllTransactionsScreen extends ConsumerStatefulWidget {
  const AllTransactionsScreen({super.key});

  @override
  ConsumerState<AllTransactionsScreen> createState() =>
      _AllTransactionsScreenState();
}

class _AllTransactionsScreenState extends ConsumerState<AllTransactionsScreen> {
  final _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _closeSearch() {
    _searchController.clear();
    ref.read(searchQueryProvider.notifier).setQuery('');
    setState(() => _isSearching = false);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBody(
      child: Column(
        children: [
          TransactionsHeader(
            isSearching: _isSearching,
            controller: _searchController,
            onChanged: (value) =>
                ref.read(searchQueryProvider.notifier).setQuery(value),
            onOpenSearch: () => setState(() => _isSearching = true),
            onCloseSearch: _closeSearch,
          ),
          const Expanded(child: TransactionsList()),
        ],
      ),
    );
  }
}
