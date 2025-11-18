class PlantSummary {
  const PlantSummary({
    required this.name,
    required this.location,
    required this.totalPlants,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.precipitation,
    required this.plannedActivity,
    this.image,
  });

  final String name;
  final String location;
  final int totalPlants;
  final int temperature;
  final int humidity;
  final double windSpeed;
  final double precipitation;
  final String plannedActivity;
  final String? image;
}

class PlantDetail {
  const PlantDetail({
    required this.name,
    required this.location,
    required this.totalPlants,
    required this.ageInMonths,
    required this.humidity,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
    required this.precipitation,
    required this.tasks,
    required this.temperatureTrend,
  });

  final String name;
  final String location;
  final int totalPlants;
  final int ageInMonths;
  final int humidity;
  final double windSpeed;
  final DateTime sunrise;
  final DateTime sunset;
  final double precipitation;
  final List<PlantTask> tasks;
  final List<int> temperatureTrend;
}

class PlantTask {
  const PlantTask({
    required this.name,
    required this.durationLabel,
    required this.icon,
    required this.isPrimary,
  });

  final String name;
  final String durationLabel;
  final String icon;
  final bool isPrimary;
}

const dashboardPlants = <PlantSummary>[
  PlantSummary(
    name: 'Herbs Plantation',
    location: '12 Sukun Malang, East Java, ID',
    totalPlants: 800,
    temperature: 22,
    humidity: 20,
    windSpeed: 5.0,
    precipitation: 0.0,
    plannedActivity: 'Give Fertilizer',
  ),
  PlantSummary(
    name: 'Tomato Greenhouse',
    location: '12 Sukun Malang, East Java, ID',
    totalPlants: 400,
    temperature: 24,
    humidity: 25,
    windSpeed: 4.2,
    precipitation: 1.2,
    plannedActivity: 'Check Smart Lamp',
  ),
  PlantSummary(
    name: 'Corn Plantation',
    location: '12 Sukun Malang, East Java, ID',
    totalPlants: 600,
    temperature: 26,
    humidity: 18,
    windSpeed: 5.8,
    precipitation: 0.4,
    plannedActivity: 'Inspect Sprayer',
  ),
];

final featuredPlantDetail = PlantDetail(
  name: 'Corn Plantation',
  location: '12 Sukun Malang, East Java, ID',
  totalPlants: 600,
  ageInMonths: 2,
  humidity: 20,
  windSpeed: 5.0,
  sunrise: DateTime(2025, 1, 3, 5, 20),
  sunset: DateTime(2025, 1, 3, 17, 58),
  precipitation: 2.0,
  tasks: [
    PlantTask(
      name: 'Plant Spray',
      durationLabel: '2h 30min',
      icon: 'spray',
      isPrimary: true,
    ),
    PlantTask(
      name: 'Smart Lamp',
      durationLabel: '8h 30min',
      icon: 'lamp',
      isPrimary: false,
    ),
    PlantTask(
      name: 'Room Heater',
      durationLabel: '5h 30min',
      icon: 'heater',
      isPrimary: false,
    ),
    PlantTask(
      name: 'Fertilizer Sprayer',
      durationLabel: '1h 30min',
      icon: 'fertilizer',
      isPrimary: false,
    ),
  ],
  temperatureTrend: [18, 20, 24, 26, 21],
);
