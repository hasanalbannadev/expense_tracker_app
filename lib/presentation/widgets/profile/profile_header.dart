// ============================================================
// profile_header.dart
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 44,
          backgroundColor: Color(0xFFD9DBF7),
          child: Icon(Icons.person_rounded, size: 52, color: AppColors.primary),
        ),
        SizedBox(height: 2),
        Text(
          AppConstants.appName,
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
