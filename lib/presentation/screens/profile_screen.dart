// ============================================================
// profile_screen.dart  (Presentation layer)
// Profile: avatar, নাম এবং মেনু (About, Clear Data, Settings ...)।
// ============================================================
import 'package:flutter/material.dart';

import '../widgets/common/responsive_body.dart';
import '../widgets/profile/profile_header.dart';
import '../widgets/profile/profile_menu_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBody(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: Column(
          children: [
            ProfileHeader(),
            SizedBox(height: 24),
            ProfileMenuList(),
          ],
        ),
      ),
    );
  }
}
