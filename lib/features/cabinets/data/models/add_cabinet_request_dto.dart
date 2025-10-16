import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_cabinet_request_dto.freezed.dart';

part 'add_cabinet_request_dto.g.dart';

@freezed
abstract class AddCabinetRequestDto with _$AddCabinetRequestDto {
  const factory AddCabinetRequestDto({
    required String name,
    @JsonKey(name: 'legal_type') required int legalType,
    @JsonKey(name: 'tax_type') required int taxType,
    @JsonKey(name: 'tax_rate') required int taxRate,
    @JsonKey(name: 'nds_rate') required int ndsRate,
    @JsonKey(name: 'tax_type_2024') required int taxType2024,
    @JsonKey(name: 'tax_rate_2024') required int taxRate2024,
    @JsonKey(name: 'organization_name') String? organizationName,
    @JsonKey(name: 'organization_inn') String? organizationInn,
    @Default(0) @JsonKey(name: 'unit_maintenance_cost') int unitMaintenanceCost,
    @Default(true) @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'wb_api_key') String? wbApiKey,
    @Default(false) @JsonKey(name: 'wb_api_active') bool wbApiActive,
    @JsonKey(name: 'ozon_client_id') String? ozonClientId,
    @JsonKey(name: 'ozon_api_key') String? ozonApiKey,
    @JsonKey(name: 'ozon_performance_client_id')
    String? ozonPerformanceClientId,
    @JsonKey(name: 'ozon_performance_client_secret')
    String? ozonPerformanceClientSecret,
    @Default(false) @JsonKey(name: 'ozon_api_active') bool ozonApiActive,
  }) = _AddCabinetRequestDto;

  factory AddCabinetRequestDto.fromJson(Map<String, Object?> json) =>
      _$AddCabinetRequestDtoFromJson(json);
}
