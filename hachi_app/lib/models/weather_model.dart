class WeatherInfo {
  const WeatherInfo({
    required this.temperature,
    required this.condition,
    required this.low,
    required this.high,
    required this.lastUpdated,
  });

  final double temperature;
  final double low;
  final double high;
  final String condition;
  final DateTime lastUpdated;

  WeatherInfo copyWith({
    double? temperature,
    double? low,
    double? high,
    String? condition,
    DateTime? lastUpdated,
  }) {
    return WeatherInfo(
      temperature: temperature ?? this.temperature,
      condition: condition ?? this.condition,
      low: low ?? this.low,
      high: high ?? this.high,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  factory WeatherInfo.placeholder() {
    final now = DateTime.now();
    return WeatherInfo(
      temperature: 0,
      condition: 'Updating…',
      low: 0,
      high: 0,
      lastUpdated: now,
    );
  }
}
