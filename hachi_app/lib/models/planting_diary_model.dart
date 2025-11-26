enum InputType { fertilizer, pesticide, seeds, other }

enum GrowthPhase { seedling, vegetative, reproductive, ripening }

enum QualityGrade { A, B, C }

class ProductionLot {
  const ProductionLot({
    required this.lotId,
    required this.cropId,
    required this.seedSource,
    required this.seedDate,
    required this.bedId,
    required this.expectedHarvestDate,
    this.notes,
  });

  final String lotId;
  final String cropId;
  final String seedSource;
  final DateTime seedDate;
  final String bedId;
  final DateTime expectedHarvestDate;
  final String? notes;
}

class SowingRecord {
  const SowingRecord({
    required this.seedQuantity,
    required this.mediumType,
    required this.method,
    required this.germinationRate,
  });

  final double seedQuantity;
  final String mediumType;
  final String method;
  final double germinationRate; // Percentage
}

class InputUsage {
  const InputUsage({
    required this.type,
    required this.productName,
    required this.supplier,
    required this.quantity,
    required this.unit,
    required this.applicationMethod,
    this.safetyInterval,
  });

  final InputType type;
  final String productName;
  final String supplier;
  final double quantity;
  final String unit;
  final String applicationMethod;
  final int? safetyInterval; // Days (for pesticides)
}

class PestDiseaseRecord {
  const PestDiseaseRecord({
    required this.diagnosis,
    required this.level,
    required this.treatment,
  });

  final String diagnosis;
  final String level; // low, medium, high
  final String treatment;
}

class GrowthObservation {
  const GrowthObservation({
    required this.height,
    required this.leafCount,
    required this.growthPhase,
    required this.photos,
  });

  final double height;
  final int leafCount;
  final GrowthPhase growthPhase;
  final List<String> photos;
}

class HarvestRecord {
  const HarvestRecord({
    required this.quantity,
    required this.unit,
    required this.qualityGrade,
    required this.buyer,
  });

  final double quantity;
  final String unit;
  final QualityGrade qualityGrade;
  final String buyer;
}

class PostHarvestRecord {
  const PostHarvestRecord({
    required this.washing,
    required this.packaging,
    required this.coldStorageInfo,
    required this.transportInfo,
  });

  final bool washing;
  final String packaging;
  final String coldStorageInfo;
  final String transportInfo;
}

class WorkerRecord {
  const WorkerRecord({
    required this.workerId,
    required this.name,
    required this.hasVietGapTraining,
    required this.roles,
    required this.contact,
  });

  final String workerId;
  final String name;
  final bool hasVietGapTraining;
  final String roles;
  final String contact;
}
