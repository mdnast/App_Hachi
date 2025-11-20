import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/article_model.dart';
import '../../models/plant_model.dart';
import '../../models/weather_model.dart';
import '../../services/article_service.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import '../../widgets/article_card.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/plant_tab_bar.dart';
import '../../widgets/weather_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    required this.onPlantSelected,
    required this.weather,
    required this.isLoadingWeather,
    required this.locationLabel,
    this.weatherError,
    required this.onRefreshWeather,
  });

  final ValueChanged<PlantSummary> onPlantSelected;
  final WeatherInfo weather;
  final bool isLoadingWeather;
  final String locationLabel;
  final String? weatherError;
  final VoidCallback onRefreshWeather;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedCategory = 0;
  late DateTime _now;
  Timer? _clockTimer;
  final ArticleService _articleService = ArticleService();
  late final List<PlantArticle> _articles;
  late final List<String> _categories;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _startClock();
    _articles = _articleService.fetchArticles();
    _categories = ['All Plant', ..._articleService.availableCategoryLabels()];
  }

  @override
  void dispose() {
    _clockTimer?.cancel();
    super.dispose();
  }

  void _startClock() {
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
      final now = DateTime.now();
      setState(() {
        _now = now;
      });

      // Tự refresh thời tiết định kỳ khi đang ở màn hình Home, tránh phải ấn tay.
      if (!widget.isLoadingWeather) {
        final lastUpdated = widget.weather.lastUpdated;
        if (now.difference(lastUpdated) > const Duration(minutes: 15)) {
          // Gọi callback refresh từ parent
          widget.onRefreshWeather();
        }
      }
    });
  }

  String get _greeting {
    final hour = _now.hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  void _handleArticleTap(PlantArticle article) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Would open article: ${article.url}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final subtitle = formatFullDate(_now);
    final weatherLabel =
        widget.isLoadingWeather && widget.weather.temperature == 0
        ? 'Updating…'
        : '${widget.weather.temperature.round()}°C';
    final weatherDescription = widget.isLoadingWeather
        ? 'Fetching latest weather data'
        : '${widget.weather.condition} • Low ${widget.weather.low.round()}°C • High ${widget.weather.high.round()}°C';
    final selectedCategoryLabel = _categories[_selectedCategory];
    final filteredArticles = selectedCategoryLabel == _categories.first
        ? _articles
        : _articles
              .where(
                (article) => article.category.label == selectedCategoryLabel,
              )
              .toList();

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: CustomAppBar(
        title: _greeting,
        subtitle: subtitle,
        weatherLabel: weatherLabel,
        weatherDescription: weatherDescription,
        onSearchTap: widget.onRefreshWeather,
        onNotificationTap: () {},
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: AppInsets.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppInsets.lg,
                vertical: AppInsets.lg,
              ),
              child: WeatherCard(
                weather: widget.weather,
                isLoading: widget.isLoadingWeather,
                onRefresh: widget.onRefreshWeather,
                locationLabel: widget.locationLabel,
                errorMessage: widget.weatherError,
                currentTime: _now,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppInsets.lg),
              child: Text('My Plantation', style: AppTextStyles.headingMedium),
            ),
            const SizedBox(height: AppInsets.sm),
            PlantTabBar(
              categories: _categories,
              selectedIndex: _selectedCategory,
              onCategorySelected: (index) {
                setState(() => _selectedCategory = index);
              },
            ),
            const SizedBox(height: AppInsets.sm),
            if (filteredArticles.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppInsets.lg,
                  vertical: AppInsets.md,
                ),
                child: Text(
                  'No articles for $selectedCategoryLabel yet.',
                  style: AppTextStyles.bodySmall,
                ),
              )
            else
              SizedBox(
                height: 340,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(right: AppInsets.lg),
                  itemCount: filteredArticles.length,
                  itemBuilder: (context, index) {
                    final article = filteredArticles[index];
                    return ArticleCard(
                      article: article,
                      onTap: () => _handleArticleTap(article),
                    );
                  },
                ),
              ),
            const SizedBox(height: AppInsets.lg),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppInsets.lg),
              child: Container(
                padding: const EdgeInsets.all(AppInsets.lg),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(AppCorners.lg),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(13),
                      blurRadius: 14,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Today's Weather", style: AppTextStyles.headingSmall),
                    const SizedBox(height: AppInsets.md),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _WeatherPeriod(
                          label: 'Morning',
                          temperature: '${widget.weather.low.round()}°',
                          icon: Icons.wb_sunny_outlined,
                          isHighlight: _now.hour >= 6 && _now.hour < 12,
                        ),
                        _WeatherPeriod(
                          label: 'Afternoon',
                          temperature: '${widget.weather.high.round()}°',
                          icon: Icons.wb_sunny,
                          isHighlight: _now.hour >= 12 && _now.hour < 17,
                        ),
                        _WeatherPeriod(
                          label: 'Evening',
                          temperature: '${widget.weather.temperature.round()}°',
                          icon: Icons.cloud_outlined,
                          isHighlight: _now.hour >= 17 && _now.hour < 21,
                        ),
                        _WeatherPeriod(
                          label: 'Night',
                          temperature: '${(widget.weather.low - 2).round()}°',
                          icon: Icons.nights_stay_outlined,
                          isHighlight: _now.hour >= 21 || _now.hour < 6,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppInsets.md),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.paleGreen,
                        borderRadius: BorderRadius.circular(AppCorners.md),
                      ),
                      child: Center(
                        child: Text(
                          'Sunrise ${widget.weather.sunrise}   ·   Sunset ${widget.weather.sunset}',
                          style: AppTextStyles.bodySmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherPeriod extends StatelessWidget {
  const _WeatherPeriod({
    required this.label,
    required this.temperature,
    required this.icon,
    this.isHighlight = false,
  });

  final String label;
  final String temperature;
  final IconData icon;
  final bool isHighlight;

  @override
  Widget build(BuildContext context) {
    final color = isHighlight ? AppColors.primaryGreen : AppColors.mutedText;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isHighlight
                ? AppColors.paleGreen
                : AppColors.lightBackground,
            borderRadius: BorderRadius.circular(AppCorners.md),
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 8),
        Text(label, style: AppTextStyles.caption.copyWith(color: color)),
        const SizedBox(height: 4),
        Text(
          temperature,
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.darkText),
        ),
      ],
    );
  }
}
