import 'package:flutter/material.dart';

import 'models/plant_model.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/plant_detail/plant_detail_screen.dart';
import 'screens/schedule/schedule_screen.dart';
import 'screens/weather_forecast/weather_screen.dart';
import 'screens/market/market_screen.dart';
import 'utils/constants.dart';
import 'widgets/bottom_nav_bar.dart';

void main() {
  runApp(const HachiApp());
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

  void _handlePlantSelected(PlantSummary summary) {
    setState(() {
      _currentIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      DashboardScreen(onPlantSelected: _handlePlantSelected),
      PlantDetailScreen(detail: featuredPlantDetail),
      const ScheduleScreen(),
      const WeatherScreen(),
      const MarketScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
