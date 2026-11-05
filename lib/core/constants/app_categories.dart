// ============================================================
// app_categories.dart
// ক্যাটাগরির তালিকা (Dropdown এ দেখাবে)। প্রতিটি ক্যাটাগরির আইকন ও রং আছে।
// ডাটাবেসে শুধু ক্যাটাগরির নাম (String) সেভ হয়।
// ============================================================
import 'package:flutter/material.dart';

class TransactionCategory {
  const TransactionCategory({
    required this.name,
    required this.icon,
    required this.color,
    required this.background,
  });

  final String name;
  final IconData icon;
  final Color color;
  final Color background;
}

class AppCategories {
  AppCategories._();

  static const TransactionCategory other = TransactionCategory(
    name: 'Other',
    icon: Icons.category_rounded,
    color: Color(0xFF64748B),
    background: Color(0xFFECEFF4),
  );

  static const List<TransactionCategory> all = [
    TransactionCategory(
      name: 'Salary',
      icon: Icons.account_balance_wallet_rounded,
      color: Color(0xFF16A34A),
      background: Color(0xFFDDF5E6),
    ),
    TransactionCategory(
      name: 'Freelance',
      icon: Icons.laptop_mac_rounded,
      color: Color(0xFF3F3DA8),
      background: Color(0xFFE8E9FA),
    ),
    TransactionCategory(
      name: 'Food',
      icon: Icons.restaurant_rounded,
      color: Color(0xFFEF4444),
      background: Color(0xFFFDE4E4),
    ),
    TransactionCategory(
      name: 'Shopping',
      icon: Icons.shopping_cart_rounded,
      color: Color(0xFF2563EB),
      background: Color(0xFFE3EEFF),
    ),
    TransactionCategory(
      name: 'Gift',
      icon: Icons.card_giftcard_rounded,
      color: Color(0xFF4F46E5),
      background: Color(0xFFEDEBFF),
    ),
    TransactionCategory(
      name: 'Transport',
      icon: Icons.directions_bus_rounded,
      color: Color(0xFFD97706),
      background: Color(0xFFFEF3D9),
    ),
    TransactionCategory(
      name: 'Bills',
      icon: Icons.receipt_long_rounded,
      color: Color(0xFF0D9488),
      background: Color(0xFFD9F4F0),
    ),
    TransactionCategory(
      name: 'Health',
      icon: Icons.medical_services_rounded,
      color: Color(0xFFDB2777),
      background: Color(0xFFFCE4F0),
    ),
    TransactionCategory(
      name: 'Education',
      icon: Icons.school_rounded,
      color: Color(0xFF7C3AED),
      background: Color(0xFFEFE6FD),
    ),
    other,
  ];

  /// নাম দিয়ে ক্যাটাগরি খোঁজে; না পেলে "Other" ফেরত দেয়।
  static TransactionCategory byName(String name) {
    for (final category in all) {
      if (category.name == name) return category;
    }
    return other;
  }
}
