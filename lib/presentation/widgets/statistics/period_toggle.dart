// ============================================================
// period_toggle.dart
// "This Month" / "Last Month" বাছাইয়ের দুটি বাটন।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../providers/statistics_provider.dart';

class PeriodToggle extends ConsumerWidget {
  const PeriodToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(statsPeriodProvider);

    return Row(
      children: [
        Expanded(
          child: _PeriodButton(
            label: 'This Month',
            isSelected: selected == StatsPeriod.thisMonth,
            onTap: () => ref
                .read(statsPeriodProvider.notifier)
                .select(StatsPeriod.thisMonth),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _PeriodButton(
            label: 'Last Month',
            isSelected: selected == StatsPeriod.lastMonth,
            onTap: () => ref
                .read(statsPeriodProvider.notifier)
                .select(StatsPeriod.lastMonth),
          ),
        ),
      ],
    );
  }
}

class _PeriodButton extends StatelessWidget {
  const _PeriodButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 46,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
