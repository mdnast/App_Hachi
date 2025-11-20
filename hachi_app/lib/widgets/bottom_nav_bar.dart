import 'dart:ui'; // For ImageFilter
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
      minimum: const EdgeInsets.only(bottom: AppInsets.md),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppInsets.md,
        ), // Reduced margin from lg to md
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppInsets.xs, // Reduced padding from sm to xs
                vertical: AppInsets.sm,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                  width: 1.5,
                ),
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
          ),
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
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutQuart,
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? 12 : 8, // Reduced padding: 16->12, 12->8
          vertical: 10, // Reduced vertical padding slightly
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: AppColors.primaryGreen.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              item.icon,
              color: isActive ? Colors.white : AppColors.mutedText,
              size: 24,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: SizedBox(
                width: isActive ? null : 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    item.label,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
