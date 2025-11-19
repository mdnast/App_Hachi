import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/article_model.dart';
import '../../models/plant_model.dart';
import '../../models/weather_model.dart';
import '../../services/article_service.dart';
import '../../services/location_service.dart';
import '../../services/weather_service.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import '../../widgets/article_card.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/plant_tab_bar.dart';
import '../../widgets/weather_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.onPlantSelected});

  final ValueChanged<PlantSummary> onPlantSelected;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedCategory = 0;
  late DateTime _now;
  Timer? _clockTimer;
  final WeatherService _weatherService = WeatherService();
  final LocationService _locationService = const LocationService();
  WeatherInfo _weather = WeatherInfo.placeholder();
  bool _isLoadingWeather = true;
  String? _weatherError;
  final ArticleService _articleService = ArticleService();
  late final List<PlantArticle> _articles;
  late final List<String> _categories;
  String _locationLabel = 'Detecting location…';

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _startClock();
    _loadWeather();
    _articles = _articleService.fetchArticles();
    _categories = ['All Plant', ..._articleService.availableCategoryLabels()];
  }

  @override
  void dispose() {
    _clockTimer?.cancel();
    super.dispose();
  }

  void _startClock() {
    _clockTimer = Timer.periodic(const Duration(minutes: 1), (_) async {
      final now = DateTime.now();
      setState(() {
        _now = now;
      });

      // Tự refresh thời tiết định kỳ khi đang ở màn hình Home, tránh phải ấn tay.
      if (!_isLoadingWeather) {
        final lastUpdated = _weather.lastUpdated;
        if (now.difference(lastUpdated) > const Duration(minutes: 15)) {
          // Không chờ kết quả trong timer; để _loadWeather tự quản lý state.
          unawaited(_loadWeather());
        }
      }
    });
  }

  Future<void> _loadWeather() async {
    setState(() {
      _isLoadingWeather = true;
      _weatherError = null;
    });
    try {
      final position = await _locationService.getCurrentPosition();

      // Thử reverse geocoding; nếu lỗi thì vẫn dùng thời tiết theo toạ độ nhưng label chung.
      String locationLabel;
      try {
        locationLabel = await _locationService.getLocationLabelFrom(position);
      } catch (_) {
        locationLabel = 'Current location';
      }

      final weather = await _weatherService.fetchCurrentWeatherFor(
        position.latitude,
        position.longitude,
      );

      setState(() {
        _weather = weather;
        _isLoadingWeather = false;
        _locationLabel = locationLabel;
        _weatherError = null;
      });
    } catch (error) {
      setState(() {
        _isLoadingWeather = false;
        _weatherError = 'Không thể cập nhật thời tiết. Vui lòng bật GPS + internet rồi thử lại.';
      });
    }
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
    final weatherLabel = _isLoadingWeather && _weather.temperature == 0
        ? 'Updating…'
        : '${_weather.temperature.round()}°C';
    final weatherDescription = _isLoadingWeather
        ? 'Fetching latest weather data'
        : '${_weather.condition} • Low ${_weather.low.round()}°C • High ${_weather.high.round()}°C';
    final selectedCategoryLabel = _categories[_selectedCategory];
    final filteredArticles = selectedCategoryLabel == _categories.first
        ? _articles
        : _articles.where((article) => article.category.label == selectedCategoryLabel).toList();

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: CustomAppBar(
        title: _greeting,
        subtitle: subtitle,
        weatherLabel: weatherLabel,
        weatherDescription: weatherDescription,
        onSearchTap: _loadWeather,
        onNotificationTap: () {},
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: AppInsets.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppInsets.lg, vertical: AppInsets.lg),
              child: WeatherCard(
                weather: _weather,
                isLoading: _isLoadingWeather,
                onRefresh: _loadWeather,
                locationLabel: _locationLabel,
                errorMessage: _weatherError,
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
                padding: const EdgeInsets.symmetric(horizontal: AppInsets.lg, vertical: AppInsets.md),
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
                      children: const [
                        _WeatherPeriod(label: 'Morning', temperature: '18°', icon: Icons.wb_sunny_outlined),
                        _WeatherPeriod(label: 'Afternoon', temperature: '30°', icon: Icons.wb_sunny),
                        _WeatherPeriod(label: 'Evening', temperature: '24°', icon: Icons.cloud_outlined, isHighlight: true),
                        _WeatherPeriod(label: 'Night', temperature: '19°', icon: Icons.nights_stay_outlined),
                      ],
                    ),
                    const SizedBox(height: AppInsets.md),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.paleGreen,
                        borderRadius: BorderRadius.circular(AppCorners.md),
                      ),
                      child: const Center(
                        child: Text(
                          'Sunrise 5:20 AM   ·   Sunset 5:58 PM',
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
            color: isHighlight ? AppColors.paleGreen : AppColors.lightBackground,
            borderRadius: BorderRadius.circular(AppCorners.md),
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(color: color),
        ),
        const SizedBox(height: 4),
        Text(
          temperature,
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.darkText),
        ),
      ],
    );
  }
}
