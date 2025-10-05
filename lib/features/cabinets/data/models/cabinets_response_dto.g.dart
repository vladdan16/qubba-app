// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cabinets_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CabinetsResponseDtoImpl _$$CabinetsResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CabinetsResponseDtoImpl(
      cabinets: (json['cabinets'] as List<dynamic>)
          .map((e) => CabinetDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CabinetsResponseDtoImplToJson(
        _$CabinetsResponseDtoImpl instance) =>
    <String, dynamic>{
      'cabinets': instance.cabinets,
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
    };
