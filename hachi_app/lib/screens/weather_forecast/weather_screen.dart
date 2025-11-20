import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/weather_model.dart';
import '../../services/location_service.dart';
import '../../services/weather_service.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({
    super.key,
    required this.weather,
    required this.locationLabel,
    required this.onRefresh,
    required this.isLoading,
  });

  final WeatherInfo weather;
  final String locationLabel;
  final VoidCallback onRefresh;
  final bool isLoading;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late DateTime _now;
  Timer? _clockTimer;
  // We'll use the passed weather data, but we might need to fetch forecast if not available in WeatherInfo
  // For now, let's assume WeatherInfo will eventually hold forecast or we fetch it here if needed.
  // Actually, the current WeatherInfo model doesn't hold forecast list.
  // The previous implementation fetched forecast.
  // To keep it simple and consistent, we will use the passed current weather,
  // but we might lose the daily/hourly forecast if we don't pass it or fetch it.
  // However, the user's request is to "combine with api", and the main.dart fetches current weather.
  // If we want full forecast, we should probably fetch it here or lift that state too.
  // Given the constraint "like the other parts", let's use the passed data for current weather.
  // For forecast, we might need to keep fetching it here or update WeatherInfo to hold it.
  // Let's keep fetching forecast here for now but use the passed current weather for the main card.

  final WeatherService _weatherService = WeatherService();
  final LocationService _locationService = const LocationService();
  List<DailyForecast> _daily = const [];
  List<HourlyForecast> _hourlyToday = const [];
  bool _isLoadingForecast = false;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _startClock();
    _loadForecast();
  }

  @override
  void didUpdateWidget(WeatherScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.locationLabel != oldWidget.locationLabel &&
        widget.locationLabel != 'Detecting location…') {
      _loadForecast();
    }
  }

  @override
  void dispose() {
    _clockTimer?.cancel();
    super.dispose();
  }

  void _startClock() {
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  Future<void> _loadForecast() async {
    if (_isLoadingForecast) return;
    setState(() {
      _isLoadingForecast = true;
    });
    try {
      final position = await _locationService.getCurrentPosition();
      final forecast = await _weatherService.fetchForecastFor(
        position.latitude,
        position.longitude,
      );

      if (!mounted) return;
      setState(() {
        _daily = forecast.daily;
        _hourlyToday = forecast.hourly.where((h) {
          return h.time.year == _now.year &&
              h.time.month == _now.month &&
              h.time.day == _now.day;
        }).toList();
        _isLoadingForecast = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() => _isLoadingForecast = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final todayLabel = formatFullDate(_now);

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppInsets.lg,
            vertical: AppInsets.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Weather Forecast',
                    style: AppTextStyles.headingLarge,
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh, color: AppColors.mutedText),
                    onPressed: widget.isLoading ? null : widget.onRefresh,
                  ),
                ],
              ),
              const SizedBox(height: AppInsets.sm),
              Text(todayLabel, style: AppTextStyles.bodySmall),
              const SizedBox(height: AppInsets.lg),
              _ForecastHeroCard(
                weather: widget.weather,
                now: _now,
                isLoading: widget.isLoading,
                onRefresh: widget.onRefresh,
                locationLabel: widget.locationLabel,
              ),

              const SizedBox(height: AppInsets.lg),
              const Text(
                "Today's Hourly Forecast",
                style: AppTextStyles.headingMedium,
              ),
              const SizedBox(height: AppInsets.md),
              SizedBox(
                height: 110,
                child: _hourlyToday.isEmpty
                    ? Center(
                        child: Text(
                          'No hourly data available.',
                          style: AppTextStyles.bodySmall,
                        ),
                      )
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _hourlyToday.length, // Show all hours
                        separatorBuilder: (_, __) =>
                            const SizedBox(width: AppInsets.sm),
                        itemBuilder: (_, index) {
                          final hour = _hourlyToday[index];
                          return _HourlyForecastChip(
                            time: formatTime(hour.time),
                            temperature: '${hour.temperature.round()}°',
                            icon: _iconForCode(hour.weatherCode),
                          );
                        },
                      ),
              ),
              const SizedBox(height: AppInsets.lg),
              const Text('Weekly Outlook', style: AppTextStyles.headingMedium),
              const SizedBox(height: AppInsets.md),
              Column(
                children: [
                  for (var i = 0; i < _daily.length && i < 5; i++) ...[
                    _DayForecastRow(
                      day: i == 0
                          ? 'Today'
                          : formatWeekdayShort(_daily[i].date),
                      description: formatFullDate(_daily[i].date),
                      temperature:
                          '${_daily[i].high.round()}° / ${_daily[i].low.round()}°',
                      icon: _iconForCode(_daily[i].weatherCode),
                      isToday: i == 0,
                    ),
                    if (i < _daily.length - 1 && i < 4)
                      const SizedBox(height: AppInsets.sm),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ForecastHeroCard extends StatelessWidget {
  const _ForecastHeroCard({
    required this.weather,
    required this.now,
    required this.isLoading,
    required this.onRefresh,
    required this.locationLabel,
  });

  final WeatherInfo weather;
  final DateTime now;
  final bool isLoading;
  final VoidCallback onRefresh;
  final String locationLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppInsets.lg),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF135E65), Color(0xFF0A8275)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppCorners.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    locationLabel,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${formatFullDate(now)}\n${formatTime(now)}',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: isLoading ? null : onRefresh,
                icon: const Icon(Icons.refresh, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: AppInsets.lg),
          SizedBox(
            height: 160,
            child: Stack(
              alignment: Alignment.center,
              children: const [
                Positioned.fill(child: _ArcPainterWidget()),
                Positioned(
                  top: 50, // Moved down from 32
                  child: Icon(
                    Icons.wb_sunny,
                    color: Colors.yellowAccent,
                    size: 48,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppInsets.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _WeatherInfo(label: 'Sunrise', value: weather.sunrise),
              _WeatherInfo(label: 'Sunset', value: weather.sunset),
              _WeatherInfo(
                label: 'Temp',
                value: weather.temperature == 0
                    ? '--°C'
                    : '${weather.temperature.round()}°C',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ArcPainterWidget extends StatelessWidget {
  const _ArcPainterWidget();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _ArcPainter());
  }
}

class _ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: size.center(const Offset(0, 20)), // Moved center down by 20
      radius: size.width / 2.2,
    );
    final paintArc = Paint()
      ..color = Colors.white.withAlpha(64)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, 3.4, 2.5, false, paintArc);

    final progressPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.white, Colors.yellowAccent],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, 4.2, 1.2, false, progressPaint);

    final tickPaint = Paint()
      ..color = Colors.white.withAlpha(102)
      ..strokeWidth = 2;

    for (var i = 0; i <= 12; i++) {
      final angle = 3.4 + (2.5 / 12) * i;
      final inner = Offset(
        rect.center.dx + (rect.width / 2.2) * cos(angle),
        rect.center.dy + (rect.width / 2.2) * sin(angle),
      );
      final outer = Offset(
        rect.center.dx + (rect.width / 1.95) * cos(angle),
        rect.center.dy + (rect.width / 1.95) * sin(angle),
      );
      canvas.drawLine(inner, outer, tickPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _WeatherInfo extends StatelessWidget {
  const _WeatherInfo({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.caption.copyWith(color: Colors.white70),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

class _DayForecastRow extends StatelessWidget {
  const _DayForecastRow({
    required this.day,
    required this.description,
    required this.temperature,
    required this.icon,
    this.isToday = false,
  });

  final String day;
  final String description;
  final String temperature;
  final IconData icon;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppInsets.lg),
      decoration: BoxDecoration(
        color: isToday ? Colors.white : AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppCorners.lg),
        boxShadow: isToday
            ? [
                BoxShadow(
                  color: Colors.black.withAlpha(13),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.paleGreen,
              borderRadius: BorderRadius.circular(AppCorners.sm),
            ),
            child: Icon(icon, color: AppColors.primaryGreen),
          ),
          const SizedBox(width: AppInsets.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(day, style: AppTextStyles.headingSmall),
                const SizedBox(height: 4),
                Text(description, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          Text(temperature, style: AppTextStyles.headingSmall),
        ],
      ),
    );
  }
}

class _HourlyForecastChip extends StatelessWidget {
  const _HourlyForecastChip({
    required this.time,
    required this.temperature,
    required this.icon,
  });

  final String time;
  final String temperature;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(AppInsets.sm),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppCorners.md),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: AppTextStyles.caption),
          const SizedBox(height: 6),
          Icon(icon, color: AppColors.primaryGreen, size: 20),
          const SizedBox(height: 6),
          Text(
            temperature,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.darkText),
          ),
        ],
      ),
    );
  }
}

IconData _iconForCode(int code) {
  if (code == 0) return Icons.wb_sunny_outlined;
  if (code == 1 || code == 2) return Icons.wb_cloudy_outlined;
  if (code == 3) return Icons.cloud_outlined;
  if (code >= 51 && code <= 65) return Icons.grain; // drizzle / rain
  if (code >= 80 && code <= 82) return Icons.grain; // showers
  if (code >= 95) return Icons.thunderstorm_outlined;
  return Icons.wb_cloudy_outlined;
}
