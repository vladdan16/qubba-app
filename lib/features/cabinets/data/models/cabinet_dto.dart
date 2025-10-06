import 'package:freezed_annotation/freezed_annotation.dart';

part 'cabinet_dto.freezed.dart';
part 'cabinet_dto.g.dart';

@freezed
abstract class CabinetDto with _$CabinetDto {
  const factory CabinetDto({
    required String id,
    required String name,
    String? description,
    String? address,
    String? phone,
    String? email,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _CabinetDto;

  factory CabinetDto.fromJson(Map<String, Object?> json) =>
      _$CabinetDtoFromJson(json);
}
