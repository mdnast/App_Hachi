import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Weather Forecast', style: AppTextStyles.headingLarge),
                  Icon(Icons.more_horiz, color: AppColors.mutedText),
                ],
              ),
              const SizedBox(height: AppInsets.lg),
              const _ForecastHeroCard(),
              const SizedBox(height: AppInsets.lg),
              Container(
                padding: const EdgeInsets.all(AppInsets.lg),
                decoration: BoxDecoration(
                  color: AppColors.paleOrange,
                  borderRadius: BorderRadius.circular(AppCorners.lg),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(AppCorners.sm),
                      ),
                      child: const Icon(Icons.warning_amber_rounded, color: AppColors.accentOrange),
                    ),
                    const SizedBox(width: AppInsets.md),
                    Expanded(
                      child: Text(
                        'Be careful at the beginning of this year, extreme rain often occurs causing landslides and floods in certain places.',
                        style: AppTextStyles.bodySmall.copyWith(color: AppColors.accentOrange),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppInsets.lg),
              const Text('Weekly Outlook', style: AppTextStyles.headingMedium),
              const SizedBox(height: AppInsets.md),
              Column(
                children: const [
                  _DayForecastRow(day: 'Sunday', description: '3 January 2025', temperature: '24°C', icon: Icons.wb_sunny_outlined, isToday: true),
                  SizedBox(height: AppInsets.sm),
                  _DayForecastRow(day: 'Monday', description: '4 January 2025', temperature: '26°C', icon: Icons.cloud_outlined),
                  SizedBox(height: AppInsets.sm),
                  _DayForecastRow(day: 'Tuesday', description: '5 January 2025', temperature: '12°C', icon: Icons.thunderstorm_outlined),
                  SizedBox(height: AppInsets.sm),
                  _DayForecastRow(day: 'Wednesday', description: '6 January 2025', temperature: '18°C', icon: Icons.umbrella_outlined),
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
  const _ForecastHeroCard();

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
                    'Malang, Indonesia',
                    style: AppTextStyles.bodySmall.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Sunday\n3 January 2025',
                    style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(38),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.my_location, color: Colors.white),
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
                  top: 32,
                  child: Icon(Icons.wb_sunny, color: Colors.yellowAccent, size: 48),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppInsets.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _WeatherInfo(label: 'Sunrise', value: '5:20 AM'),
              _WeatherInfo(label: 'Sunset', value: '5:58 PM'),
              _WeatherInfo(label: 'Temp', value: '24°C'),
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
    return CustomPaint(
      painter: _ArcPainter(),
    );
  }
}

class _ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2.2);
    final paintArc = Paint()
      ..color = Colors.white.withAlpha(64)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, 3.4, 2.5, false, paintArc);

    final progressPaint = Paint()
      ..shader = const LinearGradient(colors: [Colors.white, Colors.yellowAccent]).createShader(rect)
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
        Text(label, style: AppTextStyles.caption.copyWith(color: Colors.white70)),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyles.bodyMedium.copyWith(color: Colors.white)),
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
          Text(
            temperature,
            style: AppTextStyles.headingSmall,
          ),
        ],
      ),
    );
  }
}
