import 'package:flutter/material.dart';

import '../utils/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    final items = [
      _BottomNavItem(Icons.home_rounded, 'Home'),
      _BottomNavItem(Icons.eco_rounded, 'Plant'),
      _BottomNavItem(Icons.calendar_today_rounded, 'Schedule'),
      _BottomNavItem(Icons.cloud_outlined, 'Weather'),
      _BottomNavItem(Icons.shopping_bag_outlined, 'Market'),
    ];

    return SafeArea(
      top: false,
      minimum: const EdgeInsets.only(bottom: AppInsets.xs),
      child: Container(
        margin: const EdgeInsets.fromLTRB(AppInsets.md, 0, AppInsets.md, AppInsets.sm),
        padding: const EdgeInsets.symmetric(horizontal: AppInsets.md, vertical: AppInsets.xs),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppCorners.md),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(12),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 0; i < items.length; i++)
              _BottomNavButton(
                item: items[i],
                isActive: currentIndex == i,
                onTap: () => onItemSelected(i),
              ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavItem {
  const _BottomNavItem(this.icon, this.label);

  final IconData icon;
  final String label;
}

class _BottomNavButton extends StatelessWidget {
  const _BottomNavButton({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  final _BottomNavItem item;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.primaryGreen : AppColors.mutedText;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: AppInsets.xs, vertical: 4),
        decoration: BoxDecoration(
          color: isActive ? AppColors.paleGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(AppCorners.md),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(item.icon, color: color),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: AppTextStyles.caption.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
