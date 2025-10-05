// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cabinet_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateCabinetRequestDtoImpl _$$UpdateCabinetRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateCabinetRequestDtoImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$UpdateCabinetRequestDtoImplToJson(
        _$UpdateCabinetRequestDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
    };
