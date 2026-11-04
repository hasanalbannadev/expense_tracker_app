// ============================================================
// period_toggle.dart
// "This Month" / "Last Month" বাছাই করার দুটি বাটন।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../providers/stats_providers.dart';

class PeriodToggle extends ConsumerWidget {
  const PeriodToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(statsPeriodProvider);

    return Row(
      children: [
        for (final period in StatsPeriod.values) ...[
          Expanded(
            child: _PeriodButton(
              label: period.label,
              selected: period == selected,
              onTap: () =>
                  ref.read(statsPeriodProvider.notifier).setPeriod(period),
            ),
          ),
          if (period != StatsPeriod.values.last) const SizedBox(width: 12),
        ],
      ],
    );
  }
}

class _PeriodButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _PeriodButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.primary : Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: SizedBox(
          height: 46,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: selected ? Colors.white : AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
