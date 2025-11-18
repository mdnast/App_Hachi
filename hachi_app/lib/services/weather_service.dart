import 'dart:math';

import '../models/weather_model.dart';

class WeatherService {
  WeatherService();

  final _random = Random();

  Future<WeatherInfo> fetchCurrentWeather() async {
    await Future<void>.delayed(const Duration(milliseconds: 600));

    final baseTemp = 24 + _random.nextDouble() * 2 - 1;
    final low = baseTemp - (_random.nextDouble() * 3 + 1);
    final high = baseTemp + (_random.nextDouble() * 3 + 1);
    const conditions = ['Partly Cloudy', 'Sunny', 'Light Rain', 'Overcast'];

    return WeatherInfo(
      temperature: baseTemp,
      low: low,
      high: high,
      condition: conditions[_random.nextInt(conditions.length)],
      lastUpdated: DateTime.now(),
    );
  }
}
