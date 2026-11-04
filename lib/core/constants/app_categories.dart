// ============================================================
// app_categories.dart
// Category এর তালিকা + প্রতিটির icon ও রং।
// Database এ শুধু category এর নাম (TEXT) সেভ হয়।
// ============================================================
import 'package:flutter/material.dart';

class CategoryInfo {
  final String name;
  final IconData icon;
  final Color color; // icon এর রং
  final Color background; // গোল বৃত্তের হালকা রং

  const CategoryInfo({
    required this.name,
    required this.icon,
    required this.color,
    required this.background,
  });
}

class AppCategories {
  AppCategories._();

  static const List<CategoryInfo> all = [
    CategoryInfo(
      name: 'Salary',
      icon: Icons.account_balance_wallet_rounded,
      color: Color(0xFF16A34A),
      background: Color(0xFFDCFCE7),
    ),
    CategoryInfo(
      name: 'Freelance',
      icon: Icons.laptop_mac_rounded,
      color: Color(0xFF4F46E5),
      background: Color(0xFFE0E7FF),
    ),
    CategoryInfo(
      name: 'Food',
      icon: Icons.restaurant_rounded,
      color: Color(0xFFEF4444),
      background: Color(0xFFFEE2E2),
    ),
    CategoryInfo(
      name: 'Shopping',
      icon: Icons.shopping_cart_rounded,
      color: Color(0xFF2563EB),
      background: Color(0xFFDBEAFE),
    ),
    CategoryInfo(
      name: 'Gift',
      icon: Icons.card_giftcard_rounded,
      color: Color(0xFF6D28D9),
      background: Color(0xFFEDE9FE),
    ),
    CategoryInfo(
      name: 'Transport',
      icon: Icons.directions_bus_rounded,
      color: Color(0xFFEA580C),
      background: Color(0xFFFFEDD5),
    ),
    CategoryInfo(
      name: 'Bills',
      icon: Icons.receipt_long_rounded,
      color: Color(0xFF0D9488),
      background: Color(0xFFCCFBF1),
    ),
    CategoryInfo(
      name: 'Health',
      icon: Icons.favorite_rounded,
      color: Color(0xFFDB2777),
      background: Color(0xFFFCE7F3),
    ),
    CategoryInfo(
      name: 'Education',
      icon: Icons.school_rounded,
      color: Color(0xFF0284C7),
      background: Color(0xFFE0F2FE),
    ),
    CategoryInfo(
      name: 'Other',
      icon: Icons.category_rounded,
      color: Color(0xFF4B5563),
      background: Color(0xFFF3F4F6),
    ),
  ];

  /// শুধু নামের তালিকা (Dropdown এর জন্য)
  static List<String> get names => all.map((c) => c.name).toList();

  /// নাম দিয়ে category খোঁজা; না পেলে "Other" ফেরত দেয়
  static CategoryInfo byName(String name) {
    return all.firstWhere((c) => c.name == name, orElse: () => all.last);
  }
}
