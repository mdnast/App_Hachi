import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryGreen = Color(0xFF7BBB55);
  static const Color secondaryGreen = Color(0xFF6AA348);
  static const Color accentOrange = Color(0xFFF9A14A);
  static const Color lightBackground = Color(0xFFF5F7F9);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color darkText = Color(0xFF162C2B);
  static const Color mutedText = Color(0xFF6F7D86);
  static const Color paleGreen = Color(0xFFE6F4F1);
  static const Color paleOrange = Color(0xFFFFF2E6);
  static const Color borderColor = Color(0xFFE1E6EA);
}

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle headingLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.darkText,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.darkText,
  );

  static const TextStyle headingSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.darkText,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.darkText,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.mutedText,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.mutedText,
  );
}

class AppInsets {
  AppInsets._();

  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

class AppCorners {
  AppCorners._();

  static const double sm = 12;
  static const double md = 20;
  static const double lg = 28;
}

class AppConstants {
  AppConstants._();

  static const String appName = 'Hachi Weather';

  // WeatherAPI.com configuration
  static const String apiKey = 'a4cdb439d6b745bfbf5110911251711';
  static const String baseUrl = 'https://api.weatherapi.com/v1';

  static const String defaultCity = 'Hanoi';

  static const Duration cacheExpiration = Duration(minutes: 30);
  static const Duration requestTimeout = Duration(seconds: 10);
}
