enum ActivityStatus { completed, inProgress, incomplete }

class ScheduleActivity {
  const ScheduleActivity({
    required this.title,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  final String title;
  final String location;
  final DateTime startTime;
  final DateTime endTime;
  final ActivityStatus status;

  ScheduleActivity copyWith({
    String? title,
    String? location,
    DateTime? startTime,
    DateTime? endTime,
    ActivityStatus? status,
  }) {
    return ScheduleActivity(
      title: title ?? this.title,
      location: location ?? this.location,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
    );
  }
}

final sampleSchedule = <ScheduleActivity>[
  ScheduleActivity(
    title: 'Cleaning grass on the rice plant',
    location: 'Mt. Hariyono Malang, East Java, ID',
    startTime: DateTime(2025, 1, 3, 16, 45),
    endTime: DateTime(2025, 1, 3, 20, 20),
    status: ActivityStatus.completed,
  ),
  ScheduleActivity(
    title: 'Planting melon seeds',
    location: 'Mt. Hariyono Malang, East Java, ID',
    startTime: DateTime(2025, 1, 3, 1, 0),
    endTime: DateTime(2025, 1, 3, 3, 0),
    status: ActivityStatus.incomplete,
  ),
  ScheduleActivity(
    title: 'Inspecting irrigation lines',
    location: 'Corn Plantation Block C',
    startTime: DateTime(2025, 1, 4, 9, 30),
    endTime: DateTime(2025, 1, 4, 11, 0),
    status: ActivityStatus.inProgress,
  ),
];
