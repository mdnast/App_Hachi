import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../providers/auth_provider.dart';
import '../screens/admin/admin_dashboard_screen.dart';
import '../screens/auth/login_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.weatherLabel,
    required this.weatherDescription,
    required this.onSearchTap,
    required this.onNotificationTap,
    this.showBackArrow = false,
  });

  final String title;
  final String subtitle;
  final String weatherLabel;
  final String weatherDescription;
  final VoidCallback onSearchTap;
  final VoidCallback onNotificationTap;
  final bool showBackArrow;

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppInsets.lg,
        vertical: AppInsets.md,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF7BBB55), // Primary green
            Color(0xFF6AA348), // Secondary green
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7BBB55).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (showBackArrow)
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                if (showBackArrow) const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.headingSmall.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      if (subtitle.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                // User menu button
                const _UserMenuPlaceholder(),
              ],
            ),
            // Weather card removed for cleaner design
            // const SizedBox(height: AppInsets.md),
            // Container(
            //   padding: const EdgeInsets.all(AppInsets.md),
            //   decoration: BoxDecoration(
            //     color: Colors.white.withAlpha(26),
            //     borderRadius: BorderRadius.circular(AppCorners.md),
            //   ),
            //   child: Row(
            //     children: [
            //       const Icon(Icons.wb_sunny_outlined, color: Colors.white),
            //       const SizedBox(width: AppInsets.sm),
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               weatherLabel,
            //               style: AppTextStyles.bodyMedium.copyWith(
            //                 color: Colors.white,
            //               ),
            //             ),
            //             const SizedBox(height: 2),
            //             Text(
            //               weatherDescription,
            //               style: AppTextStyles.bodySmall.copyWith(
            //                 color: Colors.white70,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       IconButton(
            //         onPressed: onSearchTap,
            //         icon: const Icon(Icons.refresh, color: Colors.white),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class _UserMenuPlaceholder extends StatelessWidget {
  const _UserMenuPlaceholder();

  Future<void> _showUserMenu(BuildContext context) async {
    final authProvider = context.read<AuthProvider>();
    final user = authProvider.currentUserData;

    if (user == null) return;

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // User info
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: user.isAdmin
                      ? Colors.purple
                      : AppColors.primaryGreen,
                  child: Text(
                    user.displayName.isNotEmpty
                        ? user.displayName[0].toUpperCase()
                        : '?',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.displayName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        user.role.displayName,
                        style: TextStyle(
                          fontSize: 12,
                          color: user.isAdmin
                              ? Colors.purple
                              : AppColors.primaryGreen,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),

            // Admin menu
            if (user.isAdmin)
              ListTile(
                leading: const Icon(
                  Icons.admin_panel_settings,
                  color: Colors.purple,
                ),
                title: const Text('Quản lý Users'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminDashboardScreen(),
                    ),
                  );
                },
              ),

            // Logout
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Đăng xuất',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () async {
                Navigator.pop(context);
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Đăng xuất'),
                    content: const Text('Bạn có chắc muốn đăng xuất?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Hủy'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                        child: const Text('Đăng xuất'),
                      ),
                    ],
                  ),
                );

                if (confirmed == true && context.mounted) {
                  await context.read<AuthProvider>().signOut();
                  // Force navigate to LoginScreen using root navigator
                  if (context.mounted) {
                    Navigator.of(
                      context,
                      rootNavigator: true,
                    ).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.currentUserData;

    if (user == null) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () => _showUserMenu(context),
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        child: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white.withOpacity(0.3),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: user.isAdmin ? Colors.purple : Colors.white,
            child: Text(
              user.displayName.isNotEmpty
                  ? user.displayName[0].toUpperCase()
                  : '?',
              style: TextStyle(
                color: user.isAdmin ? Colors.white : AppColors.primaryGreen,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
