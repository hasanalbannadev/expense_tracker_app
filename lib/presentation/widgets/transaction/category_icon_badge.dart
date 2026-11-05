// ============================================================
// category_icon_badge.dart
// ক্যাটাগরির রঙিন গোল-চৌকো আইকন (List ও Dashboard এ ব্যবহার হয়)।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_categories.dart';

class CategoryIconBadge extends StatelessWidget {
  const CategoryIconBadge({
    super.key,
    required this.categoryName,
    this.size = 48,
  });

  final String categoryName;
  final double size;

  @override
  Widget build(BuildContext context) {
    final category = AppCategories.byName(categoryName);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: category.background,
        borderRadius: BorderRadius.circular(size * 0.3),
      ),
      child: Icon(category.icon, color: category.color, size: size * 0.5),
    );
  }
}
