// ============================================================
// profile_menu_list.dart
// About App, Clear Data, Settings, Privacy Policy, Logout — পাঁচটি মেনু।
//  - Clear Data: নিশ্চিতকরণের পর ডাটাবেসের সব লেনদেন মোছে
//  - Logout: অ্যাপে লগইন নেই, তাই এটি শুধু ডেমো মেসেজ দেখায়
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../providers/navigation_provider.dart';
import '../../providers/transactions_notifier.dart';
import '../common/app_snackbar.dart';
import '../common/confirm_dialog.dart';
import 'profile_menu_tile.dart';

class ProfileMenuList extends ConsumerWidget {
  const ProfileMenuList({super.key});

  void _showAbout(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: AppConstants.appName,
      applicationVersion: AppConstants.appVersion,
      applicationLegalese: 'Built with Flutter, Riverpod and Sqflite.',
    );
  }

  void _showPrivacy(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Privacy Policy'),
        content: const Text(
          'All your transactions are stored only on this device in a local '
          'SQLite database. No data is sent to any server.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _clearData(BuildContext context, WidgetRef ref) async {
    final confirmed = await showConfirmDialog(
      context,
      icon: Icons.delete_sweep_rounded,
      title: 'Clear all data?',
      message: 'This will permanently delete every transaction.',
      confirmLabel: 'Clear',
    );
    if (!confirmed || !context.mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    await ref.read(transactionsProvider.notifier).clearAll();
    AppSnackBar.show(messenger, 'All data cleared');
  }

  Future<void> _logout(BuildContext context, WidgetRef ref) async {
    final confirmed = await showConfirmDialog(
      context,
      icon: Icons.logout_rounded,
      title: 'Logout?',
      message: 'Are you sure you want to logout?',
      confirmLabel: 'Logout',
    );
    if (!confirmed || !context.mounted) return;

    ref.read(bottomNavIndexProvider.notifier).setIndex(0);
    AppSnackBar.show(ScaffoldMessenger.of(context), 'Logged out (demo)');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ProfileMenuTile(
            icon: Icons.info_rounded,
            iconColor: AppColors.textSecondary,
            title: 'About App',
            onTap: () => _showAbout(context),
          ),
          const Divider(height: 1, color: AppColors.divider),
          ProfileMenuTile(
            icon: Icons.delete_rounded,
            iconColor: AppColors.expense,
            title: 'Clear Data',
            onTap: () => _clearData(context, ref),
          ),
          const Divider(height: 1, color: AppColors.divider),
          ProfileMenuTile(
            icon: Icons.settings_rounded,
            iconColor: AppColors.textPrimary,
            title: 'Settings',
            onTap: () => AppSnackBar.show(
              ScaffoldMessenger.of(context),
              'Settings coming soon',
            ),
          ),
          const Divider(height: 1, color: AppColors.divider),
          ProfileMenuTile(
            icon: Icons.shield_rounded,
            iconColor: AppColors.primary,
            title: 'Privacy Policy',
            onTap: () => _showPrivacy(context),
          ),
          const Divider(height: 1, color: AppColors.divider),
          ProfileMenuTile(
            icon: Icons.logout_rounded,
            iconColor: AppColors.expense,
            title: 'Logout',
            onTap: () => _logout(context, ref),
          ),
        ],
      ),
    );
  }
}
