import 'package:flutter/material.dart';

import '../../models/plant_model.dart';
import '../../models/weather_model.dart';
import '../../utils/constants.dart';

class PlantDetailScreen extends StatelessWidget {
  const PlantDetailScreen({
    super.key,
    required this.detail,
    this.weather,
    this.locationLabel,
  });

  final PlantDetail detail;
  final WeatherInfo? weather;
  final String? locationLabel;

  @override
  Widget build(BuildContext context) {
    // Check if weather is placeholder (e.g. humidity is 0 and condition is Updating...)
    final isPlaceholder =
        weather == null ||
        (weather!.humidity == 0 && weather!.condition == 'Updating…');

    // Use real weather data if available, otherwise fallback to detail model
    final humidity = !isPlaceholder
        ? weather!.humidity.toString()
        : detail.humidity.toString();
    final wind = !isPlaceholder
        ? weather!.windSpeed.toString()
        : detail.windSpeed.toString();
    final precipitation = !isPlaceholder
        ? weather!.precipitation.toStringAsFixed(0)
        : detail.precipitation.toStringAsFixed(0);
    final sunrise = !isPlaceholder
        ? weather!.sunrise
        : _formatTime(detail.sunrise);
    final sunset = !isPlaceholder
        ? weather!.sunset
        : _formatTime(detail.sunset);
    final location = locationLabel ?? detail.location;

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Stack(
        children: [
          // Green Header Background
          Container(
            height: 280,
            decoration: const BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fixed Header Content
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppInsets.lg,
                    vertical: AppInsets.sm,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppInsets.sm),
                      Text(
                        '${detail.totalPlants} Plants',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        detail.name,
                        style: AppTextStyles.headingLarge.copyWith(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        location,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: AppInsets.lg),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppInsets.lg,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: AppInsets.sm,
                        ), // Reduced top spacing
                        // Stats Card
                        Container(
                          padding: const EdgeInsets.all(AppInsets.lg),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(AppCorners.lg),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(10),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _StatItem(
                                    label: 'Humidity',
                                    value: '$humidity %',
                                    icon: Icons.water_drop_outlined,
                                  ),
                                  _StatItem(
                                    label: 'Wind',
                                    value: '$wind m/s',
                                    icon: Icons.air,
                                  ),
                                  _StatItem(
                                    label: 'Age Plant',
                                    value: '${detail.ageInMonths} month',
                                    icon: Icons.spa_outlined,
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppInsets.lg),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _StatItem(
                                    label: 'Sunrise',
                                    value: sunrise,
                                    icon: Icons.wb_sunny_outlined,
                                  ),
                                  _StatItem(
                                    label: 'Sunset',
                                    value: sunset,
                                    icon: Icons.wb_twilight,
                                  ),
                                  _StatItem(
                                    label: 'Precipitation',
                                    value: '$precipitation mm',
                                    icon: Icons
                                        .cloud_outlined, // Using cloud for precipitation
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppInsets.xl),
                        // Control Cards
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: AppInsets.md,
                                crossAxisSpacing: AppInsets.md,
                                childAspectRatio: 1.0, // Fixed overflow
                              ),
                          itemCount: detail.tasks.length,
                          itemBuilder: (context, index) {
                            return _ControlCard(task: detail.tasks[index]);
                          },
                        ),
                        const SizedBox(height: AppInsets.xl),
                        Text(
                          "Today's Weather",
                          style: AppTextStyles.headingMedium,
                        ),
                        const SizedBox(height: AppInsets.md),
                        // Weather Section
                        _WeatherSection(weather: weather),
                        const SizedBox(height: AppInsets.xl),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final hour = time.hour > 12 ? time.hour - 12 : time.hour;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'pm' : 'am';
    return '$hour:$minute $period';
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80, // Fixed width for alignment
      child: Column(
        children: [
          Icon(icon, color: AppColors.primaryGreen, size: 28),
          const SizedBox(height: 8),
          Text(label, style: AppTextStyles.caption.copyWith(fontSize: 11)),
          const SizedBox(height: 4),
          Text(value, style: AppTextStyles.headingSmall.copyWith(fontSize: 14)),
        ],
      ),
    );
  }
}

class _ControlCard extends StatefulWidget {
  const _ControlCard({required this.task});

  final PlantTask task;

  @override
  State<_ControlCard> createState() => _ControlCardState();
}

class _ControlCardState extends State<_ControlCard> {
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _isActive = widget.task.isPrimary;
  }

  @override
  Widget build(BuildContext context) {
    // Active: Green text, Inactive: Dark text
    final textColor = _isActive ? AppColors.primaryGreen : AppColors.darkText;
    final subTextColor = _isActive
        ? AppColors.primaryGreen.withOpacity(0.7)
        : AppColors.mutedText;

    // Map icon string to IconData
    IconData iconData;
    switch (widget.task.icon) {
      case 'spray':
        iconData = Icons.snowing;
        break; // Closest to spray/snowflake icon
      case 'lamp':
        iconData = Icons.nightlight_round;
        break;
      case 'heater':
        iconData = Icons.thermostat;
        break;
      case 'fertilizer':
        iconData = Icons.spa;
        break;
      default:
        iconData = Icons.device_unknown;
    }

    return Container(
      padding: const EdgeInsets.all(AppInsets.md),
      decoration: BoxDecoration(
        color: Colors.white, // Always white background
        borderRadius: BorderRadius.circular(AppCorners.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: _isActive ? AppColors.primaryGreen : AppColors.borderColor,
          width: _isActive ? 2.0 : 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _isActive
                      ? AppColors.primaryGreen
                      : const Color(0xFFF5F7F9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  iconData,
                  color: _isActive ? Colors.white : AppColors.primaryGreen,
                  size: 20,
                ),
              ),
              Switch(
                value: _isActive,
                onChanged: (val) => setState(() => _isActive = val),
                activeColor: AppColors.primaryGreen, // Dark green toggle
                activeTrackColor: AppColors.primaryGreen.withOpacity(0.2),
                inactiveThumbColor: Colors.grey[400],
                inactiveTrackColor: Colors.grey[200],
              ),
            ],
          ),
          const Spacer(),
          Text(
            widget.task.name,
            style: AppTextStyles.headingSmall.copyWith(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            widget.task.durationLabel,
            style: AppTextStyles.caption.copyWith(color: subTextColor),
          ),
        ],
      ),
    );
  }
}

class _WeatherSection extends StatelessWidget {
  const _WeatherSection({this.weather});

  final WeatherInfo? weather;

  @override
  Widget build(BuildContext context) {
    final temp = weather?.temperature.round().toString() ?? '24';
    final low = weather?.low.round().toString() ?? '18';
    final high = weather?.high.round().toString() ?? '30';
    // Just a simple estimation for night temp
    final night = ((weather?.low ?? 18) - 2).round().toString();

    // Determine current time of day for selection
    final hour = DateTime.now().hour;
    final isMorning = hour >= 6 && hour < 12;
    final isAfternoon = hour >= 12 && hour < 17;
    final isEvening = hour >= 17 && hour < 21;
    final isNight = hour >= 21 || hour < 6;

    return SizedBox(
      height: 240, // Reduced height to move chart up closer to title
      child: Stack(
        children: [
          // The curve painter
          Positioned.fill(child: CustomPaint(painter: _WeatherCurvePainter())),
          // Weather Items
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _WeatherItem(
                  label: 'Morning',
                  temp: '$low°',
                  icon: Icons.cloud_outlined,
                  isSelected: isMorning,
                ),
                _WeatherItem(
                  label: 'Afternoon',
                  temp: '$high°',
                  icon: Icons.cloud_queue,
                  isSelected: isAfternoon,
                  offsetY: -50, // Adjusted offset
                ),
                _WeatherItem(
                  label: 'Evening',
                  temp: '$temp°',
                  icon: Icons.wb_sunny_outlined,
                  isSelected: isEvening,
                  offsetY: -20,
                ),
                _WeatherItem(
                  label: 'Night',
                  temp: '$night°',
                  icon: Icons.thunderstorm_outlined,
                  isSelected: isNight,
                  offsetY: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WeatherItem extends StatelessWidget {
  const _WeatherItem({
    required this.label,
    required this.temp,
    required this.icon,
    required this.isSelected,
    this.offsetY = 0,
  });

  final String label;
  final String temp;
  final IconData icon;
  final bool isSelected;
  final double offsetY;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, offsetY),
      child: Container(
        width: 70,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: isSelected
            ? BoxDecoration(
                color: AppColors.primaryGreen, // Dark green card
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryGreen.withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 10),
                  ),
                ],
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: AppColors.primaryGreen, size: 24),
              ),
            ] else
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.borderColor),
                ),
                child: Icon(icon, color: Colors.blue[300], size: 24),
              ),

            // Spacer to push text down relative to curve if needed,
            // but here we just stack them. The curve goes through the middle.
            // We need to position this carefully.
            // In the design, the card covers the curve.
            const SizedBox(height: 50), // Space for the curve to pass through

            Text(
              temp,
              style: AppTextStyles.headingLarge.copyWith(
                color: isSelected ? Colors.white : AppColors.darkText,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.caption.copyWith(
                color: isSelected ? Colors.white70 : AppColors.mutedText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();

    // Hardcoded curve points to match the visual roughly
    final w = size.width;
    final h = size.height;

    // Points roughly where the dots are
    // Morning: x ~ 12%, y ~ 70%
    // Afternoon: x ~ 37%, y ~ 50%
    // Evening: x ~ 62%, y ~ 60%
    // Night: x ~ 87%, y ~ 75%

    final p1 = Offset(w * 0.12, h * 0.78);
    final p2 = Offset(w * 0.37, h * 0.60);
    final p3 = Offset(w * 0.62, h * 0.70);
    final p4 = Offset(w * 0.87, h * 0.82);

    path.moveTo(0, h * 0.82); // Start left

    // Curve to p1
    path.quadraticBezierTo(w * 0.06, h * 0.82, p1.dx, p1.dy);

    // Curve p1 to p2
    path.cubicTo(w * 0.2, h * 0.75, w * 0.28, h * 0.60, p2.dx, p2.dy);

    // Curve p2 to p3
    path.cubicTo(w * 0.45, h * 0.60, w * 0.5, h * 0.65, p3.dx, p3.dy);

    // Curve p3 to p4
    path.cubicTo(w * 0.7, h * 0.75, w * 0.8, h * 0.82, p4.dx, p4.dy);

    // End right
    path.quadraticBezierTo(w * 0.95, h * 0.82, w, h * 0.85);

    canvas.drawPath(path, paint);

    // Draw dots
    final dotPaint = Paint()..color = AppColors.primaryGreen; // Dark green dots
    final whitePaint = Paint()..color = Colors.white;

    void drawDot(Offset center, {bool isWhite = false}) {
      if (isWhite) {
        canvas.drawCircle(center, 6, whitePaint);
      } else {
        canvas.drawCircle(center, 4, dotPaint);
      }
    }

    drawDot(p1);
    drawDot(p2);
    drawDot(p3, isWhite: true); // The one on the card is white
    drawDot(p4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
