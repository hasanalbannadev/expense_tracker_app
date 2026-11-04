// ============================================================
// profile_header.dart
// Profile এর উপরের অংশ: গোল avatar, নাম ও অ্যাপের নাম।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          CircleAvatar(
            radius: 46,
            backgroundColor: Color(0xFFC7D2FE),
            child: Icon(Icons.person_rounded, size: 56, color: AppColors.primary),
          ),
          SizedBox(height: 14),
          Text(
            AppConstants.profileName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 2),
          Text(
            AppConstants.appName,
            style: TextStyle(fontSize: 15, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
