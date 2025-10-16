import 'package:freezed_annotation/freezed_annotation.dart';

part 'cabinet.freezed.dart';

@freezed
abstract class Cabinet with _$Cabinet {
  const factory Cabinet({
    required String id,
    required String name,
    String? organizationName,
    String? organizationInn,
    int? legalType,
    int? taxType,
    int? taxRate,
    int? ndsRate,
    int? taxType2024,
    int? taxRate2024,
    int? unitMaintenanceCost,
    bool? isActive,
    String? wbApiKey,
    bool? wbApiActive,
    String? ozonClientId,
    String? ozonApiKey,
    String? ozonPerformanceClientId,
    String? ozonPerformanceClientSecret,
    bool? ozonApiActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Cabinet;
}
