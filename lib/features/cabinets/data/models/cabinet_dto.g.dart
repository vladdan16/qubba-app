// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cabinet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CabinetDto _$CabinetDtoFromJson(Map<String, dynamic> json) => _CabinetDto(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  address: json['address'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
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
      'description': instance.description,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
