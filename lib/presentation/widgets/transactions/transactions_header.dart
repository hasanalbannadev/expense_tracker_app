// ============================================================
// transactions_header.dart
// All Transactions এর উপরের অংশ:
//   সাধারণ অবস্থায়  : শিরোনাম + search আইকন
//   search অবস্থায়  : search বক্স + close আইকন
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class TransactionsHeader extends StatelessWidget {
  final bool isSearching;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onOpenSearch;
  final VoidCallback onCloseSearch;

  const TransactionsHeader({
    super.key,
    required this.isSearching,
    required this.controller,
    required this.onChanged,
    required this.onOpenSearch,
    required this.onCloseSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 8, 8),
      child: isSearching
          ? Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    autofocus: true,
                    onChanged: onChanged,
                    decoration: const InputDecoration(
                      hintText: 'Search title or category',
                      prefixIcon: Icon(Icons.search_rounded),
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'Close search',
                  icon: const Icon(Icons.close_rounded),
                  onPressed: onCloseSearch,
                ),
              ],
            )
          : Row(
              children: [
                const Expanded(
                  child: Text(
                    'All Transactions',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'Search',
                  icon: const Icon(
                    Icons.search_rounded,
                    size: 28,
                    color: AppColors.textPrimary,
                  ),
                  onPressed: onOpenSearch,
                ),
              ],
            ),
    );
  }
}
