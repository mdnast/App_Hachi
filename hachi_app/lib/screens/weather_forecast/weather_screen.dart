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
                    'Dự báo thời tiết',
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
              _WeatherDetailsGrid(weather: widget.weather),

              const SizedBox(height: AppInsets.lg),
              const Text(
                'Dự báo theo giờ hôm nay',
                style: AppTextStyles.headingMedium,
              ),
              const SizedBox(height: AppInsets.md),
              SizedBox(
                height: 140,
                child: _hourlyToday.isEmpty
                    ? Center(
                        child: Text(
                          'Không có dữ liệu theo giờ.',
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
                          final hourOfDay = hour.time.hour;
                          final isDay = hourOfDay >= 6 && hourOfDay < 18;
                          return _HourlyForecastChip(
                            time: formatTime(hour.time),
                            temperature: '${hour.temperature.round()}°',
                            icon: _iconForWeatherApiCode(
                              hour.weatherCode,
                              isDay: isDay,
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: AppInsets.lg),
              const Text('Dự báo tuần', style: AppTextStyles.headingMedium),
              const SizedBox(height: AppInsets.md),
              Column(
                children: [
                  for (var i = 0; i < _daily.length && i < 5; i++) ...[
                    _DayForecastRow(
                      day: i == 0
                          ? 'Hôm nay'
                          : formatWeekdayShort(_daily[i].date),
                      description: formatFullDate(_daily[i].date),
                      temperature:
                          '${_daily[i].high.round()}° / ${_daily[i].low.round()}°',
                      icon: _iconForWeatherApiCode(_daily[i].weatherCode),
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
    final hourOfDay = now.hour;
    final isDay = hourOfDay >= 6 && hourOfDay < 18;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryGreen,
            AppColors.primaryGreen.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white70,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        locationLabel,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatFullDate(now),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              IconButton(
                onPressed: isLoading ? null : onRefresh,
                icon: const Icon(Icons.refresh, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Center(
            child: Column(
              children: [
                Icon(
                  _iconForWeatherApiCode(weather.weatherCode, isDay: isDay),
                  color: Colors.yellowAccent,
                  size: 80,
                ),
                const SizedBox(height: 16),
                Text(
                  weather.temperature == 0
                      ? '--°'
                      : '${weather.temperature.round()}°',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  weather.condition,
                  style: const TextStyle(color: Colors.white70, fontSize: 18),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'H: ${weather.high.round()}°',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'L: ${weather.low.round()}°',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WeatherDetailsGrid extends StatelessWidget {
  const _WeatherDetailsGrid({required this.weather});

  final WeatherInfo weather;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.1,
      children: [
        _WeatherMetricCard(
          icon: Icons.water_drop_outlined,
          label: 'Độ ẩm',
          value: '${weather.humidity}%',
          color: Colors.blue,
        ),
        _WeatherMetricCard(
          icon: Icons.air,
          label: 'Tốc độ gió',
          value: '${weather.windSpeed.round()} km/h',
          color: Colors.teal,
        ),
        _WeatherMetricCard(
          icon: Icons.grain,
          label: 'Lượng mưa',
          value: '${weather.precipitation.toStringAsFixed(1)} mm',
          color: Colors.indigo,
        ),
        _WeatherMetricCard(
          icon: Icons.wb_twilight,
          label: 'Bình minh',
          value: weather.sunrise,
          color: Colors.orange,
        ),
      ],
    );
  }
}

class _WeatherMetricCard extends StatelessWidget {
  const _WeatherMetricCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
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

IconData _iconForWeatherApiCode(int code, {bool isDay = true}) {
  // WeatherAPI.com condition codes
  // https://www.weatherapi.com/docs/weather_conditions.json

  // Clear/Sunny - different for day/night
  if (code == 1000) {
    return isDay ? Icons.wb_sunny : Icons.nightlight_round;
  }

  // Partly cloudy - different for day/night
  if (code == 1003) {
    return isDay ? Icons.wb_cloudy : Icons.cloud_outlined;
  }

  // Cloudy/Overcast
  if (code == 1006 || code == 1009) return Icons.cloud;

  // Rain/Drizzle
  if (code >= 1063 && code <= 1072) return Icons.grain;
  if (code >= 1150 && code <= 1201) return Icons.grain;
  if (code >= 1240 && code <= 1246) return Icons.grain;

  // Thunderstorm
  if (code >= 1273 && code <= 1282) return Icons.thunderstorm;

  // Snow
  if (code >= 1210 && code <= 1237) return Icons.ac_unit;
  if (code >= 1249 && code <= 1264) return Icons.ac_unit;
  if (code >= 1114 && code <= 1117) return Icons.ac_unit;

  // Fog/Mist
  if (code >= 1135 && code <= 1147) return Icons.cloud;

  return Icons.wb_cloudy; // Default
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
