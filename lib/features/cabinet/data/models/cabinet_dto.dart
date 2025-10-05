import 'package:freezed_annotation/freezed_annotation.dart';

part 'cabinet_dto.freezed.dart';

part 'cabinet_dto.g.dart';

@freezed
abstract class CabinetDto with _$CabinetDto {
  const factory CabinetDto({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'userId') String? userId,
    @JsonKey(name: 'legalType') int? legalType,
    @JsonKey(name: 'taxType') int? taxType,
    @JsonKey(name: 'taxRate') int? taxRate,
    @JsonKey(name: 'unitMaintenanceCost') int? unitMaintenanceCost,
    @JsonKey(name: 'organizationName') String? organizationName,
    @JsonKey(name: 'organizationINN') String? organizationTin,
    @JsonKey(name: 'isActive') bool? isActive,
    @JsonKey(name: 'wbApiKey') String? wbApiKey,
    @JsonKey(name: 'ozonClientId') String? ozonClientId,
    @JsonKey(name: 'ozonApiKey') String? ozonApiKey,
    @JsonKey(name: 'wbApiActive') bool? wbApiActive,
    @JsonKey(name: 'ozonApiActive') bool? ozonApiActive,
    @JsonKey(name: 'ozonPerformanceClientId') String? ozonPerformanceClientId,
    @JsonKey(name: 'ozonPerformanceClientSecret')
    String? ozonPerformanceClientSecret,
  }) = _CabinetDto;

  factory CabinetDto.fromJson(Map<String, Object?> json) =>
      _$CabinetDtoFromJson(json);
}
