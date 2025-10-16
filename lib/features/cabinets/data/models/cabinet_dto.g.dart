// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cabinet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CabinetDto _$CabinetDtoFromJson(Map<String, dynamic> json) => _CabinetDto(
  id: json['id'] as String,
  name: json['name'] as String,
  organizationName: json['organization_name'] as String?,
  organizationInn: json['organization_inn'] as String?,
  legalType: (json['legal_type'] as num?)?.toInt(),
  taxType: (json['tax_type'] as num?)?.toInt(),
  taxRate: (json['tax_rate'] as num?)?.toInt(),
  ndsRate: (json['nds_rate'] as num?)?.toInt(),
  taxType2024: (json['tax_type_2024'] as num?)?.toInt(),
  taxRate2024: (json['tax_rate_2024'] as num?)?.toInt(),
  unitMaintenanceCost: (json['unit_maintenance_cost'] as num?)?.toInt(),
  isActive: json['is_active'] as bool?,
  wbApiKey: json['wb_api_key'] as String?,
  wbApiActive: json['wb_api_active'] as bool?,
  ozonClientId: json['ozon_client_id'] as String?,
  ozonApiKey: json['ozon_api_key'] as String?,
  ozonPerformanceClientId: json['ozon_performance_client_id'] as String?,
  ozonPerformanceClientSecret:
      json['ozon_performance_client_secret'] as String?,
  ozonApiActive: json['ozon_api_active'] as bool?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CabinetDtoToJson(_CabinetDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'organization_name': instance.organizationName,
      'organization_inn': instance.organizationInn,
      'legal_type': instance.legalType,
      'tax_type': instance.taxType,
      'tax_rate': instance.taxRate,
      'nds_rate': instance.ndsRate,
      'tax_type_2024': instance.taxType2024,
      'tax_rate_2024': instance.taxRate2024,
      'unit_maintenance_cost': instance.unitMaintenanceCost,
      'is_active': instance.isActive,
      'wb_api_key': instance.wbApiKey,
      'wb_api_active': instance.wbApiActive,
      'ozon_client_id': instance.ozonClientId,
      'ozon_api_key': instance.ozonApiKey,
      'ozon_performance_client_id': instance.ozonPerformanceClientId,
      'ozon_performance_client_secret': instance.ozonPerformanceClientSecret,
      'ozon_api_active': instance.ozonApiActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
