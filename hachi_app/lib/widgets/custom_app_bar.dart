import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.weatherLabel,
    required this.weatherDescription,
    required this.onSearchTap,
    required this.onNotificationTap,
  });

  final String title;
  final String subtitle;
  final String weatherLabel;
  final String weatherDescription;
  final VoidCallback onSearchTap;
  final VoidCallback onNotificationTap;

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
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onNotificationTap,
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                ),
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
