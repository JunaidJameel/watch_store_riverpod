import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watch_store/const/app_typography.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: AppTypography.kBold16,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        children: [
          _SettingTile(
            title: "Account",
            icon: Iconsax.user,
            onTap: () {},
          ),
          _SettingTile(
            title: "Notifications",
            icon: Iconsax.notification,
            onTap: () {},
          ),
          _SettingTile(
            title: "Appearance",
            icon: Iconsax.colorfilter,
            onTap: () {},
          ),
          _SettingTile(
            title: "Privacy",
            icon: Iconsax.lock,
            onTap: () {},
          ),
          _SettingTile(
            title: "Help & Support",
            icon: Iconsax.message_question,
            onTap: () {},
          ),
          _SettingTile(
            title: "About",
            icon: Iconsax.info_circle,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _SettingTile({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title, style: AppTypography.kBold16),
      trailing: const Icon(Iconsax.arrow_right_3, color: Colors.grey),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
    );
  }
}
