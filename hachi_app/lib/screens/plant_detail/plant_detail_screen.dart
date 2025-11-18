import 'package:flutter/material.dart';

import '../../models/plant_model.dart';
import '../../utils/constants.dart';

class PlantDetailScreen extends StatelessWidget {
  const PlantDetailScreen({super.key, required this.detail});

  final PlantDetail detail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppInsets.lg, vertical: AppInsets.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(detail: detail),
              const SizedBox(height: AppInsets.lg),
              Text('Condition Overview', style: AppTextStyles.headingMedium),
              const SizedBox(height: AppInsets.md),
              Wrap(
                spacing: AppInsets.sm,
                runSpacing: AppInsets.sm,
                children: [
                  _StatChip(label: 'Humidity', value: '${detail.humidity}%', icon: Icons.water_drop),
                  _StatChip(label: 'Wind', value: '${detail.windSpeed} m/s', icon: Icons.air),
                  _StatChip(label: 'Age Plant', value: '${detail.ageInMonths} month', icon: Icons.spa),
                  _StatChip(label: 'Precipitation', value: '${detail.precipitation} mm', icon: Icons.grain),
                  _StatChip(label: 'Sunrise', value: _timeLabel(detail.sunrise), icon: Icons.wb_sunny_outlined),
                  _StatChip(label: 'Sunset', value: _timeLabel(detail.sunset), icon: Icons.nightlight_round),
                ],
              ),
              const SizedBox(height: AppInsets.lg),
              Text('Automation Tasks', style: AppTextStyles.headingMedium),
              const SizedBox(height: AppInsets.md),
              Wrap(
                spacing: AppInsets.md,
                runSpacing: AppInsets.md,
                children: [
                  for (final task in detail.tasks)
                    _TaskCard(
                      task: task,
                    ),
                ],
              ),
              const SizedBox(height: AppInsets.lg),
              Text("Today's Weather", style: AppTextStyles.headingMedium),
              const SizedBox(height: AppInsets.md),
              _TemperatureTrendChart(trend: detail.temperatureTrend),
            ],
          ),
        ),
      ),
    );
  }

  static String _timeLabel(DateTime time) {
    final hours = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final suffix = time.hour >= 12 ? 'PM' : 'AM';
    final minutes = time.minute.toString().padLeft(2, '0');
    return '$hours:$minutes $suffix';
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.detail});

  final PlantDetail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppInsets.lg),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryGreen, AppColors.secondaryGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppCorners.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(38),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.more_horiz, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: AppInsets.sm),
          Text(
            detail.name,
            style: AppTextStyles.headingLarge.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 6),
          Text(
            detail.location,
            style: AppTextStyles.bodySmall.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: AppInsets.md),
          Row(
            children: [
              _CounterTile(label: 'Plants', value: '${detail.totalPlants}'),
              const SizedBox(width: AppInsets.md),
              _CounterTile(label: 'Age', value: '${detail.ageInMonths} mo'),
            ],
          ),
          const SizedBox(height: AppInsets.md),
          Container(
            padding: const EdgeInsets.all(AppInsets.md),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(31),
              borderRadius: BorderRadius.circular(AppCorners.md),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.white70, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Planned activities are scheduled automatically based on sensor data.',
                    style: AppTextStyles.bodySmall.copyWith(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CounterTile extends StatelessWidget {
  const _CounterTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppInsets.md),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(36),
          borderRadius: BorderRadius.circular(AppCorners.md),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyles.caption.copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: AppTextStyles.headingSmall.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(AppInsets.md),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppCorners.md),
        boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(13),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
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
          const SizedBox(width: AppInsets.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.caption),
                const SizedBox(height: 4),
                Text(value, style: AppTextStyles.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({required this.task});

  final PlantTask task;

  @override
  Widget build(BuildContext context) {
    final color = task.isPrimary ? AppColors.accentOrange : AppColors.paleGreen;
    final foreground = task.isPrimary ? Colors.white : AppColors.primaryGreen;
    return Container(
      width: 150,
      padding: const EdgeInsets.all(AppInsets.md),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppCorners.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: task.isPrimary ? Colors.white.withAlpha(51) : Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(_mapIcon(task.icon), color: foreground),
          ),
          const SizedBox(height: AppInsets.sm),
          Text(
            task.name,
            style: AppTextStyles.headingSmall.copyWith(color: foreground),
          ),
          const SizedBox(height: 4),
          Text(
            task.durationLabel,
            style: AppTextStyles.bodySmall.copyWith(color: foreground.withAlpha(204)),
          ),
        ],
      ),
    );
  }

  IconData _mapIcon(String icon) {
    switch (icon) {
      case 'spray':
        return Icons.spa_rounded;
      case 'lamp':
        return Icons.lightbulb_outline;
      case 'heater':
        return Icons.local_fire_department_outlined;
      case 'fertilizer':
        return Icons.grass;
      default:
        return Icons.eco_outlined;
    }
  }
}

class _TemperatureTrendChart extends StatelessWidget {
  const _TemperatureTrendChart({required this.trend});

  final List<int> trend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppInsets.lg),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppCorners.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.thermostat, color: AppColors.primaryGreen),
              SizedBox(width: 8),
              Text('Temperature Trend', style: AppTextStyles.headingSmall),
            ],
          ),
          const SizedBox(height: AppInsets.md),
          SizedBox(
            height: 140,
            child: CustomPaint(
              painter: _TrendPainter(trend: trend),
              child: const SizedBox.expand(),
            ),
          ),
          const SizedBox(height: AppInsets.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Morning', style: AppTextStyles.caption),
              Text('Afternoon', style: AppTextStyles.caption),
              Text('Evening', style: AppTextStyles.caption),
              Text('Night', style: AppTextStyles.caption),
            ],
          ),
        ],
      ),
    );
  }
}

class _TrendPainter extends CustomPainter {
  const _TrendPainter({required this.trend});

  final List<int> trend;

  @override
  void paint(Canvas canvas, Size size) {
    if (trend.isEmpty) return;

    final maxTemp = trend.reduce((a, b) => a > b ? a : b).toDouble();
    final minTemp = trend.reduce((a, b) => a < b ? a : b).toDouble();
    final range = (maxTemp - minTemp).clamp(1, double.infinity);
    final spacing = size.width / (trend.length - 1);

    final points = <Offset>[];
    for (var i = 0; i < trend.length; i++) {
      final value = trend[i].toDouble();
      final dx = spacing * i;
      final dy = size.height - ((value - minTemp) / range) * size.height;
      points.add(Offset(dx, dy));
    }

    final paintLine = Paint()
      ..color = AppColors.primaryGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (var i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, paintLine);

    final paintFill = Paint()
      ..shader = const LinearGradient(
        colors: [AppColors.primaryGreen, Colors.transparent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill
      ..color = AppColors.primaryGreen.withAlpha((255 * 0.15).round());

    final fillPath = Path.from(path)
      ..lineTo(points.last.dx, size.height)
      ..lineTo(points.first.dx, size.height)
      ..close();
    canvas.drawPath(fillPath, paintFill);

    final dotPaint = Paint()
      ..color = AppColors.accentOrange
      ..style = PaintingStyle.fill;

    for (final point in points) {
      canvas.drawCircle(point, 5, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
