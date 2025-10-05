// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cabinet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CabinetDto _$CabinetDtoFromJson(Map<String, dynamic> json) => _CabinetDto(
  name: json['name'] as String,
  id: json['id'] as String?,
  userId: json['userId'] as String?,
  legalType: (json['legalType'] as num?)?.toInt(),
  taxType: (json['taxType'] as num?)?.toInt(),
  taxRate: (json['taxRate'] as num?)?.toInt(),
  unitMaintenanceCost: (json['unitMaintenanceCost'] as num?)?.toInt(),
  organizationName: json['organizationName'] as String?,
  organizationTin: json['organizationINN'] as String?,
  isActive: json['isActive'] as bool?,
  wbApiKey: json['wbApiKey'] as String?,
  ozonClientId: json['ozonClientId'] as String?,
  ozonApiKey: json['ozonApiKey'] as String?,
  wbApiActive: json['wbApiActive'] as bool?,
  ozonApiActive: json['ozonApiActive'] as bool?,
  ozonPerformanceClientId: json['ozonPerformanceClientId'] as String?,
  ozonPerformanceClientSecret: json['ozonPerformanceClientSecret'] as String?,
);

Map<String, dynamic> _$CabinetDtoToJson(_CabinetDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'userId': instance.userId,
      'legalType': instance.legalType,
      'taxType': instance.taxType,
      'taxRate': instance.taxRate,
      'unitMaintenanceCost': instance.unitMaintenanceCost,
      'organizationName': instance.organizationName,
      'organizationINN': instance.organizationTin,
      'isActive': instance.isActive,
      'wbApiKey': instance.wbApiKey,
      'ozonClientId': instance.ozonClientId,
      'ozonApiKey': instance.ozonApiKey,
      'wbApiActive': instance.wbApiActive,
      'ozonApiActive': instance.ozonApiActive,
      'ozonPerformanceClientId': instance.ozonPerformanceClientId,
      'ozonPerformanceClientSecret': instance.ozonPerformanceClientSecret,
    };
