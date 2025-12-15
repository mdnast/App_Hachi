class WeatherInfo {
  const WeatherInfo({
    required this.temperature,
    required this.condition,
    required this.low,
    required this.high,
    required this.lastUpdated,
    required this.humidity,
    required this.windSpeed,
    required this.precipitation,
    required this.sunrise,
    required this.sunset,
    required this.weatherCode,
  });

  final double temperature;
  final double low;
  final double high;
  final String condition;
  final DateTime lastUpdated;
  final int humidity;
  final double windSpeed;
  final double precipitation;
  final String sunrise;
  final String sunset;
  final int weatherCode;

  WeatherInfo copyWith({
    double? temperature,
    double? low,
    double? high,
    String? condition,
    DateTime? lastUpdated,
    int? humidity,
    double? windSpeed,
    double? precipitation,
    String? sunrise,
    String? sunset,
    int? weatherCode,
  }) {
    return WeatherInfo(
      temperature: temperature ?? this.temperature,
      condition: condition ?? this.condition,
      low: low ?? this.low,
      high: high ?? this.high,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
      precipitation: precipitation ?? this.precipitation,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      weatherCode: weatherCode ?? this.weatherCode,
    );
  }

  factory WeatherInfo.placeholder() {
    final now = DateTime.now();
    return WeatherInfo(
      temperature: 0,
      condition: 'Đang cập nhật…',
      low: 0,
      high: 0,
      lastUpdated: now,
      humidity: 0,
      windSpeed: 0,
      precipitation: 0,
      sunrise: '--:--',
      sunset: '--:--',
      weatherCode: 1000,
    );
  }
}

class DailyForecast {
  const DailyForecast({
    required this.date,
    required this.low,
    required this.high,
    required this.weatherCode,
  });

  final DateTime date;
  final double low;
  final double high;
  final int weatherCode;
}

class HourlyForecast {
  const HourlyForecast({
    required this.time,
    required this.temperature,
    required this.weatherCode,
  });

  final DateTime time;
  final double temperature;
  final int weatherCode;
}
