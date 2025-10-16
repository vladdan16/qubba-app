import 'package:freezed_annotation/freezed_annotation.dart';

part 'cabinet_dto.freezed.dart';
part 'cabinet_dto.g.dart';

@freezed
abstract class CabinetDto with _$CabinetDto {
  const factory CabinetDto({
    required String id,
    required String name,
    @JsonKey(name: 'organization_name') String? organizationName,
    @JsonKey(name: 'organization_inn') String? organizationInn,
    @JsonKey(name: 'legal_type') int? legalType,
    @JsonKey(name: 'tax_type') int? taxType,
    @JsonKey(name: 'tax_rate') int? taxRate,
    @JsonKey(name: 'nds_rate') int? ndsRate,
    @JsonKey(name: 'tax_type_2024') int? taxType2024,
    @JsonKey(name: 'tax_rate_2024') int? taxRate2024,
    @JsonKey(name: 'unit_maintenance_cost') int? unitMaintenanceCost,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'wb_api_key') String? wbApiKey,
    @JsonKey(name: 'wb_api_active') bool? wbApiActive,
    @JsonKey(name: 'ozon_client_id') String? ozonClientId,
    @JsonKey(name: 'ozon_api_key') String? ozonApiKey,
    @JsonKey(name: 'ozon_performance_client_id')
    String? ozonPerformanceClientId,
    @JsonKey(name: 'ozon_performance_client_secret')
    String? ozonPerformanceClientSecret,
    @JsonKey(name: 'ozon_api_active') bool? ozonApiActive,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _CabinetDto;

  factory CabinetDto.fromJson(Map<String, Object?> json) =>
      _$CabinetDtoFromJson(json);
}
