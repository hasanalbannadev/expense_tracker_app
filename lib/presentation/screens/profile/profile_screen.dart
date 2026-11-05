// ============================================================
// profile_screen.dart
// প্রোফাইল স্ক্রিন: ব্যবহারকারীর নাম ও মেনু তালিকা।
// ============================================================
import 'package:flutter/material.dart';

import '../../widgets/profile/profile_header.dart';
import '../../widgets/profile/profile_menu_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
      children: const [
        ProfileHeader(),
        SizedBox(height: 28),
        ProfileMenuList(),
      ],
    );
  }
}
