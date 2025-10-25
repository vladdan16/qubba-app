import 'package:freezed_annotation/freezed_annotation.dart';

import 'cabinet_dto.dart';

part 'cabinets_response_dto.freezed.dart';

part 'cabinets_response_dto.g.dart';

@freezed
abstract class CabinetsResponseDto with _$CabinetsResponseDto {
  const factory CabinetsResponseDto({
    @JsonKey(name: 'cabinets')
    @Default(<CabinetDto>[])
    List<CabinetDto> cabinets,
    @JsonKey(name: 'all_quantity') int? total,
    @JsonKey(name: 'offline_mode') @Default(false) bool offlineMode,
  }) = _CabinetsResponseDto;

  factory CabinetsResponseDto.fromJson(Map<String, Object?> json) =>
      _$CabinetsResponseDtoFromJson(json);
}
