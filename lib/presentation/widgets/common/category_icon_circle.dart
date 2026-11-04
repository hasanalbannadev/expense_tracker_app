// ============================================================
// category_icon_circle.dart
// Category এর রঙিন গোল আইকন (list item এ ব্যবহার হয়)।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_categories.dart';

class CategoryIconCircle extends StatelessWidget {
  final String category;
  final double size;

  const CategoryIconCircle({super.key, required this.category, this.size = 48});

  @override
  Widget build(BuildContext context) {
    final info = AppCategories.byName(category);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: info.background, shape: BoxShape.circle),
      child: Icon(info.icon, color: info.color, size: size * 0.5),
    );
  }
}
