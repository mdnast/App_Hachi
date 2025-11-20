import 'package:flutter/material.dart';

import '../models/weather_model.dart';
import '../utils/constants.dart';
import '../utils/helpers.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.weather,
    required this.isLoading,
    required this.onRefresh,
    this.errorMessage,
    this.locationLabel,
    this.currentTime,
  });

  final WeatherInfo weather;
  final bool isLoading;
  final VoidCallback onRefresh;
  final String? errorMessage;
  final String? locationLabel;
  final DateTime? currentTime;

  @override
  Widget build(BuildContext context) {
    final hasMeasurements =
        weather.temperature != 0 || weather.low != 0 || weather.high != 0;
    final tempLabel = hasMeasurements
        ? '${weather.temperature.round()}°C'
        : '--°C';
    final rangeLabel = hasMeasurements
        ? 'Thấp ${weather.low.round()}°C  ·  Cao ${weather.high.round()}°C'
        : 'Thấp --°C  ·  Cao --°C';
    final updatedLabel = currentTime != null
        ? 'Giờ địa phương: ${formatTime(currentTime!)}'
        : (hasMeasurements
              ? 'Cập nhật ${formatTime(weather.lastUpdated)}'
              : 'Đang chờ cập nhật mới nhất');

    return Container(
      padding: const EdgeInsets.all(AppInsets.lg),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppCorners.lg),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locationLabel ?? 'Weather',
                      style: AppTextStyles.headingSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(weather.condition, style: AppTextStyles.bodySmall),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.paleGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.wb_sunny,
                  color: AppColors.primaryGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppInsets.md),
          Text(
            tempLabel,
            style: AppTextStyles.headingLarge.copyWith(fontSize: 40),
          ),
          const SizedBox(height: 8),
          Text(rangeLabel, style: AppTextStyles.bodySmall),
          const SizedBox(height: AppInsets.sm),
          Text(updatedLabel, style: AppTextStyles.caption),
          if (errorMessage != null) ...[
            const SizedBox(height: AppInsets.sm),
            Text(
              errorMessage!,
              style: AppTextStyles.bodySmall.copyWith(color: Colors.redAccent),
            ),
          ],
          const SizedBox(height: AppInsets.md),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: isLoading ? null : onRefresh,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.refresh, size: 16),
              label: Text(
                isLoading ? 'Đang cập nhật…' : 'Làm mới',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.primaryGreen,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
