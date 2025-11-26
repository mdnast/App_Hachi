import 'package:hachi_app/models/planting_diary_model.dart';

enum ActivityType {
  landPreparation,
  sowing,
  fertilizing,
  spraying, // Pest control
  irrigation,
  care,
  growthObservation,
  harvest,
  postHarvest,
  other,
}

enum ActivityStatus { completed, inProgress, incomplete }

class ScheduleActivity {
  const ScheduleActivity({
    required this.title,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.status,
    this.type = ActivityType.other,
    this.lotId,
    this.operatorName,
    this.sowingDetails,
    this.inputDetails,
    this.pestDiseaseDetails,
    this.growthDetails,
    this.harvestDetails,
    this.postHarvestDetails,
    this.notes,
  });

  final String title;
  final String location;
  final DateTime startTime;
  final DateTime endTime;
  final ActivityStatus status;

  // VietGAP Extensions
  final ActivityType type;
  final String? lotId; // Link to ProductionLot
  final String? operatorName; // Worker performing the task
  final String? notes;

  // Specific Details based on Type
  final SowingRecord? sowingDetails;
  final InputUsage? inputDetails;
  final PestDiseaseRecord? pestDiseaseDetails;
  final GrowthObservation? growthDetails;
  final HarvestRecord? harvestDetails;
  final PostHarvestRecord? postHarvestDetails;

  ScheduleActivity copyWith({
    String? title,
    String? location,
    DateTime? startTime,
    DateTime? endTime,
    ActivityStatus? status,
    ActivityType? type,
    String? lotId,
    String? operatorName,
    String? notes,
    SowingRecord? sowingDetails,
    InputUsage? inputDetails,
    PestDiseaseRecord? pestDiseaseDetails,
    GrowthObservation? growthDetails,
    HarvestRecord? harvestDetails,
    PostHarvestRecord? postHarvestDetails,
  }) {
    return ScheduleActivity(
      title: title ?? this.title,
      location: location ?? this.location,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      type: type ?? this.type,
      lotId: lotId ?? this.lotId,
      operatorName: operatorName ?? this.operatorName,
      notes: notes ?? this.notes,
      sowingDetails: sowingDetails ?? this.sowingDetails,
      inputDetails: inputDetails ?? this.inputDetails,
      pestDiseaseDetails: pestDiseaseDetails ?? this.pestDiseaseDetails,
      growthDetails: growthDetails ?? this.growthDetails,
      harvestDetails: harvestDetails ?? this.harvestDetails,
      postHarvestDetails: postHarvestDetails ?? this.postHarvestDetails,
    );
  }
}

final sampleSchedule = <ScheduleActivity>[
  ScheduleActivity(
    title: 'Cleaning grass on the rice plant',
    location: 'Mt. Hariyono Malang, East Java, ID',
    startTime: DateTime.now().subtract(const Duration(hours: 2)),
    endTime: DateTime.now().subtract(const Duration(hours: 1)),
    status: ActivityStatus.completed,
    type: ActivityType.care,
    operatorName: 'Nguyen Van A',
  ),
  ScheduleActivity(
    title: 'Planting melon seeds',
    location: 'Mt. Hariyono Malang, East Java, ID',
    startTime: DateTime.now().add(const Duration(hours: 2)),
    endTime: DateTime.now().add(const Duration(hours: 4)),
    status: ActivityStatus.incomplete,
    type: ActivityType.sowing,
    lotId: 'LOT-2025-11-MELON-001',
    sowingDetails: const SowingRecord(
      seedQuantity: 500,
      mediumType: 'Coco Peat',
      method: 'Tray Sowing',
      germinationRate: 95.0,
    ),
  ),
  ScheduleActivity(
    title: 'Inspecting irrigation lines',
    location: 'Corn Plantation Block C',
    startTime: DateTime.now().add(const Duration(days: 1, hours: 9)),
    endTime: DateTime.now().add(const Duration(days: 1, hours: 11)),
    status: ActivityStatus.inProgress,
    type: ActivityType.irrigation,
  ),
  ScheduleActivity(
    title: 'Fertilizing Tomatoes',
    location: 'Greenhouse 1',
    startTime: DateTime.now().add(const Duration(days: 2, hours: 7)),
    endTime: DateTime.now().add(const Duration(days: 2, hours: 8, minutes: 30)),
    status: ActivityStatus.incomplete,
    type: ActivityType.fertilizing,
    lotId: 'LOT-2025-11-TOMATO-GH1',
    inputDetails: const InputUsage(
      type: InputType.fertilizer,
      productName: 'NPK 20-20-15',
      supplier: 'VietNong Co.',
      quantity: 5.0,
      unit: 'kg',
      applicationMethod: 'Drip Irrigation',
    ),
  ),
  ScheduleActivity(
    title: 'Pest Control - Spider Mites',
    location: 'Greenhouse 1',
    startTime: DateTime.now().add(const Duration(days: 3, hours: 16)),
    endTime: DateTime.now().add(
      const Duration(days: 3, hours: 17, minutes: 30),
    ),
    status: ActivityStatus.incomplete,
    type: ActivityType.spraying,
    lotId: 'LOT-2025-11-TOMATO-GH1',
    inputDetails: const InputUsage(
      type: InputType.pesticide,
      productName: 'Bio-Mite X',
      supplier: 'BioSafe',
      quantity: 200,
      unit: 'ml',
      applicationMethod: 'Foliar Spray',
      safetyInterval: 3,
    ),
    pestDiseaseDetails: const PestDiseaseRecord(
      diagnosis: 'Spider Mite Infestation',
      level: 'medium',
      treatment: 'Bio-pesticide application',
    ),
  ),
];
