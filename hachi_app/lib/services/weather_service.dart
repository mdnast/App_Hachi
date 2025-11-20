import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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
    final sunriseRaw = (astro?['sunrise'] as String?) ?? '--:--';
    final sunsetRaw = (astro?['sunset'] as String?) ?? '--:--';

    final sunrise = _convertTo24Hour(sunriseRaw);
    final sunset = _convertTo24Hour(sunsetRaw);

    final now = DateTime.now();

    final current = WeatherInfo(
      temperature: currentTemp,
      low: todayMin,
      high: todayMax,
      condition: _translateWeatherCondition(conditionText),
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

  /// Translate weather condition text to Vietnamese
  String _translateWeatherCondition(String condition) {
    final conditionLower = condition.toLowerCase();

    // Common weather conditions mapping
    final translations = {
      'partly cloudy': 'Có mây',
      'cloudy': 'Nhiều mây',
      'overcast': 'U ám',
      'mist': 'Sương mù',
      'patchy rain possible': 'Có thể có mưa rải rác',
      'patchy snow possible': 'Có thể có tuyết rải rác',
      'patchy sleet possible': 'Có thể có mưa tuyết rải rác',
      'patchy freezing drizzle possible': 'Có thể có mưa phùn đóng băng',
      'thundery outbreaks possible': 'Có thể có giông',
      'blowing snow': 'Tuyết thổi',
      'blizzard': 'Bão tuyết',
      'fog': 'Sương mù dày đặc',
      'freezing fog': 'Sương mù đóng băng',
      'patchy light drizzle': 'Mưa phùn nhẹ rải rác',
      'light drizzle': 'Mưa phùn nhẹ',
      'freezing drizzle': 'Mưa phùn đóng băng',
      'heavy freezing drizzle': 'Mưa phùn đóng băng nặng',
      'patchy light rain': 'Mưa nhẹ rải rác',
      'light rain': 'Mưa nhẹ',
      'moderate rain at times': 'Mưa vừa theo từng đợt',
      'moderate rain': 'Mưa vừa',
      'heavy rain at times': 'Mưa to theo từng đợt',
      'heavy rain': 'Mưa to',
      'light freezing rain': 'Mưa đóng băng nhẹ',
      'moderate or heavy freezing rain': 'Mưa đóng băng vừa hoặc nặng',
      'light sleet': 'Mưa tuyết nhẹ',
      'moderate or heavy sleet': 'Mưa tuyết vừa hoặc nặng',
      'patchy light snow': 'Tuyết nhẹ rải rác',
      'light snow': 'Tuyết nhẹ',
      'patchy moderate snow': 'Tuyết vừa rải rác',
      'moderate snow': 'Tuyết vừa',
      'patchy heavy snow': 'Tuyết nặng rải rác',
      'heavy snow': 'Tuyết nặng',
      'ice pellets': 'Mưa đá nhỏ',
      'light rain shower': 'Mưa rào nhẹ',
      'moderate or heavy rain shower': 'Mưa rào vừa hoặc to',
      'torrential rain shower': 'Mưa rào xối xả',
      'light sleet showers': 'Mưa tuyết rào nhẹ',
      'moderate or heavy sleet showers': 'Mưa tuyết rào vừa hoặc nặng',
      'light snow showers': 'Tuyết rào nhẹ',
      'moderate or heavy snow showers': 'Tuyết rào vừa hoặc nặng',
      'light showers of ice pellets': 'Mưa đá nhỏ rào nhẹ',
      'moderate or heavy showers of ice pellets':
          'Mưa đá nhỏ rào vừa hoặc nặng',
      'patchy light rain with thunder': 'Mưa nhẹ có sấm rải rác',
      'moderate or heavy rain with thunder': 'Mưa vừa hoặc to có sấm',
      'patchy light snow with thunder': 'Tuyết nhẹ có sấm rải rác',
      'moderate or heavy snow with thunder': 'Tuyết vừa hoặc nặng có sấm',
      'clear': 'Quang đãng',
      'sunny': 'Nắng',
      'fair': 'Đẹp trời',
    };

    return translations[conditionLower] ?? condition;
  }

  /// Convert 12-hour time string (e.g., "06:30 AM") to 24-hour format (e.g., "06:30")
  String _convertTo24Hour(String time12h) {
    try {
      // Remove leading/trailing spaces
      time12h = time12h.trim();

      // Parse using DateFormat
      // The input format from WeatherAPI is typically "hh:mm a" (e.g., "05:43 AM")
      final inputFormat = DateFormat('hh:mm a');
      final outputFormat = DateFormat('HH:mm');

      final dateTime = inputFormat.parse(time12h);
      return outputFormat.format(dateTime);
    } catch (e) {
      // If parsing fails, return original string
      return time12h;
    }
  }
}
