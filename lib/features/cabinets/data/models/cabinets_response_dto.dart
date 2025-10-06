import 'package:freezed_annotation/freezed_annotation.dart';

import 'cabinet_dto.dart';

part 'cabinets_response_dto.freezed.dart';
part 'cabinets_response_dto.g.dart';

@freezed
abstract class CabinetsResponseDto with _$CabinetsResponseDto {
  const factory CabinetsResponseDto({
    required List<CabinetDto> cabinets,
    int? total,
    int? limit,
    int? offset,
  }) = _CabinetsResponseDto;

  factory CabinetsResponseDto.fromJson(Map<String, Object?> json) =>
      _$CabinetsResponseDtoFromJson(json);
}
