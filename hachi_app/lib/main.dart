import 'package:flutter/material.dart';

import 'models/plant_model.dart';
import 'models/weather_model.dart';
import 'services/location_service.dart';
import 'services/weather_service.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/plant_detail/plant_detail_screen.dart';
import 'screens/schedule/schedule_screen.dart';
import 'screens/weather_forecast/weather_screen.dart';
import 'screens/shop/shop_screen.dart';
import 'utils/constants.dart';
import 'widgets/bottom_nav_bar.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('vi', null).then((_) {
    runApp(const HachiApp());
  });
}

class HachiApp extends StatelessWidget {
  const HachiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hachi Plantation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.lightBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryGreen,
          primary: AppColors.primaryGreen,
          secondary: AppColors.secondaryGreen,
        ),
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: AppColors.darkText,
          displayColor: AppColors.darkText,
        ),
      ),
      home: const _HomeShell(),
    );
  }
}

class _HomeShell extends StatefulWidget {
  const _HomeShell();

  @override
  State<_HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<_HomeShell> {
  int _currentIndex = 0;
  final WeatherService _weatherService = WeatherService();
  final LocationService _locationService = const LocationService();
  WeatherInfo _weather = WeatherInfo.placeholder();
  bool _isLoadingWeather = true;
  String? _weatherError;
  String _locationLabel = 'Đang xác định vị trí…';

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    setState(() {
      _isLoadingWeather = true;
      _weatherError = null;
    });
    try {
      final position = await _locationService.getCurrentPosition();

      String locationLabel;
      try {
        locationLabel = await _locationService.getLocationLabelFrom(position);
      } catch (_) {
        locationLabel = 'Vị trí hiện tại';
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
        _weatherError =
            'Không thể cập nhật thời tiết. Vui lòng bật GPS + internet rồi thử lại.';
      });
    }
  }

  void _handlePlantSelected(PlantSummary summary) {
    setState(() {
      _currentIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      DashboardScreen(
        onPlantSelected: _handlePlantSelected,
        weather: _weather,
        isLoadingWeather: _isLoadingWeather,
        locationLabel: _locationLabel,
        weatherError: _weatherError,
        onRefreshWeather: _loadWeather,
      ),
      PlantDetailScreen(
        detail: featuredPlantDetail,
        weather: _weather,
        locationLabel: _locationLabel,
      ),
      const ScheduleScreen(),
      WeatherScreen(
        weather: _weather,
        locationLabel: _locationLabel,
        isLoading: _isLoadingWeather,
        onRefresh: _loadWeather,
      ),
      const ShopScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: IndexedStack(index: _currentIndex, children: screens),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
