// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cabinets_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CabinetsResponseDto _$CabinetsResponseDtoFromJson(Map<String, dynamic> json) =>
    _CabinetsResponseDto(
      cabinets:
          (json['cabinets'] as List<dynamic>?)
              ?.map((e) => CabinetDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CabinetDto>[],
      total: (json['all_quantity'] as num?)?.toInt(),
      offlineMode: json['offline_mode'] as bool? ?? false,
    );

Map<String, dynamic> _$CabinetsResponseDtoToJson(
  _CabinetsResponseDto instance,
) => <String, dynamic>{
  'cabinets': instance.cabinets,
  'all_quantity': instance.total,
  'offline_mode': instance.offlineMode,
};
