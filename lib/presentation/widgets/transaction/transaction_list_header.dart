// ============================================================
// transaction_list_header.dart
// "All Transactions"
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../providers/search_provider.dart';

class TransactionListHeader extends ConsumerStatefulWidget {
  const TransactionListHeader({super.key});

  @override
  ConsumerState<TransactionListHeader> createState() =>
      _TransactionListHeaderState();
}

class _TransactionListHeaderState extends ConsumerState<TransactionListHeader> {
  final _controller = TextEditingController();
  bool _isSearching = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() => _isSearching = !_isSearching);
    if (!_isSearching) {
      _controller.clear();
      ref.read(searchQueryProvider.notifier).clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _isSearching
                  ? TextField(
                      key: const ValueKey('search'),
                      controller: _controller,
                      autofocus: true,
                      onChanged: (value) =>
                          ref.read(searchQueryProvider.notifier).setQuery(value),
                      decoration: const InputDecoration(
                        hintText: 'Search transactions...',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 17),
                    )
                  : const Align(
                      key: ValueKey('title'),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.allTransactions,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
            ),
          ),
          IconButton(
            onPressed: _toggleSearch,
            icon: Icon(
              _isSearching ? Icons.close_rounded : Icons.search_rounded,
              size: 28,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
