import 'package:flutter/material.dart';

import '../models/plant_model.dart';
import '../utils/constants.dart';

class PlantItemCard extends StatelessWidget {
  const PlantItemCard({
    super.key,
    required this.plant,
    required this.onTap,
  });

  final PlantSummary plant;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        margin: const EdgeInsets.only(left: AppInsets.lg, top: AppInsets.md, bottom: AppInsets.md),
        padding: const EdgeInsets.all(AppInsets.md),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppCorners.lg),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.paleGreen,
                borderRadius: BorderRadius.circular(AppCorners.md),
              ),
              child: const Center(
                child: Icon(Icons.image, color: AppColors.primaryGreen, size: 48),
              ),
            ),
            const SizedBox(height: AppInsets.md),
            Text(
              '${plant.totalPlants} Plants',
              style: AppTextStyles.caption,
            ),
            const SizedBox(height: 4),
            Text(plant.name, style: AppTextStyles.headingSmall),
            const SizedBox(height: 4),
            Text(
              plant.location,
              style: AppTextStyles.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppInsets.sm),
            Container(
              padding: const EdgeInsets.all(AppInsets.sm),
              decoration: BoxDecoration(
                color: AppColors.paleGreen,
                borderRadius: BorderRadius.circular(AppCorners.sm),
              ),
              child: Row(
                children: [
                  const Icon(Icons.thermostat, size: 16, color: AppColors.primaryGreen),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      '${plant.temperature}°C',
                      style: AppTextStyles.bodySmall.copyWith(color: AppColors.primaryGreen),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      plant.plannedActivity,
                      style: AppTextStyles.caption.copyWith(color: AppColors.primaryGreen),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
