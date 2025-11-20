import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';
import '../utils/constants.dart';

/// Weather service backed by WeatherAPI.com using the user's coordinates.
class WeatherService {
  WeatherService();

  Future<WeatherInfo> fetchCurrentWeather({
    double? latitude,
    double? longitude,
  }) async {
    final forecast = await _fetchWeather(
      latitude: latitude,
      longitude: longitude,
      days: 1,
    );
    return forecast.current;
  }

  Future<WeatherInfo> fetchCurrentWeatherFor(
    double latitude,
    double longitude,
  ) async {
    final forecast = await _fetchWeather(
      latitude: latitude,
      longitude: longitude,
      days: 1,
    );
    return forecast.current;
  }

  Future<
    ({
      WeatherInfo current,
      List<DailyForecast> daily,
      List<HourlyForecast> hourly,
    })
  >
  fetchForecastFor(double latitude, double longitude) {
    return _fetchWeather(latitude: latitude, longitude: longitude, days: 5);
  }

  Future<
    ({
      WeatherInfo current,
      List<DailyForecast> daily,
      List<HourlyForecast> hourly,
    })
  >
  _fetchWeather({double? latitude, double? longitude, int days = 5}) async {
    final key = AppConstants.apiKey;
    final baseUrl = AppConstants.baseUrl;

    final q = (latitude != null && longitude != null)
        ? '$latitude,$longitude'
        : AppConstants.defaultCity;

    final uri = Uri.parse(
      '$baseUrl/forecast.json?key=$key&q=$q&days=$days&aqi=no&alerts=no',
    );

    final response = await http.get(uri).timeout(AppConstants.requestTimeout);
    if (response.statusCode != 200) {
      throw Exception('Weather request failed (${response.statusCode})');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final currentBlock = data['current'] as Map<String, dynamic>?;
    final forecast = data['forecast'] as Map<String, dynamic>?;
    final forecastDays =
        (forecast?['forecastday'] as List?)?.cast<Map<String, dynamic>>() ??
        const <Map<String, dynamic>>[];

    if (currentBlock == null || forecastDays.isEmpty) {
      throw Exception('Weather response missing current/forecast data');
    }

    final currentTemp = (currentBlock['temp_c'] as num?)?.toDouble();
    if (currentTemp == null) {
      throw Exception('Weather response missing temperature');
    }

    final currentConditionBlock =
        currentBlock['condition'] as Map<String, dynamic>?;
    final currentCode = (currentConditionBlock?['code'] as num?)?.toInt() ?? 0;
    final conditionText =
        (currentConditionBlock?['text'] as String?) ?? 'Unknown';

    // Additional current weather data
    final humidity = (currentBlock['humidity'] as num?)?.toInt() ?? 0;
    final windKph = (currentBlock['wind_kph'] as num?)?.toDouble() ?? 0.0;
    // Convert km/h to m/s: 1 km/h = 0.27778 m/s
    final windSpeed = double.parse((windKph * 0.27778).toStringAsFixed(1));
    final precipitation =
        (currentBlock['precip_mm'] as num?)?.toDouble() ?? 0.0;

    // Today's high/low from first forecast day.
    final todayDay = forecastDays.first['day'] as Map<String, dynamic>?;
    final todayMin =
        (todayDay?['mintemp_c'] as num?)?.toDouble() ?? currentTemp;
    final todayMax =
        (todayDay?['maxtemp_c'] as num?)?.toDouble() ?? currentTemp;

    // Astro data for sunrise/sunset
    final astro = forecastDays.first['astro'] as Map<String, dynamic>?;
    final sunrise = (astro?['sunrise'] as String?) ?? '--:--';
    final sunset = (astro?['sunset'] as String?) ?? '--:--';

    final now = DateTime.now();

    final current = WeatherInfo(
      temperature: currentTemp,
      low: todayMin,
      high: todayMax,
      condition: conditionText,
      lastUpdated: now,
      humidity: humidity,
      windSpeed: windSpeed,
      precipitation: precipitation,
      sunrise: sunrise,
      sunset: sunset,
    );

    // Build daily forecast list (up to `days`).
    final dailyForecast = <DailyForecast>[];
    for (final dayBlock in forecastDays) {
      final dateStr = dayBlock['date'] as String?;
      final dayInfo = dayBlock['day'] as Map<String, dynamic>?;
      if (dateStr == null || dayInfo == null) continue;
      final date = DateTime.tryParse(dateStr);
      if (date == null) continue;

      final min = (dayInfo['mintemp_c'] as num?)?.toDouble();
      final max = (dayInfo['maxtemp_c'] as num?)?.toDouble();
      if (min == null || max == null) continue;

      final cond = dayInfo['condition'] as Map<String, dynamic>?;
      final code = (cond?['code'] as num?)?.toInt() ?? currentCode;

      dailyForecast.add(
        DailyForecast(date: date, low: min, high: max, weatherCode: code),
      );
    }

    // Build hourly forecast list from all forecast days.
    final hourlyForecast = <HourlyForecast>[];
    for (final dayBlock in forecastDays) {
      final hours =
          (dayBlock['hour'] as List?)?.cast<Map<String, dynamic>>() ??
          const <Map<String, dynamic>>[];
      for (final hourBlock in hours) {
        final timeStr = hourBlock['time'] as String?;
        final temp = (hourBlock['temp_c'] as num?)?.toDouble();
        if (timeStr == null || temp == null) continue;
        final time = DateTime.tryParse(timeStr);
        if (time == null) continue;

        final cond = hourBlock['condition'] as Map<String, dynamic>?;
        final code = (cond?['code'] as num?)?.toInt() ?? currentCode;

        hourlyForecast.add(
          HourlyForecast(time: time, temperature: temp, weatherCode: code),
        );
      }
    }

    return (current: current, daily: dailyForecast, hourly: hourlyForecast);
  }
}
