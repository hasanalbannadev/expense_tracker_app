// ============================================================
// profile_menu_list.dart
// Profile এর মেনু: About App, Clear Data, Settings, Privacy Policy, Logout।
//  - Clear Data : নিশ্চিত করার পর database এর সব transaction মুছে ফেলে
//  - বাকিগুলো ছোট info dialog / message দেখায় (অ্যাপটি offline, login নেই)
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../providers/transaction_notifier.dart';
import '../common/confirm_dialog.dart';
import 'profile_menu_item.dart';

class ProfileMenuList extends ConsumerWidget {
  const ProfileMenuList({super.key});

  void _showAbout(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: AppConstants.appName,
      applicationVersion: AppConstants.appVersion,
      applicationLegalese: 'Track your daily income and expenses offline.',
    );
  }

  Future<void> _clearData(BuildContext context, WidgetRef ref) async {
    final confirmed = await ConfirmDialog.show(
      context,
      title: 'Clear All Data?',
      message: 'This will permanently delete all your transactions.',
      confirmLabel: 'Clear',
    );
    if (!confirmed || !context.mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    await ref.read(transactionListProvider.notifier).clearAll();
    messenger.showSnackBar(const SnackBar(content: Text('All data cleared')));
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  void _showPrivacy(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: const Text('Privacy Policy'),
        content: const Text(
          'All your transactions are stored only on this device. '
          'No data is sent to any server.',
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const divider = Divider(height: 1, indent: 16, endIndent: 16);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ProfileMenuItem(
            icon: Icons.info_rounded,
            iconColor: AppColors.textSecondary,
            label: 'About App',
            onTap: () => _showAbout(context),
          ),
          divider,
          ProfileMenuItem(
            icon: Icons.delete_rounded,
            iconColor: AppColors.expense,
            label: 'Clear Data',
            onTap: () => _clearData(context, ref),
          ),
          divider,
          ProfileMenuItem(
            icon: Icons.settings_rounded,
            label: 'Settings',
            onTap: () => _showMessage(context, 'Settings coming soon'),
          ),
          divider,
          ProfileMenuItem(
            icon: Icons.shield_rounded,
            iconColor: AppColors.primary,
            label: 'Privacy Policy',
            onTap: () => _showPrivacy(context),
          ),
          divider,
          ProfileMenuItem(
            icon: Icons.logout_rounded,
            iconColor: AppColors.expense,
            label: 'Logout',
            onTap: () => _showMessage(
              context,
              'No account needed - this app works offline',
            ),
          ),
        ],
      ),
    );
  }
}
