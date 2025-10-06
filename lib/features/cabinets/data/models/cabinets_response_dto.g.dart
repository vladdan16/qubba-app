// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cabinets_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CabinetsResponseDto _$CabinetsResponseDtoFromJson(Map<String, dynamic> json) =>
    _CabinetsResponseDto(
      cabinets: (json['cabinets'] as List<dynamic>)
          .map((e) => CabinetDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CabinetsResponseDtoToJson(
  _CabinetsResponseDto instance,
) => <String, dynamic>{
  'cabinets': instance.cabinets,
  'total': instance.total,
  'limit': instance.limit,
  'offset': instance.offset,
};
