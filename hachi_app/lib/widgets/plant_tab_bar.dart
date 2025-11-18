import 'package:flutter/material.dart';

import '../utils/constants.dart';

class PlantTabBar extends StatelessWidget {
  const PlantTabBar({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppInsets.lg),
        itemBuilder: (_, index) {
          final isSelected = selectedIndex == index;
          return ChoiceChip(
            label: Text(categories[index]),
            selected: isSelected,
            onSelected: (_) => onCategorySelected(index),
            backgroundColor: Colors.white,
            selectedColor: AppColors.primaryGreen,
            labelStyle: AppTextStyles.bodySmall.copyWith(
              color: isSelected ? Colors.white : AppColors.mutedText,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppCorners.md),
              side: const BorderSide(color: AppColors.borderColor),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: AppInsets.sm),
        itemCount: categories.length,
      ),
    );
  }
}
