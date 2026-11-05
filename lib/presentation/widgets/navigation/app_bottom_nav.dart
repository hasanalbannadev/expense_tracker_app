// ============================================================
// app_bottom_nav.dart
// নিচের ৪টি ট্যাব: Home, List, Stats, Profile।
// সিলেক্ট করা ট্যাব ইন্ডিগো রঙের ও নিচে ছোট দাগ থাকে (mockup এর মতো)।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    _NavData(Icons.home_rounded, 'Home'),
    _NavData(Icons.format_list_bulleted_rounded, 'List'),
    _NavData(Icons.bar_chart_rounded, 'Stats'),
    _NavData(Icons.person_rounded, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 16,
      shadowColor: Colors.black.withAlpha(38),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 66,
          child: Row(
            children: [
              for (var i = 0; i < _items.length; i++)
                Expanded(
                  child: _NavItem(
                    data: _items[i],
                    isSelected: i == currentIndex,
                    onTap: () => onTap(i),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavData {
  const _NavData(this.icon, this.label);

  final IconData icon;
  final String label;
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.data,
    required this.isSelected,
    required this.onTap,
  });

  final _NavData data;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.primary : AppColors.textSecondary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(data.icon, color: color, size: 26),
          const SizedBox(height: 2),
          Text(
            data.label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isSelected ? 26 : 0,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
